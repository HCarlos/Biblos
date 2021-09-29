@extends('layouts.app')

@section('contenedor')
    @php $IsModal = $IsModal  ?? false @endphp
    <div class="card bcard" id="contentMain">
        <div class="card-header bgc-primary-d1 text-white border-0">
            @include('share.bars.___toolbar_catalogo')
            <h4 class="text-40">
                <h3>{{$tituloTabla}}</h3>
            </h4>
        </div>
        <hr>
        <div class="card-body p-0 border-x-1 border-b-1 brc-default-m4 radius-0 overflow-hidden p-2">
            {{$Tabla}}
        </div>
        @include('share.bars.___paginator')
    </div>
    <div class="card bcard " id="contentPropertie"></div>
    <div class="card bcard " id="contentLevel3"></div>
    <div class="card bcard " id="contentLevel4"></div>
    <div class="card bcard " id="contentLevel5"></div>

@endsection
@section('script-footer')
    <script type="text/javascript">
        localStorage.FullScreen = {{$FullScreen ?? 0}}
    </script>
@stop
