@extends('layouts.app')

@section('content')
    <!---------- Start Slider ---------->
    <section id="slider">
        <div class="home-slider">
            @foreach($slider as $slid)
            <div class="item">
                <div class="img" style="background-image: url({{Voyager::image($slid->image)}})"></div>
                <div class="container">
                    <div class="text">
                        <h1>{{ $slid->getTranslatedAttribute('title', session('lang') ) }}</h1>
                        {!! $slid->getTranslatedAttribute('content', session('lang') ) !!}

                        <a href="{{ $slid->link }}" class="btn-style btn-red">{{ trans('front.subscribe') }}</a>
                    </div>
                </div>
            </div>
            @endforeach

        </div>
    </section>

    <!---------- End slider ---------->

    <!---------- Start Services ---------->
    <section id="services">
        <div class="col-xs-12 title">

            @if(lang() == 'ar')
            {!! setting('homepage.services_ar') !!}
            @else
            {!! setting('homepage.services') !!}
            @endif
        </div>
        <div class="wagbat-blocks col-xs-12">
            <div class="container">

                @foreach($services as $index => $service)
                <div class="card col-md-4 col-xs-12">
                    <div class="c-inner">
                        <div class="inner_head">
                            <span>{{ $index+1 }}</span>
                            {!! $service->getTranslatedAttribute('name', session('lang') ) !!}
                        </div>
                        <div class="inner_body">
                            <img src="{{Voyager::image($service->thumbnail('cropped', 'image'))}}" alt="">
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>
        <div class="container-line">
            <div class="container-line-center">
                <div class="line-item one"></div>
                <div class="line-item two"></div>
                <div class="line-item four"></div>
                <div class="line-item five"></div>
                <div class="line-item six"></div>
            </div>
        </div>
    </section>
    <!---------- End Services ---------->


 <!---------- Start Projects ---------->
<section id="memberships">
    <div class="container">
        <div class="m-inner col-xs-12">
            <div class="col-xs-12 title">

                @if(lang() == 'ar')
                {!! setting('homepage.subscription_content_ar') !!}
                @else
                {!! setting('homepage.subscription_content') !!}
                @endif

            </div>
            <div class="m-body col-xs-12">
                <div class="bin-slider">

                    @foreach($plans as $plan)

                        <div class="b-inn">
                            <div class="inner">
                                <div class="i-top">
                                     @if($plan->image)
                                        <img src="{{ Storage::url($plan->image) }}" alt="">
                                    @endif
                                    <h3>{{ $plan->getTranslatedAttribute('name', session('lang') ) }} </h3>
                                    @if($plan->cost)
                                     <h5> {{ number_format($plan->cost, 2) }} {{ trans('front.RS') }}  {{ trans('front.'.$plan->type) }}</h5>
                                     @endif
                                    {!!  $plan->getTranslatedAttribute('description', session('lang') )  !!}
                                </div>
                                <div class="i-bottom">
                                    <a href="{{ route('plans.show', $plan->slug) }}" class="btn-style">{{ trans('front.subscribe') }}</a>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>
</section>
    <!---------- End Projects ---------->


    <!---------- Start Clients ---------->
    <!--
    <section id="clients">
        <div class="container">
            <div class="clients">
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".3s" src="images/c1.png" alt="" />
                </div>
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".5s" src="images/c1.png" alt="" />
                </div>
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".7s" src="images/c1.png" alt="" />
                </div>
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".9s" src="images/c1.png" alt="" />
                </div>
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay="1.1s" src="images/c1.png" alt="" />
                </div>
                <div class="item">
                    <img class="wow fadeIn" data-wow-duration="1.1s" data-wow-delay="1.4s" src="images/c1.png" alt="" />
                </div>
            </div>
        </div>
    </section>
-->
    <!---------- End Clients ---------->
@endsection
