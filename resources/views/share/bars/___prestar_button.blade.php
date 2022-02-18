@if($prestarLibro)
<a href="{{ is_null($prestarLibro) ? '#' : route($prestarLibro,["Id"=>$item->id] ) }}" class="editItem mx-2px btn radius-1 border-2 btn-xs btn-brc-tp btn-light-orange btn-h-lighter-success btn-a-lighter-success @if( $IsModal ) btnFullModal @endif btnFormInline"
   @if( $IsModal ) data-toggle="modal" data-target="#modalFull" @endif
>
    <i class="fa fa-person-booth"></i>
</a>
@endif
