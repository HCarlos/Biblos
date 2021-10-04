<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateBiblos1Tables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){

        $tableUsers = config('ibt.table_names.users');
        $tablePersonas = config('ibt.table_names.personas');
        $tableUbi = config('ibt.table_names.ubicaciones');
        $tableCatalogos = config('ibt.table_names.catalogos');
        $tableRelaciones = config('ibt.table_names.relaciones');
        $tableBiblos = config('ibt.table_names.biblos');

        if (!Schema::hasTable($tableBiblos['libros'])) {
            Schema::table($tableBiblos['libros'], function (Blueprint $table) {
                $table->unique(['titulo','autor']);

            });
        }




    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(){

        $tableUsers = config('ibt.table_names.users');
        $tablePersonas = config('ibt.table_names.personas');
        $tableUbi = config('ibt.table_names.ubicaciones');
        $tableCatalogos = config('ibt.table_names.catalogos');
        $tableRelaciones = config('ibt.table_names.relaciones');
        $tableBiblos = config('ibt.table_names.biblos');

        if (!Schema::hasTable($tableBiblos['libros'])) {
            Schema::table($tableBiblos['libros'], function (Blueprint $table) {
                $table->dropUnique(['titulo','autor']);
            });
        }

    }
}
