<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
    <base href="../" />

    <title>{{ config('app.name')  }}</title>
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/bootstrap/dist/css/bootstrap.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/@fortawesome/fontawesome-free/css/fontawesome.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/@fortawesome/fontawesome-free/css/regular.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/@fortawesome/fontawesome-free/css/brands.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/@fortawesome/fontawesome-free/css/solid.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('node_modules/free-jqgrid/css/ui.jqgrid.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('dist/css/ace-font.css' ) }} ">
    <link rel="stylesheet" type="text/css" href="{{ asset('dist/css/ace.css' ) }} ">
    <link rel="icon" type="image/png" href="{{ asset('assets/favicon.png' ) }} "/>
    <link rel="stylesheet" type="text/css" href="{{ asset('views/pages/cards/@page-style.css' ) }} ">

    @yield('style-header')

</head>

<body>
<div class="body-container  m-0 p-0">
    @auth()
        @include('layouts.partials.navbar')
        <div class="main-container bgc-white m-0 p-0">
            @include('layouts.partials.side-bar')
            <div class="main-content ">
                <div class="page-content m-0 ">
                    @yield('contenedor')
                    @include('layouts.partials.footer')
                </div>
            </div>
        </div>
    @else
        @yield('contenedor')
    @endauth
</div>

<div class="modal fade " id="modalFull" data-backdrop-bg="bgc-grey-tp4" data-blur="true" tabindex="-1" role="dialog" aria-labelledby="modalFull" aria-hidden="true"  >
    <div class="modal-dialog " role="document"  >
        <div class="modal-content border-0 shadow radius-1"  >
            @yield('ModalBlurred')
        </div>
    </div>
</div>

<div class="modal fade " id="modalFullScreen" tabindex="-1" role="dialog" data-backdrop-bg="bgc-grey-tp4"  data-blur="true"  aria-labelledby="modalFullScreen" aria-hidden="true">
    <div class="modal-dialog " role="document"  >
        <div class="modal-content border-0 shadow radius-1"  style="width: 800px !important;">
            @yield('ModalBlurredFS')
        </div>
    </div>
</div>

<script src="{{ asset('node_modules/jquery/dist/jquery.js') }}"></script>
<script src="{{ asset('node_modules/popper.js/dist/umd/popper.js') }}"></script>
<script src="{{ asset('node_modules/bootstrap/dist/js/bootstrap.js') }}"></script>
<script src="{{ asset('node_modules/sortablejs/Sortable.js') }}"></script>
<script src="{{ asset('node_modules/free-jqgrid/js/jquery.jqgrid.src.js') }}"></script>
<script src="{{ asset('dist/js/ace.js') }}"></script>
<script src="{{ asset('app/browser/demo.js') }}"></script>
<script src="{{ asset('node_modules/free-jqgrid/js/jquery.jqgrid.src.j') }}s"></script>
<script src="{{ asset('views/pages/cards/@page-script.js') }}"></script>
@yield('script-footer')
<script src="{{ asset('assets/js/ibt.js') }}"></script>

</body>
</html>
