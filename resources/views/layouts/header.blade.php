<!DOCTYPE html>
<html class="no-js" dir="rtl" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>

    <meta name="keywords" content="{{ setting('site.keywords') }}">
    <meta charset="utf-8">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="author" content="elryad company">
    <meta name="description" content="{{ setting('site.description') }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>

           @if(lang() == 'ar')
            {{ setting('site.title_ar') }}
            @else
            {{ setting('site.title') }}
            @endif

        </title>
    <link rel="shortcut icon" type="image/x-icon" href="{{ Voyager::image( setting('site.favicon') )  }}" />

     <noscript>
        <link href="{{ asset('css/all.css') }}" rel="style" as="style" type="text/css" media="all"/>
    </noscript>

    <script>
        /* First CSS File */
        var giftofspeed = document.createElement('link');
        giftofspeed.rel = 'stylesheet';
        giftofspeed.href = '{{ asset('css/all.css') }}';
        giftofspeed.type = 'text/css';
        giftofspeed.media = 'all';
        var godefer = document.getElementsByTagName('link')[0];
        godefer.parentNode.insertBefore(giftofspeed, godefer);

    </script>


    @if( direction() == 'ltr')
        <link href="{{ asset('css/style-en.css') }}" rel="stylesheet" type="text/css" />
    @else
        <link href="{{ asset('css/bootstrap-rtl.min.css') }}" rel="stylesheet">
    @endif

</head>

<body>

<div id="loading">
<div class="loading"></div>
</div>

<!---------- Start Header ---------->
<header>
<div class="container">
    <div class="col-md-3 col-sm-5 col-xs-7">
        <a href="{{ url('/') }}" class="logo">
            <img src="{{ Voyager::image( setting('site.logo') ) }}" alt="" />
        </a>
    </div>
    <div class="col-md-9 col-sm-7 col-xs-5">
        <!---------- Start Nav ---------->

        <nav class="navbar navbar-inverse moved">
            <div class="col-md-10 col-sm-5 col-xs-5">
                <div class="collapse navbar-collapse" id="myNavbar">

                    {!! menu('site','bootstrap') !!}

                </div>
                <!---------- Start SideBar ---------->
                <div class="none">
                    <div id="page-content-wrapper">
                        <button type="button" class="hamburger is-closed" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
                    </div>
                    <div id="wrapper">
                        <div class="overlay" data-toggle="offcanvas"></div>
                        <!-- Sidebar -->
                        <nav class="navbar navbar-inverse navbar-fixed-top none" id="sidebar-wrapper" role="navigation">
                            <div class="sidebar-social">
                                <a href="{{ url('/') }}">
                                    <img src="{{ Voyager::image( setting('site.logo') ) }}" alt="">
                                </a>
                            </div>

                            {!! menu('site','bootstrap',['sidebar'=>true]) !!}
                        </nav>
                    </div>
                </div>
                <!---------- End SideBar ---------->
            </div>
            <div class="col-md-2 col-sm-7 col-xs-7">

                <div class="nav navbar-nav navbar-left">
                    @if(lang() == 'ar')
                        <a href="{{ url('lang/en') }}" class="lang">EN <i class="fa fa-globe"></i></a>
                    @else
                        <a href="{{ url('lang/ar') }}" class="lang">AR <i class="fa fa-globe"></i></a>
                    @endif

                </div>
            </div>
        </nav>
        <!---------- End Nav ---------->
    </div>
</div>
</header>
<!---------- End Header ---------->
