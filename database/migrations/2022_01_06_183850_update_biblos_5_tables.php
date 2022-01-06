<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Classes\MigrationCustomClass;
use Illuminate\Support\Facades\DB;


class UpdateBiblos5Tables extends Migration
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
                $table->string('ficha_no',25)->default('')->nullable();
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
                MigrationCustomClass::DropColumnIfExists($tableBiblos['inventariolibros'],'ficha_no');
            });
        }

    }
}
