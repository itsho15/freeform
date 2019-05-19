<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Video extends Model {
	use Translatable;
	protected $translatable = ['description'];
}
