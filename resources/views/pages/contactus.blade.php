@extends('layouts.app')

@section('content')

 <!---------- End Header ---------->
<div class="contact-us">
    <div class="container">
        <div class="cont-data col-md-6 col-xs-12">
             {!! $page->getTranslatedAttribute('body', session('lang') ) !!}


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
        <div class="cont-form col-md-6 col-xs-12">


              <form action="{{ url('contact') }}" method="POST">
              	 @csrf
                    <div class="form-group">

	                    <select id="subject"  name="contact_type" class="form-control" required="required">

                             <option value="{{ trans('front.inquiry') }}">{{ trans('front.inquiry') }}</option>
                             <option value="{{ trans('front.suggestion') }}">{{ trans('front.suggestion') }}</option>
                             <option value="{{ trans('front.problem') }}">{{ trans('front.problem') }}</option>
                             <option value="{{ trans('front.like') }}">{{ trans('front.like') }}</option>

	                    </select>

	                </div>

	                <div class="form-group">
	                    <input name="contact_name" type="text" class="form-control" id="name" placeholder="من فضلك ادخل اسمك" required="required" value="{{ auth()->user() ? auth()->user()->name : '' }}" />
	                </div>

	                <div class="form-group">
	                    <input type="email" name="contact_email" class="form-control" id="email" placeholder="من فضلك ادخل البريد الالكتروني" required="required" value="{{ auth()->user() ? auth()->user()->email : '' }}" />
	                </div>

	                <div class="form-group">
	                    <textarea class="form-control" placeholder="الرسالة" name="contact_message"></textarea>
	                </div>

	                <div class="form-group">
	                    <button type="submit" class="btn">{{ trans('front.send') }}</button>
	                </div>

                @if(session()->has('message'))
                 <div class="alert alert-success" > <strong> {{ session()->get('message') }} </strong>  </div>
                @endif
               </form>
        </div>
    </div>
</div>

@endsection