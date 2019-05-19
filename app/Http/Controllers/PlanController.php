<?php

namespace App\Http\Controllers;

use App\Plan;
use App\Subscriptions;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PlanController extends Controller {
	public function index() {

		/*
			check for plan type if type is eqaul weekly and the current user subscribred it before don`t display it again
		*/
		$subscUser = Subscriptions::where('user_id', auth()->user()->id)->where('plan_type', 'weekly')->first();

		if ($subscUser) {
			$plans = Plan::where('type', '!=', 'weekly')->get();

		} else {
			$plans = Plan::get();

		}

		return view('plans.index', compact('plans'));
	}

	public function show(Plan $plan, Request $request) {

		$subscUser = Subscriptions::where('user_id', auth()->user()->id)->where('plan_id', $plan->id)->where('ends_at', '>', Carbon::now())->first();

		if ($subscUser) {
			return redirect('plans')->with('error', trans('front.youallready_sub_plan'));
		}

		$weeklyplan = Subscriptions::where('user_id', auth()->user()->id)->where('plan_type', 'weekly')->first();

		if ($weeklyplan) {
			return redirect('plans')->with('error', trans('front.sorry_youcant_sub_weekly'));
		}

		return view('plans.show', compact('plan'));
	}
}