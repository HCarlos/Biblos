
$(document).ready(function() {


    const token = window.localStorage.getItem('access_token');

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function getFormInline(Obj) {

        let Id = Obj.attr('id');
        if (Id !== 'none') {
            let arrId = Id.split('-');
            let $IdAnt = $("#" + arrId[0]);
            let $IdNxs = $("#" + arrId[1]);
            // Llamada al Form
            $(".btnFormInline").on("click", function (event) {
                event.preventDefault();
                var Url = this.id;
                //editInLine
                $IdNxs.empty();
                $IdAnt.fadeOut('slow', function () {
                    $.ajax({
                        method: "GET",
                        url: Url
                    }).done(function (html) {

                        $IdNxs.fadeIn('fast', function () {
                            $(this).html(html);

                            return false;
                        });
                    }, "html");
                });
            });
        }

    }
/*

    $("#sugerencias").show();
    $("#bajesTotalItems").hide();
    if ($(".frmSearchLibro")) {
        $(".frmSearchLibro").on('submit', function (event) {
            event.preventDefault();

            let dataObj = $(this).serialize();
            let totalItems = 0;

            $("#itemsLibros").empty();
            $("#totalItems").empty();
            $("#sugerencias").hide();
            $("#bajesTotalItems").hide();

            $.ajax({
                method: "POST",
                url: '/searchbook',
                data: dataObj
            }).done(function (data) {
                if (parseInt(data.length) > 0){
                    jQuery.each(data, function(i, response) {
                            totalItems += parseInt(response.total);
                            $.ajax({
                                method: "GET",
                                url: '/viewcard/'+response.id+'/'
                            }).done(function (html) {
                                $("#itemsLibros").append(html);
                            }, "html");
                    });
                }else{
                    alert(data.value);
                    $("#itemsLibros").html(data.value);
                }
                $("#bajesTotalItems").show();
                $("#totalItems").html(totalItems);
            }, "json");


        });
    }

*/

});
