
<div class="row">
    <div class="col-lg-12">
        <ul class="media-list">
            @foreach($items as $item)
                    @include('share.code.__hoja_tree_image_one',['items'=>$item,"isborder"=>true])
{{--                    @include('share.code.__hoja_tree_image',['items'=>$item->childs])--}}
            @endforeach
        </ul>
    </div>
</div>
