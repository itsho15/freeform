<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class MenuCategory extends Model {
	use Translatable,
		Resizable;
	protected $table        = 'menucategories';
	protected $translatable = ['name'];

	protected $fillable = ['slug', 'name'];

	public function menulist() {
		return $this->hasMany('App\MenuList', 'category_id', 'id')
			->orderBy('created_at', 'DESC');
	}

	public function parentId() {
		return $this->belongsTo(self::class);
	}

	public function childs() {
		return $this->hasMany('App\MenuCategory', 'parent_id', 'id');
	}
}
