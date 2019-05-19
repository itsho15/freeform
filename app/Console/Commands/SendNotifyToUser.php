<?php

namespace App\Console\Commands;
use App\Notifications\SubscriptionNotification;
use App\Plan;
use App\Subscriptions;
use App\User;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Notification;

class SendNotifyToUser extends Command {
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'command:SendNotifyToUser';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Send Notify To User Before Subscribtion expired';

	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Execute the console command.
	 *
	 * @return mixed
	 */
	public function handle() {

		$Subscriptions = Subscriptions::where('plan_type', '!=', 'weekly')->whereBetween('ends_at', [Carbon::now(), Carbon::now()->addDays(2)])->get();

		foreach ($Subscriptions as $key => $subscription) {

			$user = User::whereId($subscription->user_id)->first();
			$plan = Plan::whereId($subscription->plan_id)->first();

			$details = [
				'greeting'   => 'Hi ' . $user->name,
				'body'       => 'Your Subscribtion Will be Expired After 2days',
				'thanks'     => 'Thank you for using freeform.com!',
				'actionText' => 'View plans',
				'actionURL'  => url('/plans'),
				'plan_id'    => $subscription->plan_id,
				'user_email' => $user->email,
			];

			Notification::send($user, new SubscriptionNotification($details));
		}

	}
}
