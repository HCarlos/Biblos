<x-card-form-normal>
    @slot('titulo', $titulo)
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.tipo_material.__tipo_material_new')
        @else
            @include('SIGEBI.lay.tipo_material.__tipo_material_edit')
        @endif
    @endslot
</x-card-form-normal>
