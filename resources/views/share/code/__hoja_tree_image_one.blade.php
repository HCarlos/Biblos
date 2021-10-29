<li class="media row p-2 @isset($isborder)  bg-item-treview-inside @else mb-2 mt-2 bg-item-treview-outside @endisset " >

    <a class="pull-left pl-2"  href="{{asset($item->PathImage)}}" target="_blank" >
        <img class="media-object" src="{{asset($item->PathImageThumb)}}" width="64" height="64" >
    </a>

    <div class="media-body pl-2 col-md-12">
        <h4 class="media-heading">{{$item->titulo}} <small>{{$item->fecha}}</small>
            <span class=" table-action button-list pl-2 ">
                @include('share.ui_kit.__remove_item')
            </span>
        </h4>
        <div class="media">
            <div class="col-md-12">
                    {{$item->descripcion}}<br>
                    <small>{{$item->momento}}</small>
            </div>
        </div>
    </div>
</li>
