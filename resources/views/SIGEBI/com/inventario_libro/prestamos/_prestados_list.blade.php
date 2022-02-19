<x-inline.prestados-list>
    @slot('titulo','Listado de Material Prestado')
    @slot('items',$items)
    @slot('user',$user)
    @slot('searchButton', null)
    @slot('excelButton', $excelButton ?? null)
    @slot('editItem',$editItem)
    @slot('removeItem',$removeItem)
    @slot('listItems',$listItems ?? null)
    @slot('IsModal', true )
    @slot('FormInline',$FormInline ?? 'none')
    @slot('newItem',$newItem ?? null)
    @slot('newItemWithData',$newItemWithData ?? null)
    @slot('breadcrumbs', $breadcrumbs ?? null)
    @slot('Id',$Id ?? 1)
    @slot('entregarLibro','showModalEntregar')
    @slot('restablecerDisponible','restablecerDisponible')
    @slot('Content')
        @include('SIGEBI.lay.inventario_libro.prestamos.__prestado_list')
    @endslot
</x-inline.prestados-list>

