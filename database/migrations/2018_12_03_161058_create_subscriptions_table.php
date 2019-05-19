<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionsTable extends Migration {
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('subscriptions', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('user_id');
			$table->string('payment_method');
			$table->string('payment_id');
			$table->string('plan');
			$table->string('status');
			$table->string('extra_days')->nullable();
			$table->integer('total_paid');
			$table->integer('quantity');
			$table->timestamp('ends_at')->nullable();
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::dropIfExists('subscriptions');
	}
}
