<x-card-form-normal>
    @slot('titulo', $titulo)
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false,)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.libro.__libro_new')
        @else
            @include('SIGEBI.lay.libro.__libro_edit')
        @endif
    @endslot
</x-card-form-normal>
