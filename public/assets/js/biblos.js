function getFormInline(Obj){

    if ( $('.btnBackInline') ) {
        var Id = Obj.attr('id');
        if (Id !== 'none'){
            var arrId = Id.split('-');
            var $IdAnt = $("#"+arrId[0]);
            var $IdNxs = $("#"+arrId[1]);
            // Llamada al Form
            $(".btnFormInline").on("click",function (event) {
                event.preventDefault();
                //alert( event.currentTarget.id );
                //editInLine
                $IdNxs.empty();
                $IdAnt.hide(function () {
                    $.ajax({
                        method: "GET",
                        url: "newLibro"
                    }).done(function (html) {
                        $IdNxs.html(html).show('slow', function () {

                            return false;
                        });
                    }, "html");
                });
            });
        }
    }
}

