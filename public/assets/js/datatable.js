
$(document).ready(function() {

    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $("meta[name='csrf-token']").attr("content")
        }
    });

    if ( $(".table").length > 0 ){

        var nCols = $(".table").find("tbody > tr:first td").length;
        var aCol = [];

        aCol[nCols - 1] = {"sorting": false};
        if (aCol.length > 0 ){
            $(".table").DataTable({
                searching: true,
                paging: true,
                info: true,
                "pageLength": localStorage.ItemsForTable,
                "order": [[ 0, "desc" ]],
                "oLanguage": {
                    "sLengthMenu": "_MENU_ registros por página",
                    "oPaginate": {
                        "sPrevious": "&lsaquo;",
                        "sNext": "&rsaquo;"
                    },
                    "sSearch": "Buscar",
                    "sProcessing":"Procesando...",
                    "sLoadingRecords":"Cargando...",
                    "sZeroRecords": "No hay registros",
                    "sInfo": "_START_ - _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "No existen datos",
                    "sInfoFiltered": "(De _MAX_ registros)"
                },
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]],
                "aaSorting": [[ 0, "desc" ]],
                "aoColumns": aCol,
                "bRetrieve": true,
                "bDestroy": false

            });
        }
    }


});
