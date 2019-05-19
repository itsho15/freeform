@extends('layouts.app')

@section('content')
 <div class="single-meal">
        <div class="meal-bg" style="background-image: url({{ Voyager::image($menu->image) }})"></div>
        <div class="meal-dets">
            <div class="container">

                <div class="dets-img col-md-6 col-xs-12">

                        @foreach(json_decode( $menu->images ) as $image)
                            <img src="" />
                             <a href="{{ Voyager::image($image) }}" class="fancybox" rel="gallery" style="background-image: url({{ Voyager::image($image) }})"></a>
                        @endforeach
                </div>

                <div class="dets-data col-md-6 col-xs-12">
                    
                    {!! $menu->getTranslatedAttribute('desc', session('lang') ) !!}
                </div>

            </div>
        </div>

        <div class="meal-btns">
            <div class="container">

             <button type="button" class="btn " data-toggle="modal" data-target="#exampleModal">
              {{ trans('front.order_now') }}
             </button>

           {{--  <a href="#" class="btn" data-toggle="modal" data-target="#spec-meal">
                <i class="fa fa-cogs"></i>
            </a> --}}
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

                <form action="{{ route('orders.store') }}" method="POST" enctype="multipart/form-data">
                   {{ csrf_field() }}
                    <input type="hidden" value="{{ $menu->id }}" name="meal_id">
                    <div class="form-group">
                          <label for="name"> Your Name </label>
                          <input type="text" name="name" value="{{ userData('name') }}" class="form-control">
                    </div>

                    <div class="form-group">
                          <label for="email"> Your email </label>
                          <input type="text" name="email" value="{{ userData('email') }}" class="form-control">
                    </div>

                     <div class="form-group">
                          <label for="phone"> Your phone </label>
                          <input type="text" name="phone" value="{{ userData('phone') }}"  class="form-control">
                    </div>

                    <div class="form-group">
                          <label for="address"> Your address </label>
                          <input type="text" name="address" value="{{ userData('address') }}"  class="form-control">
                    </div>

                    <hr>

                    <div class="form-group">

                    <button type="submit" class="btn btn-success btn-block">
                      <i class="fa fa-paper-plane"></i>
                       {{ trans('front.order_now') }}
                    </button>

                    </div>

                </form>

              </div>

            </div>
          </div>
        </div>
    </div>
@endsection