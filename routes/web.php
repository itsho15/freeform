<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', 'HomeController@index');

Route::group(['prefix' => 'admin'], function () {
	Voyager::routes();
	Route::any('approve/{id}', array('as' => 'approve', 'uses' => 'SubscribtionPaymentsController@approve'));
});

Auth::routes();

Route::get('markAsRead', 'HomeController@markAsReadNotification');

Route::resource('orders', 'OrderController');

Route::group(['middleware' => 'auth'], function () {

	Route::get('/plans', 'PlanController@index')->name('plans.index');
	Route::get('/plan/{plan}', 'PlanController@show')->name('plans.show');

	Route::get('paypal', array('as' => 'payment.status', 'uses' => 'PaymentController@getPaymentStatus'));
	Route::post('paypal', array('as' => 'addmoney.paypal', 'uses' => 'PaymentController@postPaymentWithpaypal'));

	Route::post('cash_payment', 'PaymentController@cash_payment');

});

Route::resource('/categories-menu', 'MenuCategories');
Route::get('/menu/{slug}', 'MenuCategories@showMenusingle');
Route::post('subscribe', 'NewsletterController@store');
Route::post('/contact', "ContactController@store");

Route::group(['middleware' => 'CheckSubscribe'], function () {
	/*
		 all routes when user subscribtion not expire
	*/
	Route::get('/test', function () {
		echo 'i`m subscribred';
	});

});

// change lang back-end and front-end
Route::get('lang/{lang}', function ($lang) {
	session()->has('lang') ? session()->forget('lang') : '';
	$lang == 'ar' ? session()->put('lang', 'ar') : session()->put('lang', 'en');
	return back();
});

/*
Handle pages
 */

Route::get('pages/{slug}', ['uses' => 'PagesController@getPage'])->where('slug', '([A-Za-z0-9\-\/]+)');

Route::resource('videos-galery', 'VideosImagesController');

Route::get('clear', function () {

	\Artisan::call('config:clear');
	\Artisan::call('config:cache');
	\Artisan::call('view:clear');
	return "Cache is cleared";
});