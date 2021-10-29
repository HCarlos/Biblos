    @php $IsModal = $IsModal  ?? false @endphp
    <div class="card bcard" id="contentMain">
        <div class="card-header bgc-primary-d1 text-white border-0" id="{{$FormInline}}" >
            @include('share.bars.___toolbar_catalogo_inline')
            <h4 class="text-40">
                <h3>{{$tituloTabla}}</h3>
            </h4>
        </div>
        <hr>
        <div class="card-body p-0 border-x-1 border-b-1 brc-default-m4 radius-0 overflow-hidden p-2">
            {{$Content}}
            @include('share.bars.___foot-bar-inline')
        </div>
        @include('share.bars.___paginator')
    </div>
    @include('share.code.__ajax_card_inline')

@section('script-footer')

@endsection
