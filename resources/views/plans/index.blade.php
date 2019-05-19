@extends('layouts.app')

@section('content')

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
@endsection
