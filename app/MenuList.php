<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class MenuList extends Model {
	use Translatable,
		Resizable;

	protected $translatable = ['name', 'desc'];
}
