<?php

use App\Classes\MigrationCustomClass;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class UpdateBiblos4Tables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){


        // CAMPO ESPECIAL PARA LIBROS
        MigrationCustomClass::DropColumnIfExists('libros','searchtext');
        DB::statement("DROP TRIGGER IF EXISTS ts_searchtext ON libros");
        DB::statement("ALTER TABLE libros ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE libros SET searchtext = to_tsvector('spanish', coalesce(trim(titulo),'') || ' ' || coalesce(trim(autor),'') )");
        DB::statement("CREATE INDEX libros_searchtext_gin ON libros USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON libros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'titulo', 'autor')");

        // CAMPO ESPECIAL PARA INVENTARIO DE LIBROS
        MigrationCustomClass::DropColumnIfExists('inventariolibros','searchtext');
        DB::statement("DROP TRIGGER IF EXISTS ts_searchtext ON inventariolibros");
        DB::statement("ALTER TABLE inventariolibros ADD COLUMN searchtext TSVECTOR");
        DB::statement("UPDATE inventariolibros SET searchtext = to_tsvector('spanish', coalesce(trim(isbn),'') || ' ' || coalesce(trim(clasificacion),'') || ' ' || coalesce(trim(edicion),'') || ' ' || coalesce(trim(codebar),'') || ' ' || coalesce(trim(etiqueta_smarth),'') )");
        DB::statement("CREATE INDEX inventariolibros_searchtext_gin ON inventariolibros USING GIN(searchtext)");
        DB::statement("CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON inventariolibros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'isbn', 'clasificacion', 'edicion', 'codebar', 'etiqueta_smarth')");


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
