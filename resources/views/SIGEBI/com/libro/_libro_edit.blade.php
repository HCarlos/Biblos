<x-inline.card-form-inline>
    @slot('titulo', $titulo)
    @slot('User',$User ?? null)
    @slot('Route',$Route ?? '')
    @slot('Method',$Method ?? '')
    @slot('IsNew',$IsNew ?? false)
    @slot('IsUpload',$IsUpload ?? false)
    @slot('ReadOnly',$ReadOnly ?? false)
    @slot('FormInline',$FormInline ?? 'none')
    @slot('items_forms')
        @if($IsNew)
            @include('SIGEBI.lay.libro.__libro_new')
        @else
            @include('SIGEBI.lay.libro.__libro_edit')
        @endif
    @endslot
</x-inline.card-form-inline>
