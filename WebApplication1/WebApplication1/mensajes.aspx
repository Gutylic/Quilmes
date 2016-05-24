<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mensajes.aspx.cs" Inherits="WebApplication1.mensajes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Quilmes - Cerveza</title>
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
   
    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
         
                
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title" style="text-align:center">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                                Libro de sugerencias
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <textarea id="TextArea1" rows="2" cols="20" style="width:100%; height:300px"></textarea>
                            <input id="Button1" type="button" value="Enviar sugerencia" class="btn btn-danger" style="width:100%;" />
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title" style="text-align:center">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                subi tu foto 
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                           boton con conexion a whatsapp
                        </div>
                    </div>
                </div>
               
           

                
            </div>
          </div> 
       
    </header>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
   
    </form>
</body>
</html>
