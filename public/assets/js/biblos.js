
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





});
