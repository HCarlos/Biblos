<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateBiblosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        $tableUsers = config('ibt.table_names.users');
        $tablePersonas = config('ibt.table_names.personas');
        $tableUbi = config('ibt.table_names.ubicaciones');
        $tableCatalogos = config('ibt.table_names.catalogos');
        $tableRelaciones = config('ibt.table_names.relaciones');
        $tableBiblos = config('ibt.table_names.biblos');

        if (!Schema::hasTable($tableBiblos['codigopaises'])) {
            Schema::create($tableBiblos['codigopaises'], function (Blueprint $table) use ($tableCatalogos){
                $table->id();
                $table->string('codigo', 10)->default('')->nullable();
                $table->string('lenguaje', 150)->nullable('')->nullable();
                $table->char('tipo')->default('L')->nullable();
                $table->unsignedTinyInteger('empresa_id')->default(1)->nullable();
                $table->unsignedSmallInteger('status_lenguaje')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable()->index();
                $table->unsignedInteger('migration_id')->default(0)->nullable()->index();
                $table->softDeletes();
                $table->timestamps();
                $table->index('empresa_id');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');

            });
        }

        if (!Schema::hasTable($tableBiblos['editoriales'])) {
            Schema::create($tableBiblos['editoriales'], function (Blueprint $table) use ($tableCatalogos){
                $table->id();
                $table->string('editorial',100)->default('')->unique();
                $table->string('representante',150)->default('')->nullable();
                $table->string('telefonos',100)->default('')->nullable();
                $table->string('email',150)->default('')->nullable();
                $table->boolean('predeterminado')->default(false)->nonullable();
                $table->unsignedSmallInteger('status_editorial')->default(1)->nullable();
                $table->unsignedTinyInteger('empresa_id')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->index('predeterminado');
                $table->index('empresa_id');
                $table->index('creado_por_id');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');

            });
        }

        if (!Schema::hasTable($tableBiblos['tipomaterial'])) {
            Schema::create($tableBiblos['tipomaterial'], function (Blueprint $table) use ($tableBiblos, $tableUsers, $tableCatalogos) {
                $table->id();
                $table->string('tipo_material',100)->default('')->nullable();
                $table->unsignedSmallInteger('empresa_id')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->index(['empresa_id']);
                $table->index(['creado_por_id']);

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');


            });

        }



        if (!Schema::hasTable($tableBiblos['libros'])) {
            Schema::create($tableBiblos['libros'], function (Blueprint $table) use ($tableBiblos, $tableCatalogos ) {
                $table->id();
                $table->string('ficha_no',25)->default('')->nullable();
                $table->string('etiqueta_smarth',1000)->default('')->nullable();
                $table->string('titulo',250)->default('')->nullable();
                $table->string('autor',250)->default('')->nullable();
                $table->string('datos_fijos',250)->default('')->nullable();
                $table->string('no_coleccion')->default('')->nullable();
                $table->string('codebar',30)->default('')->nullable();
                $table->string('observaciones', 1000)->default('')->nullable();
                $table->unsignedSmallInteger('tipo_material_id')->default(1)->nullable();
                $table->unsignedSmallInteger('status_libro')->default(1)->nullable();
                $table->unsignedSmallInteger('empresa_id')->default(1)->nullable();
                $table->unsignedInteger('editorial_id')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->string('ip', 150)->default('')->nullable();
                $table->string('host', 150)->default('')->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->index('tipo_material_id');
                $table->index('etiqueta_smarth');
                $table->index('editorial_id');
                $table->index('creado_por_id');
                $table->index('empresa_id');

                $table->foreign('editorial_id')
                    ->references('id')
                    ->on($tableBiblos['editoriales'])
                    ->onDelete('cascade');

                $table->foreign('tipo_material_id')
                    ->references('id')
                    ->on($tableBiblos['tipomaterial'])
                    ->onDelete('cascade');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');


            });
        }


        if (!Schema::hasTable($tableBiblos['inventariolibros'])) {
            Schema::create($tableBiblos['inventariolibros'], function (Blueprint $table) use ($tableBiblos, $tableCatalogos){
                $table->id();
                $table->unsignedInteger('libro_id')->default(0)->nullable();
                $table->string('isbn',50)->default('')->nullable();
                $table->string('clasificacion',30)->default('')->nullable();
                $table->string('edicion',30)->default('')->nullable();
                $table->string('codebar',30)->default('')->nullable();
                $table->unsignedInteger('prestado_user_id')->default(0)->nullable();
                $table->datetime('fecha_prestamo')->nullable();
                $table->datetime('fecha_entrega')->nullable();
                $table->unsignedInteger('apartado_user_id')->default(0)->nullable();
                $table->datetime('fecha_apartado')->nullable();
                $table->unsignedInteger('editorial_id')->default(0)->nullable();
                $table->uuid('uuid');
                $table->string('observaciones', 500)->default('')->nullable();
                $table->unsignedSmallInteger('empresa_id')->default(1)->nullable();
                $table->unsignedSmallInteger('status_libro')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->unique('isbn');
                $table->unique('codebar');
                $table->index('uuid');
                $table->index('prestado_user_id');
                $table->index('apartado_user_id');
                $table->index('editorial_id');
                $table->index('empresa_id');
                $table->index('creado_por_id');

                $table->foreign('libro_id')
                    ->references('id')
                    ->on($tableBiblos['libros'])
                    ->onDelete('cascade');

                $table->foreign('editorial_id')
                    ->references('id')
                    ->on($tableBiblos['editoriales'])
                    ->onDelete('cascade');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');


            });

        }


        if (!Schema::hasTable($tableBiblos['portadas'])) {
            Schema::create($tableBiblos['portadas'], function (Blueprint $table) use ($tableUsers, $tableCatalogos, $tableBiblos) {
                $table->bigIncrements('id');
                $table->unsignedInteger('libro_id')->default(0)->nullable();
                $table->unsignedInteger('inventariolibro_id')->default(0)->nullable();
                $table->string('root',250)->default('')->nullable();
                $table->string('filename',250)->default()->nullable();
                $table->string('filename_png',250)->default()->nullable();
                $table->string('filename_thumb',250)->default('')->nullable();
                $table->string('pie_de_foto',250)->default('')->nullable();
                $table->unsignedSmallInteger('status_portada')->default(1)->nullable();
                $table->unsignedSmallInteger('empresa_id')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->string('ip',150)->default('')->nullable();
                $table->string('host',150)->default('')->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->index(['libro_id']);
                $table->index(['inventariolibro_id']);
                $table->index(['empresa_id']);
                $table->index(['creado_por_id']);

                $table->foreign('libro_id')
                    ->references('id')
                    ->on($tableBiblos['libros'])
                    ->onDelete('cascade');

                $table->foreign('inventariolibro_id')
                    ->references('id')
                    ->on($tableBiblos['inventariolibros'])
                    ->onDelete('cascade');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');

            });

        }





        if (!Schema::hasTable($tableBiblos['editoriale_libro'])) {
            Schema::create($tableBiblos['editoriale_libro'], function (Blueprint $table) use ($tableBiblos){
                $table->id();
                $table->unsignedInteger('editoriale_id')->default(0)->nullable();
                $table->unsignedInteger('libro_id')->default(0)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->unique(['editoriale_id', 'libro_id']);

                $table->foreign('libro_id')
                    ->references('id')
                    ->on($tableBiblos['libros'])
                    ->onDelete('cascade');

                $table->foreign('editoriale_id')
                    ->references('id')
                    ->on($tableBiblos['editoriales'])
                    ->onDelete('cascade');

            });

        }


        if (!Schema::hasTable($tableBiblos['inventariolibro_portada'])) {
            Schema::create($tableBiblos['inventariolibro_portada'], function (Blueprint $table) use ($tableBiblos){
                $table->id();
                $table->unsignedInteger('inventariolibro_id')->default(0)->nullable();
                $table->unsignedInteger('portada_id')->default(0)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->unique(['inventariolibro_id', 'portada_id']);

                $table->foreign('inventariolibro_id')
                    ->references('id')
                    ->on($tableBiblos['inventariolibros'])
                    ->onDelete('cascade');

                $table->foreign('portada_id')
                    ->references('id')
                    ->on($tableBiblos['portadas'])
                    ->onDelete('cascade');

            });

        }


        if (!Schema::hasTable($tableBiblos['historiallibros'])) {
            Schema::create($tableBiblos['historiallibros'], function (Blueprint $table) use ($tableBiblos, $tableUsers, $tableCatalogos){
                $table->id();
                $table->unsignedInteger('libro_id')->default(0)->nullable();
                $table->unsignedInteger('inventariolibro_id')->default(0)->nullable();
                $table->unsignedInteger('user_id')->default(0)->nullable();
                $table->datetime('fecha')->nullable();
                $table->string('tipo_movto',25)->default('INICIO')->nonullable();
                $table->string('observaciones', 500)->default('')->nullable();
                $table->unsignedSmallInteger('empresa_id')->default(1)->nullable();
                $table->unsignedInteger('creado_por_id')->default(1)->nullable();
                $table->softDeletes();
                $table->timestamps();
                $table->index(['libro_id']);
                $table->index(['inventariolibro_id']);
                $table->index(['user_id']);
                $table->index(['empresa_id']);
                $table->index(['creado_por_id']);
                $table->unique(['libro_id','inventariolibro_id','user_id']);

                $table->foreign('libro_id')
                    ->references('id')
                    ->on($tableBiblos['libros'])
                    ->onDelete('cascade');

                $table->foreign('inventariolibro_id')
                    ->references('id')
                    ->on($tableBiblos['inventariolibros'])
                    ->onDelete('cascade');

                $table->foreign('user_id')
                    ->references('id')
                    ->on($tableUsers['users'])
                    ->onDelete('cascade');

                $table->foreign('empresa_id')
                    ->references('id')
                    ->on($tableCatalogos['empresas'])
                    ->onDelete('cascade');

                $table->foreign('creado_por_id')
                    ->references('id')
                    ->on($tableCatalogos['users'])
                    ->onDelete('cascade');


                    });

        }



        // CAMPO ESPECIAL PARA LIBROS
        DB::statement("ALTER TABLE libros ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE libros SET searchtext = to_tsvector('spanish', coalesce(trim(titulo),'') || ' ' || coalesce(trim(autor),'') || ' ' || coalesce(trim(etiqueta_smarth),'') )");
        DB::statement("CREATE INDEX libros_searchtext_gin ON libros USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON libros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'titulo', 'autor', 'etiqueta_smarth')");

        // CAMPO ESPECIAL PARA INVENTARIO DE LIBROS
        DB::statement("ALTER TABLE inventariolibros ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE inventariolibros SET searchtext = to_tsvector('spanish', coalesce(trim(isbn),'') || ' ' || coalesce(trim(clasificacion),'') || ' ' || coalesce(trim(edicion),'') || ' ' || coalesce(trim(codebar),'') )");
        DB::statement("CREATE INDEX inventariolibros_searchtext_gin ON inventariolibros USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON inventariolibros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'isbn', 'clasificacion', 'edicion', 'codebar')");

        // CAMPO ESPECIAL PARA TIPO_MATERIAL
        DB::statement("ALTER TABLE tipomaterial ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE tipomaterial SET searchtext = to_tsvector('spanish', coalesce(trim(tipo_material),'') )");
        DB::statement("CREATE INDEX tm_searchtext_gin ON tipomaterial USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON tipomaterial FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'tipo_material')");

        // CAMPO ESPECIAL PARA editoriales
        DB::statement("ALTER TABLE editoriales ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE editoriales SET searchtext = to_tsvector('spanish', coalesce(trim(editorial),'') || ' ' || coalesce(trim(representante),'') || ' ' || coalesce(trim(telefonos),'') || ' ' || coalesce(trim(email),'') )");
        DB::statement("CREATE INDEX editoriales_searchtext_gin ON editoriales USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON editoriales FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'editorial', 'representante', 'telefonos', 'email')");


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $tableUsers     = config('ibt.table_names.users');
        $tablePersonas  = config('ibt.table_names.personas');
        $tableUbi       = config('ibt.table_names.ubicaciones');
        $tableCatalogos = config('ibt.table_names.catalogos');
        $tableRelaciones = config('ibt.table_names.relaciones');
        $tableBiblos     = config('ibt.table_names.biblos');

        // ROLLBACK DE COMPO ESPECIAL LIBROS
        DB::statement("DROP TRIGGER IF EXISTS tsvector_update_trigger ON libros");
        DB::statement("DROP INDEX IF EXISTS libros_searchtext_gin");
        DB::statement("DROP TRIGGER IF EXISTS ts_searchtext ON libros");
        DB::statement("ALTER TABLE libros DROP COLUMN IF EXISTS searchtext");

        // ROLLBACK DE COMPO ESPECIAL TIPO_MATERIAL
        DB::statement("DROP TRIGGER IF EXISTS tsvector_update_trigger ON tipomaterial");
        DB::statement("DROP INDEX IF EXISTS tm_searchtext_gin");
        DB::statement("DROP TRIGGER IF EXISTS ts_searchtext ON tipomaterial");
        DB::statement("ALTER TABLE tipomaterial DROP COLUMN IF EXISTS searchtext");

        // ROLLBACK DE COMPO ESPECIALEDITORIALES
        DB::statement("DROP TRIGGER IF EXISTS tsvector_update_trigger ON editoriales");
        DB::statement("DROP INDEX IF EXISTS editoriales_searchtext_gin");
        DB::statement("DROP TRIGGER IF EXISTS ts_searchtext ON editoriales");
        DB::statement("ALTER TABLE editoriales DROP COLUMN IF EXISTS searchtext");

        Schema::dropIfExists($tableBiblos['codigopaises']);
        Schema::dropIfExists($tableBiblos['editoriale_libro']);
        Schema::dropIfExists($tableBiblos['inventariolibro_portada']);
        Schema::dropIfExists($tableBiblos['historiallibros']);
        Schema::dropIfExists($tableBiblos['portadas']);
        Schema::dropIfExists($tableBiblos['inventariolibros']);
        Schema::dropIfExists($tableBiblos['libros']);
        Schema::dropIfExists($tableBiblos['editoriales']);
        Schema::dropIfExists($tableBiblos['tipomaterial']);


    }
}
