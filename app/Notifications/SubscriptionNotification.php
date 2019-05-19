<?php

namespace App\Notifications;

use App\Plan;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Mail;

class SubscriptionNotification extends Notification {
	use Queueable;

	private $details;

	/**
	 * Create a new notification instance.
	 *
	 * @return void
	 */
	public function __construct($details) {
		$this->details = $details;
	}

	/**
	 * Get the notification's delivery channels.
	 *
	 * @param  mixed  $notifiable
	 * @return array
	 */
	public function via($notifiable) {
		return ['mail', 'database'];
	}

	/**
	 * Get the mail representation of the notification.
	 *
	 * @param  mixed  $notifiable
	 * @return \Illuminate\Notifications\Messages\MailMessage
	 */
	public function toMail($notifiable) {

		return (new MailMessage)
			->greeting($this->details['greeting'])
			->line($this->details['body'])
			->action($this->details['actionText'], $this->details['actionURL'])
			->line($this->details['thanks']);

	}

	/**
	 * Get the array representation of the notification.
	 *
	 * @param  mixed  $notifiable
	 * @return array
	 */
	public function toDatabase($notifiable) {

		$plan = Plan::whereId($this->details['plan_id'])->first();
		return [
			'plan_id'          => $plan->id,
			'plan_name'        => $plan->name,
			'plan_type'        => $plan->type,
			'plan_cost'        => $plan->cost,
			'plan_description' => $plan->description,
		];

	}
}
