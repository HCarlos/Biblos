<x-modals.blurred>
    @slot('TituloModal', $TituloModal ?? 'Sin Título')
    @slot('RouteModal', $RouteModal ?? '#')
    @slot('Method',$Method ?? 'GET')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('CuerpoModal')
        @if($IsNew)
            @include('SIGEBI.lay.editorial.__editorial_new')
        @else
            @include('SIGEBI.lay.editorial.__editorial_edit')
        @endif
    @endslot
</x-modals.blurred>
