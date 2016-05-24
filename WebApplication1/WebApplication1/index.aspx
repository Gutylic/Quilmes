<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Quilmes - Cerveza</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
    <script>

        
        $(document).ready(function () {


           
            navigator.geolocation.getCurrentPosition(function (objPosition) {
                var lon = objPosition.coords.longitude;
                var lat = objPosition.coords.latitude;



                var dato = "{'longitud':" + lon + ",'latitud':" + lat + "}";
                $.ajax({
                    type: "POST",
                    url: 'index.aspx/Ubicacion',
                    data: dato,

                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (resultado) {
                        document.getElementById("<%=HiddenField_lon.ClientID%>").value = resultado.d;
                    }
                });




            });

        });
 


       <%-- (function() {
            

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (objPosition) {
                    var lon = objPosition.coords.longitude;
                    var lat = objPosition.coords.latitude;
                    $("#<%=HiddenField_lon.ClientID%>").val(lon.value);

                    document.getElementById("<%=HiddenField_lon.ClientID%>").value = lon.value;
                    alert(lon);
                    alert(document.getElementById("<%=HiddenField_lon.ClientID%>"));
                    document.getElementById("<%=HiddenField_lat.ClientID%>").value = lat.value;

                }, function (objPositionError) {
                    switch (objPositionError.code) {
                        case objPositionError.PERMISSION_DENIED:
                            content.innerHTML = "No se ha permitido el acceso a la posición del usuario.";
                            break;
                        case objPositionError.POSITION_UNAVAILABLE:
                            content.innerHTML = "No se ha podido acceder a la información de su posición.";
                            break;
                        case objPositionError.TIMEOUT:
                            content.innerHTML = "El servicio ha tardado demasiado tiempo en responder.";
                            break;
                        default:
                            content.innerHTML = "Error desconocido.";
                    }
                }, {
                    maximumAge: 75000,
                    timeout: 15000
                });
                
            }
            else {
                content.innerHTML = "Su navegador no soporta la API de geolocalización.";
            }
            
        })();--%>


    </script>
   
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body style="background: url(img/bg.jpg) no-repeat center center fixed; background-size: cover; -webkit-background-size: cover;">
    <form id="form1" runat="server">
    <div>
        
         <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <div class="container" style="margin: 30px; background-color: #D08627; opacity: 0.9;">

                <h2 style="font-weight:bolder; color:white"></h2>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">Q-</span>
                    <asp:TextBox ID="TextBoxCodigo" placeholder="Código" CssClass="form-control" runat="server"></asp:TextBox>
                    <%--<input type="text" class="form-control" placeholder="Código" runat="server" aria-describedby="sizing-addon1">--%>
                </div>
                <asp:Button ID="BtnIngresar" CssClass="btn btn-primary" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" style="width:10px; margin-bottom:20px; margin-top:10px; width:100%; height:40px" />
                <%--<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" style="width:10px; margin-bottom:20px; margin-top:10px; width:100%; height:40px">
                    Ingresar
                </button>--%>
            </div>
            
            <asp:HiddenField ID="HiddenField_lon" runat="server" />
          
        </div>
    </header>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </div>
    </form>
</body>
</html>
