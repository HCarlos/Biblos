<x-modals.blurred>
    @slot('TituloModal', $TituloModal ?? 'Sin Título')
    @slot('RouteModal', $RouteModal ?? '#')
    @slot('Method',$Method ?? 'GET')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('CuerpoModal')
        @if($IsNew)
            @include('SIGEBI.lay.tipo_material.__tipo_material_new')
        @else
            @include('SIGEBI.lay.tipo_material.__tipo_material_edit')
        @endif
    @endslot
</x-modals.blurred>
