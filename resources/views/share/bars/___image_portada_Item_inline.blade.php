@if($listPortadas)
<a href="{{route($listPortadas,['Id'=>$item->id])}}" class=" mx-2px btn radius-1 border-2 btn-xs btn-brc-tp btn-light-warning btn-h-lighter-warning btn-a-lighter-warning "  >
    <i class="fa fa-images"></i>
</a>
@endif
