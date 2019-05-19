@extends('layouts.app')

@section('content')
<div class="container pt-5" style="padding-top: 5rem !important;">
    <h1>
      {{ $page->title }}
    </h1>
    <div class="page-content__wrap">
      {!! $page->body !!}
    </div>
</div>
@endsection