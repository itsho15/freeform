@extends('layouts.app')

@section('content')
<div class="meals">
    <div class="container">
        <div class="col-xs-12 title">
            <h1 class="wow fadeInDown" style="visibility: visible;">{{ trans('front.know_our_meals') }}</h1>
        </div>

        <div class="m-side col-md-3 col-xs-12">
            <div class="side-inner">
                <ul>

                    @foreach($categories as $category)
                        <li class="{{ ( $category->childs->count() > 0 ) ? 'has-mega' :'' }}">
                            <a href="{{ url('categories-menu/'.$category->slug) }}">  {{ $category->getTranslatedAttribute('name', session('lang') ) }} </a>
                            @if(count($category->childs))
                                @include('categories_menu.manageChild',['childs' => $category->childs])
                            @endif
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>

         <div class="m-body col-md-9 col-xs-12">
            @if($menulist->count() > 0)
            @foreach($menulist as $menu)

                <div class="block col-md-6 col-xs-12">
                    <div class="inner">
                        <div class="i-img" @if($menu->image) style="background-image: url( {{ Voyager::image( $menu->image ) }} )" @endif >
                            <a href="{{ url('menu/'.$menu->slug) }}">
                                <div class="i-cap">
                                    <h3>{{ $menu->getTranslatedAttribute('name', session('lang') ) }}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            @endforeach
            <div class="col-xs-12 flex-center" align="center">
             {!! $menulist->links() !!}
            </div>
            @else
                <h1 class="text-center"> {{ trans('front.no_meals_found') }}</h1>
            @endif

        </div>

    </div>
</div>
@endsection