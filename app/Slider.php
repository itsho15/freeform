<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class Slider extends Model {
	use Translatable, Resizable;
	protected $translatable = ['title', 'content'];
}
