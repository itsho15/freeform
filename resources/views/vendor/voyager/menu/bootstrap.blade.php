@if(!isset($innerLoop))

    @if (isset($options->sidebar) && $options->sidebar == true)
            <ul class="nav sidebar-nav">
    @else
        <ul class="nav navbar-nav margin">
    @endif

@else
<ul class="dropdown-menu">
@endif

@php

    if (Voyager::translatable($items)) {
        $items = $items->load('translations');
    }


@endphp

@foreach ($items as $item)

    @php

        $originalItem = $item;
        if (Voyager::translatable($item)) {
            $item = $item->translate($options->locale);
        }

        $listItemClass = null;
        $linkAttributes =  null;
        $styles = null;
        $icon = null;
        $caret = null;

        // Background Color or Color
        if (isset($options->color) && $options->color == true) {
            $styles = 'color:'.$item->color;
        }
        if (isset($options->background) && $options->background == true) {
            $styles = 'background-color:'.$item->color;
        }

        if(url($item->link()) == url()->current()){
                $active = 'td-current-item';
            }else{
                $active = '';
        }

        // With Children Attributes
        if(!$originalItem->children->isEmpty()) {
            $linkAttributes =  'class="dropdown-toggle" data-toggle="dropdown"';
            $caret = '<span class="caret"></span>';

            if(url($item->link()) == url()->current()){
                $listItemClass = 'dropdown active';
            }else{
                $listItemClass = 'dropdown';
            }
        }

        // Set Icon

        if($item->icon_class != null){
            $icon = '<i class="' . $item->icon_class . '"></i>';
        }


    @endphp

    <li class="{{ $listItemClass }}">
        <a class="{{ $active }}" href="{{ url($item->link()) }}" target="{{ $item->target }}" style="{{ $styles }}" {!! isset($linkAttributes) ? $linkAttributes : '' !!}>
            {!! $icon !!}
            <span>{{ $item->title }}</span>
            {!! $caret !!}
        </a>
        @if(!$originalItem->children->isEmpty())
        @include('voyager::menu.bootstrap', ['items' => $originalItem->children, 'options' => $options, 'innerLoop' => true])
        @endif
    </li>
@endforeach
@if(!isset($innerLoop))
@guest
        <li >
            <a class="nav-link" href="{{ route('login') }}">{{ trans('front.login') }}</a>
        </li>
        <li >
            @if (Route::has('register'))
                <a class="nav-link" href="{{ route('register') }}">{{ trans('front.register') }}</a>
            @endif
        </li>
    @else

        <li class="nav-item dropdown">
            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                {{ Auth::user()->name }} <span class="caret"></span>
            </a>

            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="{{ route('logout') }}"
                   onclick="event.preventDefault();
                                 document.getElementById('logout-form').submit();">
                    {{ trans('front.logout') }}
                </a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            </ul>
        </li>

         <li class="nav-item dropdown">
            <a id="notify" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
               @if(auth()->user()->unreadNotifications->count() > 0)
                    {{ auth()->user()->unreadNotifications->count() }}
               @endif

                <span class="fa fa-bell"></span>
            </a>

            <ul class="dropdown-menu dropdown-menu-right notify" aria-labelledby="notify">
                @if(auth()->user()->unreadNotifications->count() > 0)
                 <li> <a href="{{ url('markAsRead') }}"> {{ trans('front.markallRead') }} </a></li>
                    @foreach (auth()->user()->unreadNotifications as $notification)
                       <li> {{ trans('front.yourplan') }} {{ $notification['data']['plan_name'] }} {{trans('front.expireafter2days')}} </li>
                    @endforeach
                @else
                    <li>  {{ trans('front.Empty_notification') }} </li>
                @endif
            </ul>
        </li>

    @endguest

@endif

</ul>

