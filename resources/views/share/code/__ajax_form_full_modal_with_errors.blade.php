<script>

    var strElements = "input, select, checkbox, textarea, radio, file, img";

    if ( $('#btnSubmitFormModal') ){
        $('#cargando').hide();
        $('#btnSubmitFormModal').on('click',function (event) {
            event.preventDefault();
            var $form = $("#formFullModal");
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
                    window.location.reload();
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
