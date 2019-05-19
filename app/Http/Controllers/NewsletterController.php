<?php

namespace App\Http\Controllers;

use App\Newsletter;
use Illuminate\Http\Request;

class NewsletterController extends Controller {
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		//
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request) {

		$data = $this->validate(request(),
			[
				'email' => 'required|email|unique:newsletters',
			]);

		Newsletter::create($data);

		return redirect()->back()->with('success', 'Thank You For Your Subscription We Will Send You An Email When Our WebSite Is Ready');

	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\Newsletter  $subscribe
	 * @return \Illuminate\Http\Response
	 */
	public function show(Newsletter $subscribe) {
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\Newsletter  $subscribe
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Newsletter $subscribe) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\Newsletter  $subscribe
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, Newsletter $subscribe) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\Newsletter  $subscribe
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Newsletter $subscribe) {
		//
	}
}
