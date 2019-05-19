<?php

namespace App\Http\Controllers;
use App\Subscriptions;
use Carbon\Carbon;

class SubscribtionPaymentsController extends Controller {

	/**
	 * approve the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function approve($id) {
		$Subscriptions = Subscriptions::find($id)->first();
		if ($Subscriptions->status == 'paid') {
			session()->flash('message', 'Allready Approved');
			return redirect()->back();
		}
		Subscriptions::where('id', $id)->update([
			'ends_at' => Carbon::now()->addMonths(1),
			'status'  => 'paid',
		]);

		session()->flash('message', 'Approved Successfully');
		return redirect()->back();
	}
}
