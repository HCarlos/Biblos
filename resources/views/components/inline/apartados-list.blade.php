@extends('layouts.app')

@section('contenedor')
    @php $IsModal = $IsModal  ?? false @endphp
    <div class="card bcard" id="contentMain">
        <div class="navbar-intro justify-content-xl-start bgc-transparent pr-lg-3 w-auto">
{{--            @include('share.bars.___breadcrumbs')--}}
{{--            @include('share.bars.___toolbar_catalogo')--}}
        </div>

        <div class="card-body  ">
            {{$Content}}
        </div>
        {{--        @include('share.bars.___paginator')--}}
    </div>

@endsection
@section('script-footer')
    <script type="text/javascript">
        localStorage.FullScreen = {{$FullScreen ?? 0}}
    </script>
@stop
