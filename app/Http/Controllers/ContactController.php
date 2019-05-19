<?php

namespace App\Http\Controllers;

use App\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller {

	public function store(Request $request) {

		$this->validate($request, [

			'contact_name'    => 'required|min:5|max:100',
			'contact_email'   => 'required|min:5|max:100',
			//'contact_subject'	=> 'required|min:5|max:100',
			'contact_message' => 'required|min:5|max:100',
			'contact_type'    => 'required|string',

		]);

		Contact::create([

			'contact_name'    => request('contact_name'),
			'contact_email'   => request('contact_email'),
			'contact_message' => request('contact_message'),
			'contact_type'    => request('contact_type'),

		]);

		session()->flash('message', trans('front.sendcontact_sucss'));

		return redirect()->back();

	}
}
