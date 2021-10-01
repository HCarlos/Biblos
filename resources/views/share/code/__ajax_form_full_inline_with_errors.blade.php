<script>

    var strElements = "input, select, checkbox, textarea, radio, file, img";

    let Id = $("#{{$FormInline}}").attr('id');
    let arrId = Id.split('-');
    let $IdAnt = $("#"+arrId[0]);
    let $IdNxs = $("#"+arrId[1]);


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
                    gotoBack();
                }).fail(function(response) {
                    sayErrors(response.responseJSON.errors, $form);
                });
            });
        })
        $('.btnFormInlineBack').on('click',function(event){
            event.preventDefault();
            gotoBack();
        });

    }

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
