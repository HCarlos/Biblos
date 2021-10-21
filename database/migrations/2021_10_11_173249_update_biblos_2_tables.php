<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateBiblos2Tables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){
        $tableBiblos = config('ibt.table_names.biblos');

        if (!Schema::hasTable($tableBiblos['libro_portada'])) {
            Schema::create($tableBiblos['libro_portada'], function (Blueprint $table) use ($tableBiblos){
                $table->id();
                $table->unsignedInteger('libro_id')->default(0)->nullable();
                $table->unsignedInteger('portada_id')->default(0)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->unique(['libro_id', 'portada_id']);

                $table->foreign('libro_id')
                    ->references('id')
                    ->on($tableBiblos['libros'])
                    ->onDelete('cascade');

                $table->foreign('portada_id')
                    ->references('id')
                    ->on($tableBiblos['portadas'])
                    ->onDelete('cascade');

            });
        }
        if (Schema::hasTable($tableBiblos['portadas'])) {
            Schema::table($tableBiblos['portadas'], function (Blueprint $table) use ($tableBiblos) {
                $table->dropColumn('libro_id');
                $table->dropColumn('inventariolibro_id');
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
        if (!Schema::hasTable($tableBiblos['libro_portada'])) {
            Schema::dropIfExists($tableBiblos['libro_portada']);
        }
    }
}
