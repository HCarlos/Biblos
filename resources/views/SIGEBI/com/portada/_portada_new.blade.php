<x-inline.card-form-inline>
    @slot('titulo', $titulo.' partada')
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false)
    @slot('FormInline',$FormInline ?? 'none')
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.portada.__portada_new')
        @else
            @include('SIGEBI.lay.portada.__portada_new')
        @endif
    @endslot
</x-inline.card-form-inline>
