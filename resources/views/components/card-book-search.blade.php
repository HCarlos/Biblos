<div class="col-sm-4 ">

    <div class=" card  m-2 ">
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
        <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>

        <div class="card-header border-0">

            <h5 class="card-title  text-dark-m1 pl-1">
                {{ $item->Libro->id }} {{ $item->Libro->titulo }}
                <span class="text-dark-l2  d-block">
                        {{ $item->Editorial->editorial }}
                    </span>
            </h5>

            <div class="card-toolbar no-border align-self-start">
                <!-- the dropdown used in some boxes (cards) -->
                <div class="dropdown dd-backdrop dd-backdrop-none-md">
                    <button type="button" class="btn btn-sm btn-text-pale btn-brc-tp btn-outline-lightgrey btn-h-light-default btn-a-light-default dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-ellipsis-h"></i>
                    </button>

                    <div class="dropdown-menu mw-auto dropdown-menu-right dropdown-caret dropdown-animated dd-appear-center dd-slide-none-md">
                        <div class="dropdown-inner">
                            <a class="dropdown-item btn btn-light-grey btn-h-lighter-default btn-a-lighter-primary btn-bgc-tp px-3" href="#">
                                <i class="fa fa-cog text-blue mr-1"></i>
                                Reservar
                            </a>

                            <a class="dropdown-item btn btn-light-grey btn-h-lighter-default btn-a-lighter-primary btn-bgc-tp px-3" href="#">
                                <i class="fas fa-tools text-blue mr-1"></i>
                                Estatus
                            </a>
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

{{--                    <div class="col-sm-8 p-0 m-0">--}}
{{--                        <div class="text-nowrap text-30 text-dark-l2 ml-0 bgc-black" >--}}
{{--                            <div class="text-orange-d3 text-xs w-90 bgc-black">ISBN:</div> {{ $item->isbn }} {{ $item->ficha_no }}--}}
{{--                        </div>--}}
{{--                        <div class="text-nowrap text-dark-l2 ml-0">--}}
{{--                            <strong class="text-orange-d3 text-xs">CÓDIGO:</strong> {{ $item->codebar }}--}}
{{--                        </div>--}}
{{--                        <div class="text-nowrap text-20 text-dark-l2 ml-0">--}}
{{--                            {{ $item->clasificacion }}--}}
{{--                        </div>--}}
{{--                        <div class="text-nowrap text-20 text-dark-l2 ml-0">--}}
{{--                            {{ $item->edicion }}--}}
{{--                        </div>--}}
{{--                    </div>--}}
                    <div class="col-sm-8 p-0 m-0">
                        <table class="w-inherit">
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark pl-1 pr-1"><strong>ISBN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->isbn }}</td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d1 pl-1 pr-1"><strong>CÓDIGO</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->codebar }}</td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d2 pl-1 pr-1"><strong>EDICIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->edicion }}</td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>CLASIFICACIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->clasificacion }}</td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>FICHA</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->ficha_no }}</td>
                            </tr>
                            <tr>
                                <td class="w-5 text-sm text-orange-d1 bgc-dark-d3 pl-1 pr-1"><strong>COLECCIÓN</strong></td>
                                <td class="w-8 text-sm bgc-dark-grad pl-1">{{ $item->no_coleccion }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <hr>
            <div class="col-sm-12 p-0 m-0" >
                <table class="w-inherit">
                    <tr>
                        <td class="w-5 text-sm text-dark bgc-yellow-d3 pl-1 pr-1">Estatus</td>
                        <td class="w-8 text-sm text-dark bgc-yellow-l1 pl-1">{{ $item->estatus_libro }}</td>
                    </tr>
                </table>
            </div>
        </div><!-- .card-body -->
    </div>

</div>
