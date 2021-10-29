<x-card-form-normal>
    @slot('titulo', $titulo.' partada')
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.portada.__portada_new')
        @else
            @include('SIGEBI.lay.portada.__portada_new')
        @endif
    @endslot
</x-card-form-normal>
