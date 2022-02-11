Total Libros: {{ $Libro->InventarioLibro->count() }}
<div class="row " >
    @foreach($Libro->InventarioLibro as $item)
        <x-card-book-search>
            @slot('item',$item ?? null)
            @slot('Libro',$Libro ?? null)
            @slot('editItem',$editItem ?? null)
            @slot('removeItem',$removeItem ?? null)
        </x-card-book-search>
    @endforeach
</div>
