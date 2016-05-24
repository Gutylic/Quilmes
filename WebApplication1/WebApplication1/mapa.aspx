<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapa.aspx.cs" Inherits="WebApplication1.mapa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <title>Posicionamiento con HTML , JavaScript y Google Maps</title>
    <script type='text/javascript' 
        src='http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js?ver=3.1.2'></script> 
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?&sensor=false"></script>
    <style type="text/css"> 
        html, body { height: 100%; margin: 0; padding: 0; } 
        #mapa_content { height: 100%; }
        @media print {
            html, body {
                height: auto;
            }

            #mapa_content {
                height: 650px;
            }
        }

    </style> 
    <script type="text/javascript"> var mapa; function inicializar() 
 { var opciones = { zoom: 6, mapTypeId: google.maps.MapTypeId.ROADMAP }; 
 mapa = new google.maps.Map(document.getElementById('mapa_content'), opciones); 
 if (navigator.geolocation) { //Hago el CallBack a mostrarLocalizacion 
     navigator.geolocation.getCurrentPosition(mostrarLocalizacion,manejadorDeError); } 
 else{ //Caso contraio muestro error 
     alert("Su navegador no soporta Geolocalizacion"); 
 } } function mostrarLocalizacion(posicion) 
 {
     var pos = new google.maps.LatLng(posicion.coords.latitude, posicion.coords.longitude); //Muestro un tooltip con un mensaje sobre el mapa 
     var infowindow = new google.maps.InfoWindow({ map: mapa, position: pos, content: 'Tu ubicacion usando HTML5.' }); mapa.setCenter(pos);
 } function manejadorDeError(error) { switch (error.code) { case error.PERMISSION_DENIED: alert("El usuario no permite compartir datos de geolocalizacion"); break; case error.POSITION_UNAVAILABLE: alert("Imposible detectar la posicio actual"); break; case error.TIMEOUT: alert("La posicion debe recuperar el tiempo de espera"); break; default: alert("Error desconocido"); break; } var opciones = { map: mapa, position: new google.maps.LatLng(60, 105), content: content }; var infowindow = new google.maps.InfoWindow(opciones); mapa.setCenter(opciones.position); } google.maps.event.addDomListener(window, 'load', inicializar); </script>
   
    


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="mapa_content"></div> <!-- Div contenedor del mapa -->


    </div>
    </form>
</body>
</html>
