<div class="col-12 mt-35">
    <div class="row h-100 mx-n425">
        @foreach($items as $item)
            <x-card-book>
                @slot('item',$item ?? null)
                @slot('editItem',$editItem ?? null)
                @slot('removeItem',$removeItem ?? null)
            </x-card-book>
        @endforeach
    </div>
</div>
