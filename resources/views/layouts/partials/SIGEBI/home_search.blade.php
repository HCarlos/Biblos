@extends('layouts.app')

@section('contenedor')

    <div class="py-1 px-1 py-lg-1 px-lg-1">

    <div class="text-center fa-4x">
        <span class="text-100 text-white-tp1 d-sm-none"><!-- smaller text to fit in small devices -->
            SIGEBI 2022
        </span>
        <span class="text-110 text-white-tp1 d-none d-sm-inline">
            SIGEBI 2022
        </span>
{{--        <picture>--}}
{{--            <source--}}
{{--                media="(min-width: 650px)"--}}
{{--                srcset="{{ asset('assets/image/Lab/abstract_blue_background.jpg') }}">--}}
{{--            <source--}}
{{--                media="(min-width: 465px)"--}}
{{--                srcset="{{ asset('assets/image/Lab/abstract_blue_background.jpg') }}">--}}
{{--            <img--}}
{{--                src="{{ asset('assets/image/Lab/abstract_blue_background.jpg') }}"--}}
{{--                alt="image">--}}
{{--        </picture>--}}
    </div>


    <div class="text-center fa-4x text-orange-d2 letter-spacing-4">

{{--        404--}}

    </div>


    <div class="text-center">
      <span class="text-150 text-primary-d2">
{{--          Page not found...--}}
      </span>
    </div>


    <div class="text-dark-m2 text-110 text-center text-md-left mt-45">
        Buscar material por Título ó Autor
    </div>
    <form class="frmSearchLibro" name="frmSearchLibro" id="frmSearchLibro" >
        <div class="d-flex mt-3">
            <div class="flex-grow-1">
                <input type="text" class="form-control form-control-lg pr-425 searchBook" name="searchBook" id="searchBook" placeholder="Escribe un título ó autor ...">
            </div>
            <i class="fa fa-search align-self-center ml-n4 text-secondary-d1"></i>
            <button type="submit" class="btn btn-primary btn-raised text-600 ml-25">
                Buscar
            </button>
        </div>
    </form>
    <div class="col-lg-12 " id="itemsLibros" >
    </div>

    <div class="mt-4 text-105 bgc-secondary-l4 py-2 px-3 radius-1" id="sugerencias">

    <span class="text-600 text-dark-m3">
      Sugerencia:
    </span>

        <ul class="list-unstyled mt-3 mx-sm-3 mb-0 text-dark-m2 ">
            <li class="my-2">
                <i class="fa fa-circle text-xs text-blue-d1 align-middle mr-1"></i>
                Utilia palabras claves como: <code>Matemáticas, baldor</code>
            </li>

            <li class="my-2">
                <i class="fa fa-circle text-xs text-blue-d1 align-middle mr-1"></i>
                Verifica la <code>Disponibilidad</code> y el <code>Estatus</code>
            </li>

            <li class="my-2">
                <i class="fa fa-circle text-xs text-blue-d1 align-middle mr-1"></i>
                Entrega a tiempo y evita <code>recargos</code> y mal uso de esta <code>plataforma</code>
            </li>
        </ul>

    </div>


{{--    <div class="text-center mt-4">--}}
{{--        <button type="button" class="btn btn-bgc-white btn-outline-default px-35 btn-text-slide-x">--}}
{{--            <i class="btn-text-2 fa fa-arrow-left text-110 align-text-bottom mr-2"></i>Go Back--}}
{{--        </button>--}}

{{--        <button type="button" class="btn btn-bgc-white btn-outline-primary px-35">--}}
{{--            <i class="fa fa-home"></i>--}}
{{--            Homepage--}}
{{--        </button>--}}
{{--    </div>--}}

</div>

@endsection
