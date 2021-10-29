<x-catalogo-list>
    @slot('titulo',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('searchButton', $searchButton ?? null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? '')
    @slot('IsModal', $IsModal ?? false )
    @slot('FormInline',$FormInline ?? 'none')
    @slot('inventarioItem', $inventarioItem ?? null )
    @slot('listItems', $listItems ?? null )
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('Tabla' ?? null)
        @include('SIGEBI.lay.libro.__libro_list')
    @endslot
</x-catalogo-list>
