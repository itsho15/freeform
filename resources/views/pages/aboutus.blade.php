@extends('layouts.app')

@section('content')
<div class="about-inner col-xs-12">
    <div class="container">
        <div class="g-body col-md-12 col-xs-12">

            <div class="ab-ex col-xs-12">
                <div class="ex-img col-md-6 col-xs-12">
                    <div class="i-img" style="background-image: url( {{ Voyager::image($page->image) }} )"></div>
                </div>
                <div class="ex-data col-md-6 col-xs-12">
                    {!! $page->getTranslatedAttribute('about', session('lang') ) !!}
                </div>
            </div>

         	{!! $page->getTranslatedAttribute('body', session('lang') ) !!}

        </div>
    </div>
</div>
@endsection