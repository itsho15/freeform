 <section class="newsletter" style="background-image: url({{ url('images/hero.jpg') }})">
        <div class="container">
            <div class="n-data">
                <h3>{{ trans('front.are_you_ready_toTry') }} </h3>
                <p>{{ trans('front.try_it_now') }}</p>
            </div>
            <div class="n-extra">
                <a href="{{ url('plans') }}" class="btn-style">{{ trans('front.subscribe') }}</a>
            </div>
        </div>
    </section>
<!---------- Start Footer ---------->
    <footer class="topf">
        <p id="top"><a class="top"></a></p>
        <div class="container">
            <div class="col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".3s">
                <h1>{{ trans('front.newsletter') }}</h1>

                <form class="contact100-form validate-form" action="{{ url('subscribe') }}" method="POST">
                    {{ csrf_field() }}
                    <input type="email" placeholder="{{ trans('front.email') }}"  name="email" value="{{ old('email') }}" />
                    <i class="fa fa-envelope"></i>
                    <input type="submit" value="&#xf060;" />
                </form>

                <ul class="social-media-f">

                    @if(setting('social.facebook'))
                         <li><a href="{{ setting('social.facebook') }}"><i class="fa fa-facebook"></i></a></li>
                    @endif

                    @if(setting('social.twitter'))
                         <li><a href="{{ setting('social.twitter') }}"><i class="fa fa-twitter"></i></a></li>
                    @endif

                    @if(setting('social.google'))
                         <li><a href="{{ setting('social.google') }}"><i class="fa fa-google-plus"></i></a></li>
                    @endif

                </ul>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".5s">
                <h1>{{ trans('front.pagelinks') }}</h1>
                <ul class="links">
                    @foreach($pages as $page)
                        <li><a href="{{ url('pages/'.$page->slug) }}">{{ $page->getTranslatedAttribute('title', session('lang'))  }}</a></li>

                    @endforeach
                </ul>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 wow fadeIn" data-wow-duration="1.1s" data-wow-delay=".7s">
                <h1>{{ trans('front.contactus') }}</h1>

                 <ul>
                     @if(setting('site.address') != null)
                    <li>
                        <i class="fa fa-map-marker"></i>
                         {{ setting('site.address') }}
                    </li>
                    @endif

                    @if(setting('site.email') != null)
                    <li>
                        <i class="fa fa-envelope"></i>
                         {{ setting('site.email') }}
                    </li>

                     @endif
                     @if(setting('site.phone') != null)
                    <li>
                        <i class="fa fa-phone"></i>
                         {{ setting('site.phone') }}
                    </li>

                     @endif
                </ul>

            </div>
        </div>
    </footer>



    <footer class="bottomf">
        <div class="container">
             <div class="col-md-6 col-sm-12 col-xs-12 ">
                <p> {{ trans('front.copyright') }}</p>
            </div>

            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="ryad-logo">
                    <a href="http://elryad.com" title="تصميم مواقع">
                        <svg height="90" width="102">
                            <line x1="0" y1="0" x2="90" y2="0" style="stroke:rgb(255,255,255);stroke-width:35" />
                            <line x1="100" y1="0" x2="0" y2="10" style="stroke:rgb(255,255,255);stroke-width:20; transform:rotate(40deg)" />
                            <line x1="10" y1="95" x2="50" y2="45" style="stroke:rgb(255,255,255);stroke-width:20;" />
                        </svg>
                        <div class="lolo-co">

                             <p>{{ trans('front.elryad') }}</p>
                            <span> {{ trans('front.elryadcopyright') }}</span>
                        </div>
                    </a>
                </div>
            </div>


        </div>
    </footer>
    <!---------- End Footer ---------->
    <script src="{{ asset('js/all.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    {{--
     <script src="{{ asset('') }}js/jquery-1.11.0.min.js"></script>
    <script src="{{ asset('') }}js/bootstrap.js"></script>
    <script src="{{ asset('') }}js/bootstrap-carousel.js"></script>
    <script src="{{ asset('') }}js/owl.carousel.min.js"></script>
    <script src="{{ asset('') }}js/wow.min.js"></script>
    <script src="{{ asset('') }}js/responsiveCarousel.min.js"></script>
    <script src="{{ asset('') }}js/nprogress.js"></script>
    <script src="{{ asset('') }}js/jquery.fancybox.js"></script>
    <script src="{{ asset('') }}js/java.js"></script>
    --}}

    <script>
        $(window).load(function() {
            $('.loader').fadeOut(500);
        });
        NProgress.start();
        window.onload = function() {
            NProgress.done();
        }
    </script>
    @stack('js')
</body>

</html>