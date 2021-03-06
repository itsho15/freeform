@extends('layouts.app')

@section('content')
 <div class="contact-us">
    <div class="container">
        <div class="title col-md-12">
            <h3>{{ trans('front.login') }}</h3>
        </div>
        <div class="cont-form reg col-md-6 col-xs-12">
            <form method="POST" action="{{ route('login') }}">
                @csrf

                        <div class="form-group">

                            <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus placeholder="{{ trans('front.email') }}">

                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="form-group ">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="{{ trans('front.password') }}">

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div>

                        <div class="form-group ">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ trans('front.rememberMe') }}
                                    </label>
                                </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-12">
                                <button type="submit" class="btn ">
                                    {{ trans('front.login') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                         {{ trans('front.forgetpass') }}
                                    </a>
                                @endif
                            </div>
                        </div>
            </form>
        </div>
    </div>
</div>
@endsection
