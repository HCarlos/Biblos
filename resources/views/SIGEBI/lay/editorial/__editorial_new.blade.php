<div class="form-group row">
    <x-inputs.text-field cols="12" tipo="text" nombre="editorial" valor="{{old('editorial')}}"></x-inputs.text-field>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="12" tipo="text" nombre="representante" valor="{{old('representante')}}"></x-inputs.text-field>
</div>
<div class="form-group row">
    <x-inputs.text-field cols="4" tipo="text" nombre="telefonos" valor="{{old('telefonos')}}"></x-inputs.text-field>
    <x-inputs.text-field cols="4" tipo="text" nombre="email" nombrees="emails" valor="{{old('email')}}"></x-inputs.text-field>
    <div class="col-sm-4"></div>
</div>
<div class="form-group row">
    <x-inputs.check-box cols="4" tipo="checkbox" nombre="predeterminado"  valor="{{old('predeterminado')}}"></x-inputs.check-box>
    <x-inputs.check-box cols="4" tipo="checkbox" nombre="status_editorial" nombrees="Estatus Editorial" valor="1"></x-inputs.check-box>
    <div class="col-sm-4"></div>
</div>

<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{Auth::id()}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">
