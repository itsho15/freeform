<?php

namespace App\Actions;

use App\Subscriptions;
use Carbon\Carbon;
use TCG\Voyager\Actions\AbstractAction;

class SubscribeMassActions extends AbstractAction {
	public function getTitle() {
		return 'Bulk Approve';
	}

	public function getIcon() {
		return 'voyager-check';
	}

	public function getPolicy() {
		return 'read';
	}

	public function getAttributes() {
		return [
			'class' => 'btn btn-sm btn-primary',
		];
	}

	public function getDefaultRoute() {

		return route('approvedSubscribe');
	}

	public function massAction($ids, $comingFrom) {
		// Do something with the IDs
		if (count($ids) > 1) {
			foreach ($ids as $key => $id) {
				Subscriptions::where('id', $id)->update([
					'ends_at' => Carbon::now()->addMonths(1),
					'status'  => 'paid',
				]);
			}
			session()->flash('message', 'Approved Successfully');

		} else {
			session()->flash('message', 'You haven\'t selected anything');
		}
		return redirect($comingFrom);

	}

	public function shouldActionDisplayOnDataType() {
		return $this->dataType->slug == 'subscriptions';
	}

}