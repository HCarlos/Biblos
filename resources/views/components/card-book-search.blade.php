<div class="col-sm-4 ">

    <div class=" card  mb-2">
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>

        <div class="card-header border-0">

            <h8 class="card-title text-nowrap text-bold text-sm text-dark-m1 pl-1 w-auto" title="{{ $item->Libro->titulo }}">
                {{ strlen($item->Libro->titulo) > 32 ? substr($item->Libro->titulo,0,38)."..." : $item->Libro->titulo }}
                <small class="text-dark-l2  d-block">
                        {{ $item->Editorial->editorial }}
                    </small>
            </h8>

            <div class="card-toolbar no-border align-self-start">
                <!-- the dropdown used in some boxes (cards) -->
                <div class="dropdown dd-backdrop dd-backdrop-none-md">
                    <button type="button" class="btn btn-sm btn-text-pale btn-brc-tp btn-outline-lightgrey btn-h-light-default btn-a-light-default dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-ellipsis-h"></i>
                    </button>

                    <div class="dropdown-menu mw-auto dropdown-menu-right dropdown-caret dropdown-animated dd-appear-center dd-slide-none-md">
                        <div class="dropdown-inner">
                            @if( $item->estatus_libro == "DISPONIBLE" )
                            <a class="dropdown-item btn btn-light-grey btn-h-lighter-default btn-a-lighter-primary btn-bgc-tp px-3 btnUno" id="showModalReservar-{{$item->id}}" name="showModalReservar-{{$item->id}}" data-toggle="modal" data-target="#modalFull" href="{{ route('showModalReservar',['IL'=>$item]) }}">
                                <i class="fa fa-cog text-blue mr-1"></i>
                                Reservar
                            </a>
                            @endif

{{--                            <a class="dropdown-item btn btn-light-grey btn-h-lighter-default btn-a-lighter-primary btn-bgc-tp px-3" href="#">--}}
{{--                                <i class="fas fa-tools text-blue mr-1"></i>--}}
{{--                                Estatus--}}
{{--                            </a>--}}
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="card-body ">
            <div class="col-sm-12 p-0 m-0" >
                <div class="row p-0 m-0" >

                    <div class="col-sm-4 p-0 m-0" >
                        <a class="pos-rel"  href="{{asset($item->portadas->last()->path_image ?? '/images/web/file-not-found.png' )}}" target="_blank" >
                            <img class="media-object" src="{{asset($item->portadas->last()->path_image ?? '/images/web/file-not-found.png' )}}" width="100" height="128" >
                        </a>
                    </div>

                    <div class="col-sm-8 p-0 m-0">
                        <table class="w-inherit">
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark pl-1 pr-1"><strong>ISBN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->isbn }}</small></td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d1 pl-1 pr-1"><strong>CÓDIGO</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->codebar }}</small></td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d2 pl-1 pr-1"><strong>EDICIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->edicion }}</small></td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>CLASIFICACIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->clasificacion }}</small></td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>FICHA</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->ficha_no }}</small></td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>COLECCIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad text-nowrap pl-1"><small>{{ $item->no_coleccion }}</small></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 p-0 mt-1 " >
                <table class="w-inherit ">
                    <tr>
                        <td class="w-5 text-sm text-dark bgc-yellow-d3 pl-1 text-bold">ID</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 pr-1 mr-2">{{ $item->id }}</td>
                    </tr>
                    <tr>
                        <td class="w-5 text-sm text-dark bgc-yellow-d3 pl-1 text-bold">Estatus</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 pr-1 mr-2">{{ $item->estatus_libro }}</td>
                    </tr>
                    <tr>
                        <td class="w-5 text-sm text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Etiquetas</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap "><small class=" pr-2 text-nowrap " title="{{ $item->etiqueta_smarth }}">{{ strlen($item->etiqueta_smarth) > 43 ? substr($item->etiqueta_smarth,0,43)."..." : $item->etiqueta_smarth }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Apartado</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_apartado == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_apartado)->format('d-m-Y') }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Vencen Ap</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_apartado_vencimiento == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_apartado_vencimiento)->format('d-m-Y') }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Prestamo</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_prestamo == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_prestamo)->format('d-m-Y') }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Vencen Pres</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_prestamo_vencimiento == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_prestamo_vencimiento)->format('d-m-Y') }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Entrega</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_entrega == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_entrega)->format('d-m-Y') }}</small></td>
                    </tr>
                    <tr>
                        <td class="w-5 text-xs text-dark bgc-yellow-d3 pl-1 pr-1 text-bold">Vencen Real</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1 mr-2 text-nowrap"><small class=" pr-2" >{{ $item->fecha_entrega_vencimiento == null ? '' : \Carbon\Carbon::createFromDate($item->fecha_entrega_vencimiento)->format('d-m-Y') }}</small></td>
                    </tr>
                </table>
            </div>
        </div><!-- .card-body -->
    </div>

</div>
