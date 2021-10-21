<div class="form-group row">

    <div class="card h-100">
        <div class="card-header">
            <h5 class="card-title text-orange-d4">
                Selecciona una imagen (jpeg, jpg, png, gif)
            </h5>
        </div>

        <div class="card-body">
            <div>
                <label class="ace-file-input">
                <input type="file" class="ace-file-input" id="file" name="file">
                <div class="ace-file-container d-flex flex-column border-1 brc-grey-l2 brc-h-warning-m1">
                    <div class="ace-file-placeholder h-100">
                      <span class="ace-file-icon align-self-center mx-2px">
                        <i class="fa fa-upload bgc-grey-m1 text-white w-4 py-2 text-center"></i>
                        </span>
                        <span class="ace-file-name text-grey-m2 px-1">
                            No haz seleccionado ningún archivo
                        </span>
                        <span class="ace-file-btn ml-auto bgc-default text-white px-2 pt-2 text-90 my-1px mr-1px">Seleccionar</span>
                    </div>
                </div>
                <a title="" class="remove position-rc text-danger mr-n25 w-3 radius-2 border-1 brc-h-danger-m4 text-center" href="#"><i class="fa fa-times"></i></a></label>
            </div>
        </div>

    </div>

</div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="libro_id" id="libro_id" value="{{ $item->id }}">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
