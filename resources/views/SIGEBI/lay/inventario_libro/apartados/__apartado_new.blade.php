<div class="form-group row">
    <x-inputs.date-field cols="12" nombre="fecha_apartado" nombrees="Fecha de Reservación" valor="{{ \Carbon\Carbon::now() }}" sololectura="true"></x-inputs.date-field>
    <x-inputs.date-field cols="12" nombre="fecha_apartado_vencimiento" nombrees="Fecha de Vencimiento" valor="{{ \Carbon\Carbon::now()->addDay(3) }}"></x-inputs.date-field>
    <div class="col-sm-12">
        <label class="col-form-label" for="observaciones">Observaciones</label>
        <textarea id="observaciones" name="observaciones" rows="2" class="form-control"> </textarea>
    </div>
</div>
<input type="hidden" name="id" id="id" value="{{$item->id}}">
<input type="hidden" name="libro_id" id="libro_id" value="{{$item->libro_id}}">
<input type="hidden" name="apartado_user_id" id="apartado_user_id" value="{{$User->id}}">
<input type="hidden" name="creado_por_id" id="creado_por_id" value="{{$User->id}}">
<input type="hidden" name="empresa_id" id="empresa_id" value="{{config('ibt.empresa_id')}}">


