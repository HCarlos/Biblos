<?php

use App\Classes\MigrationCustomClass;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateBiblos6Tables extends Migration
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
                $table->date('fecha_apartado_vencimiento')->nullable();
                $table->date('fecha_prestamo_vencimiento')->nullable();
                $table->date('fecha_entrega_vencimiento')->nullable();
            });
        }

        if (Schema::hasTable($tableBiblos['historiallibros'])) {
            Schema::table($tableBiblos['historiallibros'], function (Blueprint $table) use ($tableBiblos) {
                $sm = Schema::getConnection()->getDoctrineSchemaManager();
                $indexesFound = $sm->listTableIndexes('historiallibros');
                if (array_key_exists("libro_id_inventariolibro_id_user_id", $indexesFound))
                    $table->dropUnique("libro_id_inventariolibro_id_user_id");
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
        if (Schema::hasTable($tableBiblos['inventariolibros'])) {
            Schema::table($tableBiblos['inventariolibros'], function (Blueprint $table) use ($tableBiblos) {
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'fecha_apartado_vencimiento');
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'fecha_prestamo_vencimiento');
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'fecha_entrega_vencimiento');
            });
        }

    }
}
