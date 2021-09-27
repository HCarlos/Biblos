<?php

namespace App\Models\Catalogos;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empresa extends Model{


    use HasFactory;


    protected $guard_name = 'web';
    protected $table = 'empresas';


    protected $fillable = [
        'id',
        'razon_social', 'domicilio_fiscal',
    ];


}
