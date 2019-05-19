<?php

namespace App\Http\Middleware;

use App\Subscriptions;
use Carbon\Carbon;
use Closure;

class CheckSubscribe {
	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next) {
		$check = Subscriptions::where('user_id', auth()->user()->id)->where('ends_at', '>', Carbon::now())->first();

		if ($check) {
			return $next($request);
		}
		return redirect('plans')->with('info', 'your subscribtion is expire please renew it or choose other plan');

	}
}
