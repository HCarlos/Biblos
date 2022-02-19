@if($showRestablecerDisponible)
<a
    href="{{ is_null($showRestablecerDisponible) ? '#' : route($showRestablecerDisponible,["Id"=>$item->id] ) }}"
    id="{{$showRestablecerDisponible}}-{{$item->id}}"
    class=" btnRestablecerDisponible mx-2px btn radius-1 border-2 btn-xs btn-brc-tp btn-light-purple btn-h-lighter-success btn-a-lighter-success "
>
    <i class="fa fa-recycle"></i>
</a>
@endif
