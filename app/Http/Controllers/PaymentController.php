<?php
namespace App\Http\Controllers;

use App\Plan;
use App\Subscriptions;
use Carbon\Carbon;
use Currency;
/** All Paypal Details class **/
use Illuminate\Http\Request;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;
use Redirect;

class PaymentController extends HomeController {

	private $_api_context;
	private $Currency;
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct() {
		parent::__construct();

		/** setup PayPal api context **/
		$paypal_conf        = \Config::get('paypal');
		$this->_api_context = new ApiContext(new OAuthTokenCredential($paypal_conf['client_id'], $paypal_conf['secret']));
		$this->_api_context->setConfig($paypal_conf['settings']);
		$this->Currency = 'USD';
	}

	/**
	 * Store a details of payment with paypal.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function postPaymentWithpaypal() {

		$payer = new Payer();
		$payer->setPaymentMethod('paypal');
		$item_1          = new Item();
		$plan            = Plan::whereId(request('plan_id'))->first();
		$amountconverted = request('amount') / 3.75; // convert SAR to USD
		$per_day         = request('per_day') / 3.75; // convert SAR to USD

		/*
			check if plan is != Weekly Cuz weekly is paid for 1 time only and disable for the user
		*/

		if (request('plan_test_or_real') == 'test') {

			$amountconverted = request('test_price') / 3.75; // convert SAR to USD

			$item_1->setName(request('plan_name'))
				->setCurrency($this->Currency)
				->setQuantity(1)
				->setPrice($amountconverted);

			$total = $amountconverted;

			// add item to list
			$item_list = new ItemList();
			$item_list->setItems(array($item_1));

			$amount = new Amount();
			$amount->setCurrency($this->Currency)
				->setTotal($amountconverted);
		} else {

			if (request('extra_day')) {

				$price = ($per_day * request('extra_day')) + $amountconverted;

				$item_1->setName(request('plan_name'))
					->setCurrency($this->Currency)
					->setQuantity(request('qty'))
					->setPrice($price);

				$total = (request('qty') * $price);
				dd($total);

				// add item to list
				$item_list = new ItemList();
				$item_list->setItems(array($item_1));

				$amount = new Amount();
				$amount->setCurrency('USD')
					->setTotal($total);

			} else {

				$item_1->setName(request('plan_name'))
					->setCurrency($this->Currency)
					->setQuantity(request('qty'))
					->setPrice($amountconverted);
				$total = request('qty') * $amountconverted;

				// add item to list
				$item_list = new ItemList();
				$item_list->setItems(array($item_1));

				$amount = new Amount();
				$amount->setCurrency($this->Currency)
					->setTotal($total);
			}
		}

		$transaction = new Transaction();
		$transaction->setAmount($amount)
			->setItemList($item_list)
			->setDescription('Your transaction description');

		$redirect_urls = new RedirectUrls();
		$redirect_urls->setReturnUrl(route('payment.status')) /** Specify return URL **/
			->setCancelUrl(route('payment.status'));

		$payment = new Payment();
		$payment->setIntent('Sale')
			->setPayer($payer)
			->setRedirectUrls($redirect_urls)
			->setTransactions(array($transaction));
		/** dd($payment->create($this->_api_context));exit; **/

		try {
			$payment->create($this->_api_context);
		} catch (\PayPal\Exception\PPConnectionException $ex) {
			if (\Config::get('app.debug')) {

				session()->flash('error', 'Connection timeout');
				return redirect('plans');
				/** echo "Exception: " . $ex->getMessage() . PHP_EOL; **/
				/** $err_data = json_decode($ex->getData(), true); **/
				/** exit; **/
			} else {

				session()->flash('error', 'Some error occur, sorry for inconvenient');
				return redirect('plans');
				/** die('Some error occur, sorry for inconvenient'); **/
			}
		}

		foreach ($payment->getLinks() as $link) {
			if ($link->getRel() == 'approval_url') {
				$redirect_url = $link->getHref();
				break;
			}
		}

		/** add payment ID to session **/
		session()->put('paypal_payment_id', $payment->getId());
		$alldate               = request()->all();
		$alldate['total_paid'] = $total;
		session()->put('planinfo', $alldate);

		if (isset($redirect_url)) {
			/** redirect to paypal **/
			return Redirect::away($redirect_url);
		}

		session()->flash('error', 'Unknown error occurred');
		return redirect('plans');
	}

	public function getPaymentStatus() {
		/** Get the payment ID before session clear **/
		$payment_id = session('paypal_payment_id');

		if (empty(request('PayerID')) || empty(request('token'))) {
			session()->flash('error', 'Payment failed');
			return redirect('plans');
		}

		$payment = new Payment();
		$payment->setId($payment_id);
		$payment->get($payment_id, $this->_api_context);
		/** PaymentExecution object includes information necessary **/
		/** to execute a PayPal account payment. **/
		/** The payer_id is added to the request query parameters **/
		/** when the user is redirected from paypal back to your site **/
		$execution = new PaymentExecution();
		$execution->setPayerId(request('PayerID'));
		/**Execute the payment **/
		$result = $payment->execute($execution, $this->_api_context);
		/** dd($result);exit; /** DEBUG RESULT, remove it later **/
		if ($result->getState() == 'approved') {

			/** it's all right **/
			/** Here Write your database logic like that insert record or value in database if you want **/
			$extra_days = (isset(session('planinfo')['extra_day'])) ? session('planinfo')['extra_day'] : 0;
			$qty        = (isset(session('planinfo')['qty'])) ? session('planinfo')['qty'] : 1;

			/*
				check if request is a test plan and change the type from monthly to weekly
				cuz we are checking the plan type in middleware if type is eqaul weekly disable for the current user
			*/

			if (session('planinfo')['plan_test_or_real'] == 'test') {
				$plan_type = 'weekly';
			} else {
				$plan_type = session('planinfo')['plan_type'];
			}

			/*
				Check The Type of Plan [ monthly , yearly , weekly]
			*/
			if ($plan_type == 'monthly') {
				$ends_at = Carbon::now()->addMonths($qty);
			} elseif (session('planinfo')['plan_type'] == 'yearly') {
				$ends_at = Carbon::now()->addYears($qty);
			} else {
				$ends_at = Carbon::now()->addWeeks($qty);
			}
			/*
				insert Subscriptions info
			*/
			Subscriptions::create([
				'payment_method' => 'paypal',
				'payment_id'     => $payment_id,
				'plan_id'        => session('planinfo')['plan_id'],
				'status'         => 'paid',
				'quantity'       => $qty,
				'ends_at'        => $ends_at,
				'user_id'        => auth()->user()->id,
				'extra_days'     => $extra_days,
				'total_paid'     => session('planinfo')['total_paid'] * 3.75, // convert USD to SAR
				'plan_type'      => $plan_type,
			]);
			session()->flash('info', trans('front.payment_success'));

			/** clear the session payment ID **/

			session()->forget('paypal_payment_id');
			return redirect('plans');
		}

		session()->flash('error', trans('front.payment_failed'));

		return redirect('plans');
	}

	public function cash_payment() {
		/*
			============================
				check if user request for private plan or not
			============================

		*/
		if (request()->has('privateplan')) {

			$this->validate(request(), [
				'description' => 'required|string',
				'username'    => 'required|string',
				'user_email'  => 'required|string',
			]);

			Subscriptions::create([
				'payment_method' => 'request for Pritvate plan',
				'payment_id'     => null,
				'plan_id'        => request('plan_id'),
				'status'         => 'pending',
				'quantity'       => null,
				'ends_at'        => null,
				'user_id'        => auth()->user()->id,
				'description'    => request('description'),
				'payment_date'   => null,
				'username'       => request('username'),
				'user_email'     => request('user_email'),
				'plan_type'      => request('plan_type'),
			]);

		} else {

			$this->validate(request(), [
				'image'        => 'required|' . v_image(),
				'payment_date' => 'required|date',
				'username'     => 'required|string',
				'user_email'   => 'required|string',
			]);

			$image = request()->file('image')->store('cashpayment');

			Subscriptions::create([
				'payment_method' => 'cash',
				'payment_id'     => null,
				'plan_id'        => request('plan_id'),
				'status'         => 'pending',
				'quantity'       => null,
				'ends_at'        => null,
				'user_id'        => auth()->user()->id,
				'image'          => $image,
				'payment_date'   => request('payment_date'),
				'username'       => request('username'),
				'user_email'     => request('user_email'),
				'plan_type'      => request('plan_type'),
			]);

		}

		session()->flash('info', trans('front.recored_added'));
		/** clear the session payment ID **/

		return redirect('plans');
	}
}