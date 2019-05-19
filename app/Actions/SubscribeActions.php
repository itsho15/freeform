<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class SubscribeActions extends AbstractAction {
	public function getTitle() {
		return 'Approve it ';
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
		$SubscribtionModel = $this->data->getModel();

		return route('approve', $SubscribtionModel->id);
	}

	public function shouldActionDisplayOnDataType() {
		return $this->dataType->slug == 'subscriptions';
	}

}