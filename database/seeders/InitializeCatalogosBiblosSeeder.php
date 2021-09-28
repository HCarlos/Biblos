<?php

namespace Database\Seeders;

use App\Models\Catalogos\Alumno;
use App\Models\Catalogos\Ciclo;
use App\Models\Catalogos\Empresa;
use App\Models\Catalogos\Familia;
use App\Models\Catalogos\Grado;
use App\Models\Catalogos\Nivel;
use App\Models\Catalogos\Parentesco;
use App\Models\Catalogos\Subciclo;
use App\Models\SIGEBI\Editoriale;
use App\Models\SIGEBI\TipoMaterial;
use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class InitializeCatalogosBiblosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {

     // Obtenemos el primer Usuario que debe ser el que se crea primero al generar el Seedor UserRolesPermisos
     $creado_por_id = User::find(1)->id;

     //Obtenemos los Roles
     $RoleAlumnoId = Role::select('id')->where('name','ALUMNO')->first()->id;
     $RoleProfesorId = Role::select('id')->where('name','PROFESOR')->first()->id;


    // Se inicializa el número de la empresa wue se estará utilizando
    $empresa_id = 1;
    $Emp = Empresa::find($empresa_id);

    TipoMaterial::create(['tipo_material'=>'LIBRO']);
    TipoMaterial::create(['tipo_material'=>'REVISTA']);
    TipoMaterial::create(['tipo_material'=>'CD']);
    TipoMaterial::create(['tipo_material'=>'DVD']);

    Editoriale::create(['editorial' => strtoupper(trim('Acantilado')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Aguilar')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Akal')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Alba')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Alfaguara')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Alianza')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Almadía')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Anagrama')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Alpha Decay')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Ariel')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Atalanta')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Caja Negra')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Cátedra')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Crítica')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Debolsillo')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Fondo de Cultura Económica')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Galaxia Gutenberg')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Gallo Nero')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Gredos')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Gustavo Gili')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Herder')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Impedimenta')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Joaquín Mortiz')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('La esfera de los libros')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Library of America')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Lumen')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Nevsky')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Olañeta')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Paidós')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Penguin Books')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Phaidon')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Planeta')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Plaza y Janés')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('RM')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Sajalín')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Salamandra')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Satori')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Seix Barral')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Sexto Piso')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Siglo XXI')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Siruela')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Taschen')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Taurus')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Trotta')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Tusquets')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Urano')) ]);
    Editoriale::create(['editorial' => strtoupper(trim('Valdemar')) ]);




    }
}
