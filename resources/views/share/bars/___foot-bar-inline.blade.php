<div class="col-12 col-lg-12 py-lg-0 bgc-white px-3" style="background-color: red">
    <div class="mt-5 border-t-1 bgc-secondary-l4 brc-secondary-l2 py-35 mx-n25">
        <div class="offset-md-12 col-md-12 text-nowrap">
            <div class="text-right">
                <button type="button" class="btn btn-secondary btn-h-secondary btn-a-default btn-xlg btn-text-slide-y direction-reverse py-3 rounded-lg mb-0 float-left btnFormInlineBack " id="btnFormInlineBack">
                    <i class="fa fa-arrow-left fa-2x px-4 btn-text-1 mt-n1"></i>
                    <span class="text-75 btn-text-2 font-bolder mt-2px"></span>
                    Regresar
                </button>

            @if( !$ReadOnly)
                    <button type="submit" class="btn btn-primary btn-h-primary btn-a-success btn-xlg btn-text-slide-y direction-reverse py-3 rounded-lg mb-0 btnFormInlineSubmit " id="btnFormInlineSubmit">
                        <i class="fa fa-check fa-2x px-4 btn-text-1 mt-n1"></i>
                        <span class="text-75 btn-text-2 font-bolder mt-2px"></span>
						Guardar
                    </button>
                @endif
            </div>
        </div>
    </div>
</div>
