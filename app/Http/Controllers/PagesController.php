<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use TCG\Voyager\Models\Page;

class PagesController extends Controller {
	public function index() {
		$page = Page::where('slug', '/')->where('active', 1)->first();
		return view('page')->with('page', $page);
	}

	public function getPage($slug = null) {

		$page = Page::where('slug', $slug)->where('status', 'active');
		$page = $page->first();

		switch ($slug) {
		case 'aboutus':
			return view('pages.aboutus')->with('page', $page);
			break;
		case 'contactus':
			return view('pages.contactus')->with('page', $page);
			break;
		default:
			return view('pages.index')->with('page', $page);
			break;
		}
	}
}