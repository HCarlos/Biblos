<x-inline.catalogo-inline-list>
    @slot('titulo',$titulo)
    @slot('items',$items)
    @slot('user',$user)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? null)
    @slot('IsModal', $IsModal ?? false )
    @slot('FormInline',$FormInline ?? 'none')
    @slot('newItem',$newItem ?? null)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('Id',$Id ?? 1)
    @slot('Content')
        @include('SIGEBI.lay.inventario_libro.__inventario_libro_list')
    @endslot
</x-inline.catalogo-inline-list>

