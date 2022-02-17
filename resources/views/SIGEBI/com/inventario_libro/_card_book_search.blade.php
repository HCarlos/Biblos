{{--Total Libros: {{ $Libro->InventarioLibro->count() }}--}}
@foreach($Libros as $Libro)
    @foreach($Libro->InventarioLibro as $item)
        <x-card-book-search>
            @slot('item',$item ?? null)
            @slot('Libro',$Libro ?? null)
            @slot('User',$User ?? null)
            @slot('editItem',$editItem ?? null)
            @slot('removeItem',$removeItem ?? null)
        </x-card-book-search>
    @endforeach
@endforeach
