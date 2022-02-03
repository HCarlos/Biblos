<div class="navbar-content d-none d-xl-flex">
    <ol class="breadcrumb pl-2 ml-3">
        <li class="breadcrumb-item"><a class="text-primary-d2 bgc-h-primary-l3 radius-1 px-1" href="{{route('home')}}">Inicio</a></li>
        @if ( ! is_null($breadcrumbs)  )
            @foreach($breadcrumbs as $item)
                <li class="breadcrumb-item"><a class="text-primary-d2 bgc-h-primary-l3 radius-1 px-1" href="{{route($item->url,['Id'=>$item->request])}}">{{$item->titulo}}</a></li>
            @endforeach
        @endif
        <li class="breadcrumb-item active text-dark-l4"> {{$titulo}}</li>
    </ol>
        <a href="#" class="btn btn-link btn-primary"> Ver Detalle</a>
 </div>
    <div class="navbar-content flex-grow-0 ml-auto">
        @isset($Id)
        <a href="{{ route('listPortadas',['Id'=>$Id]) }}" class="btn btn-sm px-2 btn-outline-grey btn-h-outline-green btn-h-text-grey btn-a-outline-green btn-bold btn-brc-tp mx-lg-2">
            <i class="fa fa-images bgc-orange radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
            <span class="d-none d-lg-inline">Agregar Imágenes</span>
        </a>
        <a href="{{ route('inventarioLibroList',['Id'=>$Id]) }}"  class="btn btn-sm px-2 btn-outline-grey btn-h-outline-green btn-h-text-grey btn-a-outline-green btn-bold btn-brc-tp mx-lg-2">
            <i class="fa fa-edit bgc-info radius-round w-3 h-3 text-center mr-lg-1 text-white pt-15 text-95"></i>
            <span class="d-none d-lg-inline">Agregar Detalle</span>
        </a>
        @endisset
    </div>
