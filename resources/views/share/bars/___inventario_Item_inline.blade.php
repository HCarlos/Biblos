@if($inventarioItem)
<a href="{{route($inventarioItem,['Id'=>$item->id])}}" class=" mx-2px btn radius-1 border-2 btn-xs btn-brc-tp btn-light-brown btn-h-lighter-secondary btn-a-lighter-secondary "  >
    <i class="fa fa-book-dead"></i>
</a>
@endif
