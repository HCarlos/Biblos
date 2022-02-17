<?php

namespace App\Models\SIGEBI;

use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class HistorialLibro extends Model{

    use SoftDeletes, Notifiable;
    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'historiallibros';

    protected $fillable = [
        'id','libro_id','inventariolibro_id','user_id',
        'fecha', 'tipo_movto','observaciones',
        'empresa_id', 'creado_por_id',
    ];

    public function Libro(){
        return $this->belongsTo(Libro::class);
    }

    public function User(){
        return $this->belongsTo(User::class);
    }

    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }
    
/*
    public function Editorial(){
        return $this->belongsToMany(Editoriale::class);
    }
*/



}
