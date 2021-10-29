<script src="{{ asset('assets/js/biblos.js') }}"></script>
<script>

    var strElements = "input, select, checkbox, textarea, radio, file, img";

    let Id = $("#{{$FormInline}}").attr('id');
    let arrId = Id.split('-');
    let $IdAnt = $("#"+arrId[0]);
    let $IdNxs = $("#"+arrId[1]);

    $(".btnFormInline").on("click",function (event) {
        event.preventDefault();
        var Url = this.id;
        //editInLine

        alert("#"+arrId[0]+' - '+"#"+arrId[1]);

        $IdNxs.empty();
        $IdAnt.fadeOut('slow',function () {
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

    if ( $(".removeItem").length > 0  ){
        $(".removeItem").on("click", function(event) {
            event.preventDefault();
            var aID = event.currentTarget.id.split('/');
            var x = confirm("Desea eliminar el registro: "+aID[1]);

            if (!x){
                return false;
            }

            var Url = event.currentTarget.id;

            $(function() {
                $.ajax({
                    method: "GET",
                    url: Url
                })
                    .done(function( response ) {
                        if (response.data == 'OK'){
                            alert(response.mensaje);
                            window.location.reload();
                        }else{
                            alert(response.mensaje);
                        }
                    })
            });
        });
    }

    $('.btnFormInlineBack').on('click',function(event){
        event.preventDefault();
        gotoBack();
    });

    function gotoBack(){
        $IdNxs.fadeOut('slow',function (){
            $IdNxs.empty();
            window.location.reload();
            return false;
        });
    }

    function sayErrors(errors, $form){
        $form.find(strElements).each(function() {
            $(this).removeClass('has-error form-error');
        });
        $('.text-danger').empty();
        $.each( errors, function( key, val ) {
            $('#' + key ).addClass('has-error form-error');
            $('.has-' + key ).find('.text-danger').text(val);
        });
    }

</script>
