<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\MenuCategory;
use App\MenuList;

class MenuCategories extends Controller {
	public function index() {
		$lastCat    = MenuCategory::withTranslations()->first();
		$categories = MenuCategory::withTranslations()->paginate(4);

		$posts = MenuList::withTranslations()->get();
		return view('categories_menu.index', compact('categories', 'posts', 'lastCat'));
	}

	public function show($slug) {

		$categories = MenuCategory::withTranslations()->where('parent_id', '=', null)->get();

		$cat = MenuCategory::whereSlug($slug)->firstOrFail();

		$childsIds = $cat->childs->pluck('id');

		/*
			 check if category has childs or not if category has childs return where ids to get all parents menu list
		*/
		if ($childsIds->count() > 0) {
			$menulist = $cat->MenuList()->OrwhereIn('category_id', $childsIds)->paginate(4);
		} else {
			$menulist = $cat->MenuList()->paginate(4);
		}

		return view('categories_menu.show', compact('cat', 'categories', 'menulist'));
	}

	public function showMenusingle($slug) {

		$menu = MenuList::withTranslations()->whereSlug($slug)->first();
		return view('categories_menu.showMenusingle', compact('menu'));
	}
}
