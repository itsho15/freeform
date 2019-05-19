<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;

class AppServiceProvider extends ServiceProvider {
	/**
	 * Register any application services.
	 *
	 * @return void
	 */
	public function register() {
		//
	}

	/**
	 * Bootstrap any application services.
	 *
	 * @return void
	 */
	public function boot() {
		\Schema::defaultStringLength(191);

		view()->composer('*', function ($view) {
			$view->with([

				'plans' => \App\Plan::all(),
				'pages' => \TCG\Voyager\Models\Page::where('status', 'ACTIVE')->get(),
			]);

		});
		/*
			 Voyager Custom Action
		*/
		Voyager::addAction(\App\Actions\SubscribeActions::class);
		Voyager::addAction(\App\Actions\SubscribeMassActions::class);

		/*
			check the subscribtion if will be expire before 2days and notify the user
		*/

	}
}
