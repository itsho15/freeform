@extends('layouts.app')

@section('content')
<div class="contact-us">
    <div class="container">
        <div class="title col-md-12">
            <h3>{{ trans('front.register') }}</h3>
        </div>
        <div class="cont-form reg col-md-6 col-xs-12">
           <form method="POST" action="{{ route('register') }}">
                        @csrf

                <div class="form-group">
                    <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autofocus placeholder="{{ trans('front.full_name') }}">

                    @if ($errors->has('name'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('name') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required placeholder="{{ trans('front.email') }}">

                    @if ($errors->has('email'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="{{ trans('front.password') }}">

                    @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required placeholder="{{ trans('front.password_confirmation') }}">
                </div>


                <div class="form-group">
                    <input id="address" type="text" class="form-control" name="address" required placeholder="{{ trans('front.address') }}">

                     @if ($errors->has('address'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('address') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="city" type="text" class="form-control" name="city" required placeholder="{{ trans('front.city') }}">
                    @if ($errors->has('city'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('city') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="zip_code" type="text" class="form-control" name="zip_code" required placeholder="{{ trans('front.zip_code') }}">
                    @if ($errors->has('zip_code'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('zip_code') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <input id="phone" type="text" class="form-control" name="phone" required placeholder="{{ trans('front.phone') }}">
                    @if ($errors->has('phone'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('phone') }}</strong>
                        </span>
                    @endif
                </div>

                <div class="form-group">
                    <!-- Add captcha here -->
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">  {{ trans('front.register') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
