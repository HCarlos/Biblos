@extends('layouts.app')

@section('contenedor')
    @php $IsModal = $IsModal  ?? false @endphp
    <div class="card bcard" id="contentMain">
        <div class="navbar-intro justify-content-xl-start bgc-transparent pr-lg-3 w-auto">
            @include('share.bars.___breadcrumbs')
            @include('share.bars.___toolbar_catalogo')
        </div>
        <div class="card-body  ">
            {{$Tabla}}
        </div>
    </div>

@endsection

@section('style-header')

<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/datatable-plus/dataTables.bootstrap4.css' ) }} ">
<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/datatable-plus/jquery.dataTables.css' ) }} ">
<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/datatable-plus/responsive.dataTables.css' ) }} ">

@endsection

@section('script-footer')

<script type="text/javascript">
    localStorage.FullScreen = {{$FullScreen ?? 0}};
    localStorage.ItemsForTable = {{ config('ibt.items_for_table')  }};
</script>

<script src="{{ asset('assets/js/datatable-plus/dataTables.fixedHeader.min.js') }}"></script>
<script src="{{ asset('assets/js/datatable-plus/dataTables.responsive.js') }}"></script>
<script src="{{ asset('assets/js/datatable-plus/dataTables-call.js') }}"></script>
<script src="{{ asset('assets/js/datatable-plus/jquery.dataTables.js') }}"></script>

<script src="{{ asset('assets/js/datatable.js') }}"></script>


@endsection
