<script>

    var strElements = "input, select, checkbox, textarea, radio, file, img";

    if ( $('#btnFormInlineSubmit') ){
        $('#cargando').hide();
        $('#btnFormInlineSubmit').on('click',function (event) {
            event.preventDefault();
            var $form = $("#formInline");
            var Url = $form.attr('action');
            var formData = {};
            $form.find(strElements).each(function() {
                if ( $(this).attr('type') == 'checkbox' ){
                    if ($(this).is(":checked")){
                        formData[ $(this).attr('name') ] = $(this).val();
                    }
                }else{
                    formData[ $(this).attr('name') ] = $(this).val();
                }
            });
            $(function() {
                $.ajax({
                    method: "{{$Method}}",
                    data: formData,
                    url: Url
                }).done(function( response ) {

                    var Obj = $(".btnBackInline").attr('id');
                    var Id = Obj.attr('id');
                    alert(Id);
                    var arrId = Id.split('-');
                    var $IdAnt = $("#"+arrId[1]);
                    var $IdNxs = $("#"+arrId[0]);
                    $IdNxs.empty();
                    $IdAnt.hide(function () {
                        $IdNxs.show('slow', function () {
                        });
                    });

                }).fail(function(response) {
                    sayErrors(response.responseJSON.errors, $form);
                });
            });
        })
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
