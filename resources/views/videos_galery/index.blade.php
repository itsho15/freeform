@extends('layouts.app')

@section('content')

  <div class="gallery">
        <div class="container">
            <div class="col-xs-12 title">
            <h1 class="wow fadeInDown" style="visibility: visible;">{{ trans('front.seeourgallery') }}</h1>
        </div>
            <div class="g-body col-xs-12">
                <ul class="nav-tabs">
                    <li class="@if(request('select') == 'video') {{ 'active'  }} @endif">
                        <a href="{{ url('videos-galery?select=video') }}" >{{ trans('front.videos') }}</a>
                    </li>
                    <li class="@if(request('select') == 'gallery') {{ 'active'  }} @endif">
                        <a href="{{ url('videos-galery?select=gallery') }}" >{{ trans('front.galleries') }}</a>
                    </li>
                </ul>
                <div class="tab-content">
                    @if(request('select') == 'video')
                    <div class="tab-pane fade @if(request('select') == 'video') {{ 'active'  }} @endif in">
                        <div class="row">
                            @if($videos->count() > 0)
                            @foreach($videos as $video)

                                <div class="block col-md-4 col-xs-12">
                                    <div class="inner">
                                        <iframe src="{{ $video->vidoe_link }}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <!--
                                        <video controls>
                                            <source src="images/vid.mp4" type="video/mp4">
                                        </video>
        -->

                                    </div>
                                </div>

                            @endforeach

                            {!! $videos->render() !!}

                            @else

                                <div class="block col-xs-12">
                                        <div class="inner">
                                            <p class="text-center">{{ trans('front.no_videos') }}</p>
                                        </div>
                                </div>

                            @endif

                        </div>
                    </div>
                    @endif

                    @if(request('select') == 'gallery')

                        <div class="tab-pane fade @if(request('select') == 'gallery') {{ 'active in'  }} @endif " >
                            <div class="row">
                                @if($galleries->count() > 0)
                                @foreach($galleries as $galery)

                                    <div class="block col-md-4 col-xs-12">
                                        <div class="inner">
                                            <a href="{{ Voyager::image($galery ) }}" class="fancybox" rel="gallery">
                                                <div class="i-img" style="background-image: url({{ Voyager::image($galery ) }})"></div>
                                            </a>
                                        </div>
                                    </div>
                                @endforeach

                                {!! $galleries->render() !!}
                                @else

                                    <div class="block col-xs-12">
                                        <div class="inner">
                                            <p class="text-center">{{ trans('front.no_gallery') }}</p>
                                        </div>
                                    </div>

                                @endif

                            </div>
                        </div>
                    @endif

                </div>
            </div>
        </div>
    </div>
@endsection
