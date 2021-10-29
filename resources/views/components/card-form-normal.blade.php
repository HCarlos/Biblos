@extends('layouts.app')

@section('contenedor')

    <div class="card bcard" id="contentMain">
        <div class="navbar-intro justify-content-xl-start bgc-transparent pr-lg-3 w-auto">
            @include('share.bars.___breadcrumbs')
        </div>

        <div class="card-body  ">
            @include('share.otros.___erros-forms')
            <form method="{{$Method}}" action="{{ route($Route) }}"  accept-charset="UTF-8" @if($IsUpload) enctype="multipart/form-data" @endif >
                @csrf
                @if( !$IsNew )
                    {{ method_field('PUT') }}
                @endif
                {{ $items_forms }}
                @include('share.bars.___foot-bar-1')
            </form>
        </div>
        @include('share.bars.___paginator')
    </div>

@endsection
