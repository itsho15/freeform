<?php
if (!function_exists('lang')) {
	function lang() {
		if (session('lang') == 'ar') {
			\Config::set('voyager.multilingual.rtl', true);
		} else {
			\Config::set('voyager.multilingual.rtl', false);
		}
		if (session()->has('lang')) {
			return session('lang');
		} else {
			if (auth()->check() && empty(session('lang'))) {
				\Config::set('voyager.multilingual.rtl', true);
				session()->put('lang', 'ar');
				return session('lang');
			}
		}
	}
}

if (!function_exists('active_menu')) {
	function active_menu($link) {
		if (in_array($link, Request::segments())) {
			return 'current-menu-item';
		}

	}
}

if (!function_exists('direction')) {
	function direction() {
		if (session()->has('lang')) {
			if (session('lang') == 'ar') {
				return 'rtl';
			} else {
				return 'ltr';
			}
		} else {
			return 'rtl';
		}
	}
}
/////// Validate Helper Functions ///////
if (!function_exists('v_image')) {
	function v_image($ext = null) {
		if ($ext === null) {
			return 'image|mimes:jpg,jpeg,png,gif,bmp';
		} else {
			return 'image|mimes:' . $ext;
		}

	}
}

/////// Validate Helper Functions ///////
if (!function_exists('userData')) {
	function userData($column) {
		if (auth()->check()) {
			return auth()->user()->$column;
		} else {
			return '';
		}
	}
}
