<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMenuListsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('menu_lists', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 191);
			$table->string('price', 191)->nullable();
			$table->string('image')->nullable();
			$table->string('rate', 191)->nullable();
			$table->timestamps();
			$table->integer('category_id')->unsigned()->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('menu_lists');
	}

}
