<?php

namespace App\Models\SIGEBI;

use App\Models\Catalogos\Empresa;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;

class Editoriale extends Model{


    use SoftDeletes, Notifiable;
    use HasFactory;

    protected $guard_name = 'web';
    protected $table = 'editoriales';

    protected $fillable = [
        'id',
        'no', 'editorial', 'representante','telefonos','email','status_editorial',
        'empresa_id','migration_id', 'creado_por_id',
    ];

    protected $casts = ['predeterminado'=>'boolean'];

    public function Empresa(){
        return $this->belongsTo(Empresa::class);
    }

    public function Creado_Por(){
        return $this->belongsTo(User::class, 'creado_por_id');
    }


}
