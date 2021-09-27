<div class="form-group row">
    <x-inputs.text-field cols="12" tipo="text" nombre="tipo material" nombrees="Tipo de Material" valor="{{old('tipo_material',$item->tipo_material)}}"></x-inputs.text-field>
</div>

<input type="hidden" name="id" id="id" value="{{$item->id}}">
