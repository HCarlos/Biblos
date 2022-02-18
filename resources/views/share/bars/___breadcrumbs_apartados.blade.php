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
</div>
