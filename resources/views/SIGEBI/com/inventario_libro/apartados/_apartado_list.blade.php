<x-inline.apartados-list>
    @slot('titulo','Listado de Apartados')
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
    @slot('prestarLibro','showModalPrestar')
    @slot('restablecerDisponible','restablecerDisponible')
    @slot('Content')
        @include('SIGEBI.lay.inventario_libro.apartados.__apartado_list')
    @endslot
</x-inline.apartados-list>

