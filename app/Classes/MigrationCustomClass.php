<?php

namespace App\Classes;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class MigrationCustomClass extends Schema{

    static function DropColumnIfExists($myTable, $column){
        if (static::hasColumn($myTable, $column)) {
            static::table($myTable, function (Blueprint $table) use ($column) {
                $table->dropColumn($column); //drop it
            });
        }
    }

}
