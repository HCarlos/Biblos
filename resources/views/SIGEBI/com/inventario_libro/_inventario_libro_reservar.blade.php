<x-modals.blurred>
    @slot('TituloModal', $TituloModal ?? 'Sin Título')
    @slot('RouteModal', $RouteModal ?? '#')
    @slot('Method',$Method ?? 'GET')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('item', $item ?? null)
    @slot('CuerpoModal')
        @if($IsNew)
            @include('SIGEBI.lay.inventario_libro.__inventario_libro_reservar')
        @else
            @include('SIGEBI.lay.inventario_libro.__inventario_libro_reservar')
        @endif
    @endslot
</x-modals.blurred>
