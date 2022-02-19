<script src="{{ asset('node_modules/sweetalert2/dist/sweetalert2.all.js') }}"></script>
<script >

    jQuery(function($) {
        $(document).ready(function() {

            $('.btnRestablecerDisponible').on('click', function(event) {
                event.preventDefault();

            var arr0 = event.currentTarget.id.split('-');
            var Id = arr0[1];

            var getParents = "/getItemParent/";

            var Objs = [".btnRestablecerDisponible"];
            var Tits = ["Apartados"];
            var Msgs = ["Desea restablecer dicho ejemplar a DISPONIBLE?"];
            var Urls = ["saveRestablecerDisponible"];

            for (i=0;i<Objs.length;i++)
                if ( $(Objs[i]) ) callAjax($(Objs[i]), Tits[i], Msgs[i], i, Urls[i]);

            function callAjax(Obj, Tits, Msgs, Item, Urls) {


                var swalWithBootstrapButtons = Swal.mixin({
                    buttonsStyling: false
                });


                swalWithBootstrapButtons.fire({
                    title: Tits,
                    text: Msgs,
                    type: 'warning',
                    showCancelButton: true,
                    scrollbarPadding: false,
                    confirmButtonText: 'Si, adelante!',
                    cancelButtonText: 'No, cancelar!',
                    reverseButtons: true,
                    customClass: {'confirmButton': 'btn btn-green mx-2 px-3',  'cancelButton': 'btn btn-red mx-2 px-3'}
                }).then(function(result) {
                    if (result.value) {
                        $.ajax({
                            method: "GET",
                            url: Urls+"/"+Id+"/"
                        })
                        .done(function( response ) {
                            if (response.data == 'OK'){
                                swalWithBootstrapButtons.fire({
                                    title: 'Éxito!',
                                    text: 'Operation completeda con éxito.',
                                    type: 'success',
                                    icon: 'success',
                                    customClass: {'confirmButton': 'btn btn-info px-5'}
                                })
                                // window.location.reload();
                            }else{
                                swalWithBootstrapButtons.fire({
                                    title: 'Error',
                                    text: response.mensaje,
                                    type: 'error',
                                    icon: 'error',
                                    customClass: {'confirmButton': 'btn btn-secondary px-5'}
                                })

                            }
                        })
                    } else if (
                        result.dismiss === Swal.DismissReason.cancel
                    ) {
                        swalWithBootstrapButtons.fire({
                            title: 'Cancelado',
                            text: 'Operación abortada.',
                            type: 'error',
                            icon: 'error',
                            customClass: {'confirmButton': 'btn btn-secondary px-5'}
                        })
                    }
                });

            }

            });

        });
    });

</script>

