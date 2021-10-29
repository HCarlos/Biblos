<?php

use App\Classes\MigrationCustomClass;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class UpdateBiblos3Tables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){

        $tableBiblos = config('ibt.table_names.biblos');
        if (Schema::hasTable($tableBiblos['inventariolibros'])) {
            Schema::table($tableBiblos['inventariolibros'], function (Blueprint $table) use ($tableBiblos){
                $table->string('etiqueta_smarth',1000)->default('')->nullable();
                $table->string('no_coleccion',250)->default('')->nullable();
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'searchtext');
            });
        }

        if (Schema::hasTable($tableBiblos['libros'])) {
            Schema::table($tableBiblos['libros'], function (Blueprint $table) use ($tableBiblos) {
                MigrationCustomClass::DropColumnIfExists($tableBiblos['libros'],'etiqueta_smarth');
                MigrationCustomClass::DropColumnIfExists($tableBiblos['libros'],'no_coleccion');
                MigrationCustomClass::DropColumnIfExists($tableBiblos['libros'],'searchtext');
                //$table->dropIndex(['libros_etiqueta_smarth_index']);
            });
        }



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(){

        $tableBiblos = config('ibt.table_names.biblos');
        if (Schema::hasTable($tableBiblos['libros'])) {
            Schema::table($tableBiblos['libros'], function (Blueprint $table) use ($tableBiblos){
                $table->string('etiqueta_smarth',1000)->default('')->nullable();
                $table->string('no_coleccion',250)->default('')->nullable();
            });
        }

        if (Schema::hasTable($tableBiblos['inventariolibros'])) {
            Schema::table($tableBiblos['inventariolibros'], function (Blueprint $table) use ($tableBiblos) {
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'etiqueta_smarth');
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'no_coleccion');
            });
        }

    }

}
