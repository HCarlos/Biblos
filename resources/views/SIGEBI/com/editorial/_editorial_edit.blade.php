<x-card-form-normal>
    @slot('titulo', $titulo)
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false)
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.editorial.__editorial_new')
        @else
            @include('SIGEBI.lay.editorial.__editorial_edit')
        @endif
    @endslot
</x-card-form-normal>
