<div class="col-12 mt-35">
    <div class="row h-100 mx-n425">
        @foreach($items as $item)
            <x-card-book-image>
                @slot('item',$item ?? null)
                @slot('removeItem',$removeItem ?? null)
            </x-card-book-image>
        @endforeach
    </div>
</div>
