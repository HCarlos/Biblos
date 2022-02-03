<x-catalogo-list>
    @slot('titulo',$tituloTabla)
    @slot('items',$items)
    @slot('user',$user)
    @slot('newItem',$newItem ?? null)
    @slot('searchButton', $searchButton ?? '')
    @slot('excelButton', $excelButton ?? '')
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? '')
    @slot('IsModal',$IsModal ?? false)
    @slot('breadcrumbs',$breadcrumbs ?? null)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('Tabla')
        @include('share.Catalogos.User.__users_list')
    @endslot
</x-catalogo-list>
