<%-- 
    Document   : datos-personales
    Created on : 30/01/2018, 08:30:12 PM
    Author     : bryan
--%>

<%@include file="formats/dtosDocente.jsp" %>
<%@page session="true" %>
<% if(userTeacher!="" && acceso!=null){ %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="Authors" content="Eduardo Vargas - Bryan Franco ">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Datos Personales <%=Nombre%></title>
        <link rel="shortcut icon" href="../assets/imgs/cut.jpg">
        <link href="../assets/css/library/fontsIcons.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/library/materialize.min.css">
    </head>
    <body>
         <!-- Menu -->

<nav class="teal lighten-2 z-depth-2">
  <div class="nav-wrapper">
    <a href="#!" class="brand-logo">
        <img src="../assets/imgs/cut.jpg" class="responsive-img circle" style="width: 10%;padding:0%;" >
    <% out.print(Nombre); %>
    </a>
    <a href="#" data-activates="mobile-collap" class="button-collapse">
      <i class="material-icons">menu</i>
    </a>
    <ul class="right hide-on-med-and-down">
      
      <li>
        <a href="sass.html">Añadir Alumno
          <i class="material-icons right">person_add</i>
        </a>
      </li>
      <li>
          <a href="registroMaterias.jsp">
          Añadir materia
          <i class="material-icons right">add_circle</i>  
        </a>
      </li>
      <li>
        <a href="#" data-activates="mobile-collap" class="mobile-col">
      <i class="material-icons">dashboard</i>
    </a>
      </li>
      <!-- Dropdown Trigger -->
      <li>
        <a class="dropdown-button" href="#!" data-activates="dropdown4">
          Menu
          <i class="material-icons right">menu</i>
        </a>
      </li>
    </ul>
    <ul id="mobile-collap" class="side-nav teal darken-4">
      <li>
        <div class="user-view">
          <div class="background">
            <img src="../assets/imgs/blue-back.jpg" class="responsive-img">
          </div>
          <a href="#!user"><img class="circle" src="../assets/imgs/cut.jpg"></a>
          <a href="#!perfil">
              <span class="white-text name" style="font-size: 80%;"><% out.print(Nombre+" "+Apellidos); %></span>
          </a>
          <a href="maestros/perfil.html">
              <span class="white-text email"><%=Email%></span>
          </a>
        </div>
      </li>
      <li>
          <a href="inicio.jsp" class="white-text ">
         <i class="material-icons left">home</i>
         Inicio
        </a>
      </li>
      <li>
        <a href="sass.html" class="white-text">
        <i class="material-icons left">person_add</i>
        Añadir Alumno
        </a>
      </li>
      <li>
        <a href="registroMaterias.jsp" class="white-text">
         <i class="material-icons left">add_circle</i>
         Añadir Materia
        </a>
      </li>
      <li>
        <a href="../formats/logout.jsp" class="white-text">
        <i class="material-icons left">close</i>
        salir</a>
      </li>
    </ul>
  </div>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown4" class="dropdown-content teal lighten-2 white-text">
  <li class="teal darken-2"><a href="#!" class="white-text">Alumnos</a></li>
  <li class="divider"></li>
  <li class="teal darken-2"><a href="#!" class="white-text">Clases</a></li>
   <li class="divider"></li>
   <li class="teal darken-2"><a href="inicio.jsp" class="white-text">Inicio</a></li>
  <li class="divider"></li>
  <li class="teal darken-2"><a href="../formats/logout.jsp" class="white-text">Salir</a></li>
</ul>
<!-- fin menu -->


<br>
<div class="col s12 m8 offset-m2 l6 offset-l3">
  <div class="card-panel z-depth-0">
    <div class="row valign-wrapper">
      
      <div class="col s12">
        <span class="black-text">
         <% out.print(Nombre); %>
        </span>
        <div class="divider"></div><br>
       <nav>
          <div class="nav-wrapper teal darken-4">
            <div class="col s12">
              <a href="../index.html" class="breadcrumb"><i class="material-icons left">home</i> Inicio</a>
              <a href="../index.html" class="breadcrumb">Datos Personales</a>
            </div>
          </div>
        </nav>
        
        <div class="col s12 m8 offset-m2 l6 offset-l3">
        <div class="card-panel grey lighten-5 z-depth-3">
          <h5 class="center">Datos personales</h5>
        </div>
      </div>

<br><br><br>
      <div class="row z-depth-2">
    <form class="col s12">
      <div class="row">
        
        <div class="col s12 m12 xl6">
          <div class="icon-block">
            <h4 class="black-text"><i class="material-icons">person</i></h4>
            <h6 class="black-text"><label for="name">Nombre(s)</label></h6>
            <input id="name" type="text" name="nameDcnte" value="<%out.print(Nombre);%>" class="validate">
          </div>
        </div>

        <div class="col s12 m12 xl6">
          <div class="icon-block">
            <h4 class="black-text"><i class="material-icons">person</i></h4>
            <h6 class="black-text"><label for="last_name">Apellidos</label></h6>
            <input id="last_name" type="text" name="lstNameDcnte" value="<%out.print(Apellidos);%>" class="validate">
          </div>
        </div>

        <div class="col s12 m12 xl6">
          <div class="icon-block">
            <h4 class="black-text"><i class="material-icons">email</i></h4>
            <h6 class="black-text"><label for="email">Email</label></h6>
            <input id="email" type="email" value="<%out.print(Email);%>" class="validate">
          </div>
        </div>

        <div class="col s12 m12 xl6">
          <div class="icon-block">
            <h4 class="black-text"><i class="material-icons">lock_outline</i></h4>
            <h6 class="black-text"><label for="email">Contraseña</label></h6>
            <input id="password" disabled="" value="cce!9ehfs9sdsq" type="password" class="validate">
          </div>
        </div>

        <div class="row">
          <div class="col s12 m6 l6 xl6">
            <div class="">
              <input id="chngePassw" type="submit" class="btn" value="Modificar">
            </div>
          </div>
          <div class="col s12 m6 l6 xl6">
            <div class="">
              <input type="reset" class="btn red darken-4" value="cancelar">
            </div>
          </div>
        </div>
    </form>
  </div>  
</div>  
</div>
</div>

    <div class="row ">
      <div class="col s12 m12 l12 xl12 container center">
        <div class="col s3 m3 l3 xl3 ">
            <a href="registroMaterias.jsp" class="material-icons green-text circle  tooltipped"
             data-position="top" data-delay="50" 
             data-tooltip="Agregar Materia">add_box</a>
        </div>

        <div class="col s3 m3 l3 xl3 ">
            <a href="seguridad.jsp" class="material-icons red-text circle  tooltipped"
             data-position="top" data-delay="50" 
             data-tooltip="Ir a seguridad de usuario">security</a>
        </div>

        <div class="col s3 m3 l3 xl3 ">
          <a href="#!" class="material-icons black-text circle  tooltipped"
             data-position="top" data-delay="50" 
             data-tooltip="Ver alumnos">account_circle</a>
        </div>

        <div class="col s3 m3 l3 xl3 ">
          <a href="#!" class="material-icons blue-text circle  tooltipped"
             data-position="top" data-delay="50" 
             data-tooltip="Ver materias">book</a>
        </div>
        
      </div>
      <br>

      <h5 class="center">
        <!-- <span class="material-icons">arrow_back</span> -->
        <!-- Ir a  -->
        <!-- <span class="material-icons">arrow_forward</span> -->
      </h5>
      <!-- <div class="divider z-depth-2"></div><br> -->
    </div>      
          
      <div class="row">
          <div class="col s12 m12 l6 xl6">
            <img src="../assets/imgs/Logo-UDG.png" class="responsive-img">
          </div>
          <div class="col s12 m12 l6 xl6">
            <img src="../assets/imgs/cutonala.png" class="responsive-img center">
          </div>
      </div>

  </div>
</div>
          

    <script src="../assets/js/library/jquery-3.2.1.min.js"></script>
    <script src="../assets/js/library/materialize.js"></script>
    <script src="../assets/js/library/materialize.min.js"></script>
    <script type="text/javascript">
      $( document ).ready(function(){
        $(".mobile-col").sideNav();
        $(".button-collapse").sideNav();
         $('.dropdown-button').dropdown({
            inDuration: 500,
            outDuration: 225,
            constrainWidth: true, // Does not change width of dropdown to that of the activator
            hover: true, // Activate on hover
            gutter: 0, // Spacing from edge
            belowOrigin: false, // Displays dropdown below the button
            alignment: 'left', // Displays dropdown with edge aligned to the left of button
            stopPropagation: true // Stops event propagation
          }
        );
      });
    </script>
    <footer class="page-footer teal darken-4">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Centro Universitario de Tonalá</h5>
                <p class="grey-text text-lighten-4">
                  Universidad de Guadalajara
                </p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Enlaces <i class="material-icons right">link</i> </h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Perfil</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Bandeja</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Materias</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Alumnos</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2017  CUTONALÁ - UDG
            <a class="grey-text text-lighten-4 right" href="#!">
               <i class="material-icons right">developer_board</i>
               Manual de usuario</a>
            </div>
          </div>
          
        </footer>
    </body>
</html>
<%
    conexionDocent.closeBD();
%>
<% }else{
        response.sendRedirect("../formats/logout.jsp");
    }
%>