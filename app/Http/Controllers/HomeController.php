<?php

namespace App\Http\Controllers;
use App\Notifications\SubscribtionNotification;
use App\Service;
use App\Slider;
use App\User;
use Notification;

class HomeController extends Controller {
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct() {
		//$this->middleware('auth');
	}

	/**
	 * Show the application dashboard.
	 *
	 * @return \Illuminate\Contracts\Support\Renderable
	 */
	public function index() {

		$services = Service::all();
		$slider   = Slider::all();
		return view('home', compact('services', 'slider'));
	}

	public function sendNotification() {
		$user = User::first();

		$details = [
			'greeting'   => 'Hi Artisan',
			'body'       => 'This is my first notification from ItSolutionStuff.com',
			'thanks'     => 'Thank you for using ItSolutionStuff.com tuto!',
			'actionText' => 'View My Site',
			'actionURL'  => url('/'),
			'order_id'   => 101,
		];

		Notification::send($user, new SubscribtionNotification($details));

		dd('done');
	}
	public function markAsReadNotification() {
		auth()->user()->unReadNotifications->markAsRead();

		return redirect()->back();
	}
}
