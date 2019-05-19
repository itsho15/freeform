<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscriptions extends Model {
	protected $fillable = [
		'payment_method',
		'payment_id',
		'plan_id',
		'status',
		'quantity',
		'ends_at',
		'user_id',
		'total_paid',
		'extra_days',
		'username',
		'user_email',
		'image',
		'payment_date',
		'plan_type',
		'description',
	];

}
