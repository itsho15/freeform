<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Traits\Translatable;

class Pages extends Model
{
    use Translatable;

    protected $translatable = ['title', 'about', 'body'];
}

