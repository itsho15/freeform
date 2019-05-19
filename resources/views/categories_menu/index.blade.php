@extends('layouts.app')

@section('content')

<div class="meals">
        <div class="container">
            <div class="col-xs-12 title">
                <h1 class="wow fadeInDown" style="visibility: visible;">{{ trans('front.know_our_meals') }}</h1>
            </div>
            <div class="m-body col-xs-12">

                @foreach($categories as $key => $category)

                    @if ($loop->first)

                        <div class="block col-md-3 col-xs-12">
                            <div class="inner tall">
                                <div class="i-img" style="background-image: url({{ Voyager::image($category->image) }})">
                                    <a href="{{ url('categories-menu/'.trim($category->slug)) }}">
                                        <div class="i-cap">
                                            <h3>{{ $category->getTranslatedAttribute('name', session('lang') ) }}</h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                    @endif


                    @if ($loop->first) <div class="block col-md-9 col-xs-12">  @endif

                    @if($key > 0 )

                            <div class="inner @if($key == 3) col-md-12 @else col-md-6  @endif col-xs-12">
                                <div class="i-img" style="background-image: url( {{ Voyager::image($category->image) }} )">
                                    <a href="{{ url('categories-menu/'.trim($category->slug)) }}">
                                        <div class="i-cap">
                                            <h3>{{ $category->getTranslatedAttribute('name', session('lang') ) }}</h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                    @endif


                    @if ($loop->last) </div>  @endif

                @endforeach

            </div>

            <div class="flex-center" align="center">
                 {!! $categories->links() !!}
            </div>
        </div>
    </div>
@endsection