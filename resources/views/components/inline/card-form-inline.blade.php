
<div class="card bcard">
    <div class="card-body p-0 border-x-1 border-b-1 brc-default-m4 radius-0 overflow-hidden p-2">
        @include('share.otros.___erros-forms')
        <form method="{{$Method}}" action="{{ route($Route) }}"  accept-charset="UTF-8" @if($IsUpload) enctype="multipart/form-data" @endif id="formInline">
            @csrf
            @if( !$IsNew )
                {{ method_field('PUT') }}
            @endif
            {{ $items_forms }}
            @include('share.bars.___foot-bar-inline')
        </form>
        @include('share.code.__ajax_form_full_inline_with_errors')
    </div>
</div>
