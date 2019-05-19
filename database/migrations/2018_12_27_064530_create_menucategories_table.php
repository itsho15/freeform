<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateMenucategoriesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('menucategories', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name', 191)->nullable();
			$table->string('image', 191)->nullable();
			$table->string('icon', 191)->nullable();
			$table->timestamps();
			$table->integer('parent_id')->unsigned()->nullable();
			$table->integer('order')->nullable()->default(1);
			$table->string('slug')->nullable()->unique();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('menucategories');
	}

}
