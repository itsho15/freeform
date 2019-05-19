<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Spatial;

class Order extends Model {
	use Spatial;

	protected $spatial  = ['address'];
	protected $fillable = ['address', 'name', 'email', 'phone', 'meal_id'];
}
