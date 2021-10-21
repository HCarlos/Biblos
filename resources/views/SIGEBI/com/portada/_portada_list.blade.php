<x-inline.catalogo-inline-list>
    @slot('tituloTabla',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem ?? null)
    @slot('removeItem',$removeItem ?? null)
    @slot('listItems',$listItems ?? '')
    @slot('IsModal', $IsModal ?? false )
    @slot('FormInline',$FormInline ?? 'none')
    @slot('inventarioItem', $inventarioItem ?? null)
    @slot('Id', $Id ?? 1)
    @slot('Tabla')
        @include('SIGEBI.lay.portada.__portada_list')
    @endslot
</x-inline.catalogo-inline-list>
