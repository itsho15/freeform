@extends('layouts.app')

@section('content')
 <div class="subs-sec">
        <div class="container">


            <div class="subs-data col-md-7 col-xs-12">
                @if($plan->cost)
                    <div class="col-xs-12">
                        <h4>{{ $plan->cost }} {{ trans('front.RS') }} {{ trans('front.monthly') }}</h4>
                    </div>
                @endif

                @if($plan->test_price)
                    <div class="col-xs-12">
                        <h4>{{ $plan->test_price }} {{ trans('front.RS') }} {{ trans('front.fortestplan') }}</h4>
                        <p class="text-center">{{ trans('front.noteforweekly') }}</p>
                    </div>
                @endif

                @if($plan->price_per_day)
                    <div class="col-xs-12">
                        <h4>{{ $plan->price_per_day }} {{ trans('front.RS') }} {{ trans('front.forextraday') }}</h4>

                    </div>
                @endif
            </div>

            <div class="subs-pricing">

                @if($plan->type != 'private')

                    <div class="pricing-r col-md-6 col-xs-12">
                        <h3>{{ trans('front.payment_methods') }}</h3>

                        <form method="post" action="{{ url('paypal') }}" id="paypalSubmit">
                            @csrf

                            <input type="hidden" name="plan_id" value="{{ $plan->id }}" />
                            <input type="hidden" name="amount" value="{{ $plan->cost }}" />
                            <input type="hidden" name="per_day" value="{{ $plan->price_per_day }}" />
                            <input type="hidden" name="test_price" value="{{ $plan->test_price }} " />
                            <input type="hidden" name="plan_type" value="{{ $plan->type }}" />
                            <input type="hidden" name="plan_name" value="{{ $plan->name }}" />




                            <div class="form-group ">
                                <select name="plan_test_or_real" class="form-control" id="plan_test_or_real">
                                    <option value="">{{ trans('front.selectmonthlyOrTest') }}</option>
                                     <option value="monthly">{{ trans('front.monthly') }}</option>
                                    <option value="test">{{ trans('front.test') }}</option>
                                </select>
                            </div>


                            <div class="form-group hidden_if_choose_weakly hide">

                                <label for="qty" class="col-form-label text-md-right">{{ trans('front.selectmonths') }}</label>

                                <select name="qty" class="form-control" id="qty">
                                    @for($i=1; $i <= 12; $i++)
                                        <option value='{{ $i }}'
                                                @if($i == 1)
                                                    {{ 'selected' }}
                                                @endif
                                                >
                                            {{ $i }}
                                         </option>
                                    @endfor
                                </select>
                            </div>

                            <div class="form-group hidden_if_choose_weakly hide">

                                <label for="extra_day" class="col-form-label text-md-right">{{ trans('front.selectextradays') }}</label>

                                <select name="extra_day" class="form-control" id="extra_day">
                                    <option value="">...</option>
                                    @for($i=1; $i <= 8; $i++)
                                        <option
                                                value='@if($plan->type == 'yearly') {{ $i * 12 }} @else {{ $i }} @endif'>
                                                @if($plan->type == 'yearly') {{ $i * 12 }}
                                                 @else {{ $i }}
                                                @endif
                                            {{ trans('front.day') }}
                                        </option>
                                    @endfor
                                </select>
                            </div>

                            <div class="form-group hidden_if_choose_weakly hide">
                                <div class="text-center alert alert-success h4">{{ trans('front.totalpay') }} <span class="total">{{ $plan->cost }}</span></div>
                            </div>


                             <a href="#" id="paypal">
                                <img src="{{ url('images/pay.png') }}" alt="paypal">
                            </a>
                        </form>

                    </div>

                @else

                    <div class="pricing-l col-md-6 col-xs-12">
                    <h3>{{ trans('front.typeyourprivateplan') }}</h3>

                        <form action="{{ url('cash_payment') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="plan_id" value="{{ $plan->id }}" />
                            <input type="hidden" name="plan_type" value="{{ $plan->type }}" />
                            <input type="hidden" name="plan_name" value="{{ $plan->name }}" />

                            <div class="form-group">
                                <h5>{{ trans('front.name') }}</h5>
                                <input type="text" class="form-control" value="{{ auth()->user()->name }}" name="username">
                            </div>

                            <div class="form-group">
                                <h5>{{ trans('front.email') }} </h5>
                                <input type="email" class="form-control" value="{{ auth()->user()->email }}" name="user_email">
                            </div>

                            <div class="form-group">
                                <textarea name="description" class="form-control" rows="4" style="height:100%;" placeholder="{{ trans('front.description_plan') }} "></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit" name="privateplan" class="btn">{{ trans('front.request_private_plan') }}</button>
                            </div>

                        </form>
                     </div>


                @endif

                <div class="pricing-l col-md-6 col-xs-12">
                    <h3>{{ trans('front.image_forpay') }}</h3>

                    <form action="{{ url('cash_payment') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="plan_id" value="{{ $plan->id }}" />
                        <input type="hidden" name="plan_type" value="{{ $plan->type }}" />
                        <input type="hidden" name="plan_name" value="{{ $plan->name }}" />

                        <div class="form-group">
                            <h5>{{ trans('front.name') }}</h5>
                            <input type="text" class="form-control" value="{{ auth()->user()->name }}" name="username">
                        </div>

                        <div class="form-group">
                            <h5>{{ trans('front.email') }} </h5>
                            <input type="email" class="form-control" value="{{ auth()->user()->email }}" name="user_email">
                        </div>

                        <div class="form-group">
                        <h5>{{ trans('front.image_rec') }}</h5>
                                <div class="input-group">
                                    <label class="input-group-btn">
                                        <span class="btn">
                                            <i class="fa fa-cloud-upload"></i>
                                            <input type="file" style="display: none;"  name="image">
                                        </span>
                                    </label>
                                    <input type="text" class="form-control" readonly="" placeholder="No file Selected">
                                </div>
                        </div>

                        <div class="form-group">
                            <h5>{{ trans('front.payment_date') }}</h5>
                            <input type="date" class="form-control" name="payment_date">
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn">{{ trans('front.send') }}</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('js')
    <script type="text/javascript">
        $('#paypal').click(function(event){
            event.preventDefault();
            $('#paypalSubmit').submit();
        });

        $('#plan_test_or_real').on('change',function(){
            var type = $(this).val();
            console.log();
            if(type == 'monthly'){
                $('.hidden_if_choose_weakly').removeClass('hide');
            }else{
                 $('.hidden_if_choose_weakly').addClass('hide');
                 $('#qty').val(1);
                 $('#extra_day').val(null);
            }
        });



        $('#qty,#extra_day').on('change',function(){

            var qty = $('#qty').val();
            var extra_day = $('#extra_day').val();
            var costprice = "{{ $plan->cost }}";
            var price_per_day = "{{ $plan->price_per_day }}";
            var total =  (qty * costprice) + ( extra_day * price_per_day * qty );
            console.log("qnt"+qty);
            console.log("ext"+extra_day);
            $('.total').html(total);
        });

    </script>
@endpush