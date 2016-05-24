<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="metodo.aspx.cs" Inherits="WebApplication1.metodo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>

    <script type = "text/javascript">
        jQuery(document).ready(function() {
            $('#btnPrueba').click(function() {
               
                if (navigator.geolocation) {
                    //intentamos obtener las coordenadas del usuario
                    navigator.geolocation.getCurrentPosition(function (objPosicion) {
                        //almacenamos en variables la longitud y latitud
                        var iLongitud = objPosicion.coords.longitude, iLatitud = objPosicion.coords.latitude;
                        alert(ilongitud);
                        function sendDataAjax(nombre, apellido) {
                            var actionData = "{'nombre': '" + nombre + "','apellido': '" + apellido + "'}";


                        //pasamos las variables por ajax
                       
                            $.ajax({
                                dataType: "json",
                                type: 'post',
                                url: 'metodo.aspx/GetDataAjax',
                                data: actionData,
                                success: function (data) {
                                    document.write(data);
                                }
                            });
                            errorjs.innerHTML = '<img src="load.gif" />';
                        };


                    }, function (objError) {
                        //manejamos los errores devueltos por Geolocation API
                        switch (objError.code) {
                            //no se pudo obtener la informacion de la ubicacion
                            case objError.POSITION_UNAVAILABLE:
                                errorjs.innerHTML = 'La informaci&oacute;n de tu posici&oacute;n no es posible';
                                break;
                                //timeout al intentar obtener las coordenadas
                            case objError.TIMEOUT:
                                errorjs.innerHTML = "Tiempo de espera agotado";
                                break;
                                //el usuario no desea mostrar la ubicacion
                            case objError.PERMISSION_DENIED:
                                errorjs.innerHTML = 'Necesitas permitir tu localizaci&oacute;n';
                                break;
                                //errores desconocidos
                            case objError.UNKNOWN_ERROR:
                                errorjs.innerHTML = 'Error desconocido';
                                break;
                        }
                    });
                } else {
                    //el navegador del usuario no soporta el API de Geolocalizacion de HTML5
                    errorjs.innerHTML = 'Tu navegador no soporta la Geolocalizaci&oacute;n en HTML5';
                }



            });
        })();
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
         Nombre: <input type="text" id="txtNombre" /> <br />
    Apellido: <input type="text" id="txtApellido" /> <br />
    <input type="button" id="btnPrueba" value="Probando AJAX" />
    </div>
    </form>
</body>
</html>
