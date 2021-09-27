<?php

namespace App\Models\SIGEBI;

use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InventarioLibro extends Model{

    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'inventariolibros';

    protected $fillable = [
        'id','libro_id',
        'fecha_prestamo', 'fecha_entrega', 'fecha_apartado','uuid','observaciones','isbn','codebar',
        'prestado_user_id', 'apartado_user_id','status_libro',
        'empresa_id','editorial_id', 'creado_por_id',
    ];

    public function Libro(){
        return $this->belongsTo(Libro::class);
    }

    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }

    public function Editorial(){
        return $this->belongsToMany(Editoriale::class);
    }


}
