<%@page import="java.security.MessageDigest"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : inicio
    Created on : 18/12/2017, 02:23:01 PM
    Author     : bryan
--%>
<%@page import="processBD.conexionBD"%>
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
            <title>Inicio</title>
        <link rel="stylesheet" href="../assets/css/InicioDocentes.css">
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
  <li><a href="#!" class="white-text">Modificar Datos</a></li>
  <li class="divider"></li>
  <li><a href="#!" class="white-text">Clases</a></li>
  <li class="divider"></li>
  <li ><a href="../formats/logout.jsp" class="white-text">Salir</a></li>
</ul>
<!-- fin menu -->


<div class="col s12 m8 offset-m2 l6 offset-l3">
  <div class="card-panel grey lighten-5 z-depth-1">
    <div class="row valign-wrapper">
        
      <div class="col s12">
          <br>
          <span class="black-text">
         <% out.print(Nombre+" "+Apellidos); %>
        </span>
        <div class="divider"></div><br>
       <nav>
          <div class="nav-wrapper teal darken-4">
            <div class="col s12">
              <a href="#" class="breadcrumb"><i class="material-icons left">home</i> Inicio</a>
            </div>
          </div>
        </nav>
        <div class="row">
          <div class="col s12 m6">
            <div class="card">
              <div class="card-image">
                <img src="../assets/imgs/bckg-wor.png" alt="" class="responsive-img">
                <a href="datos-personales.jsp" class="btn-floating pulse halfway-fab red z-depth-3"><i class="material-icons">person</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Datos Personales</span>
                <p>
                  Cambiar datos personales( Nombre, Apellidos y Correo Electronicó ).
                </p>
              </div>
            </div>
          </div>
          
          <div class="col s12 m6">
            <div class="card">
              <div class="card-image">
                <img src="../assets/imgs/bckg-wor.png" alt="" class="responsive-img">
                <a href="seguridad.jsp" class="btn-floating pulse halfway-fab red z-depth-3"><i class="material-icons">security</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Datos de Sistema</span>
                <p>Cambiar datos de sistema( Codigo, Usuario y Contraseña )</p>
              </div>
            </div>
          </div>
            
          <div class="col s12 m6">
            <div class="card">
              <div class="card-image">
                <img src="../assets/imgs/bckg-wor.png" alt="" class="responsive-img">
                <a class="btn-floating pulse halfway-fab red z-depth-3"><i class="material-icons">account_circle</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Ver Alumnos</span>
                <p>Ingresa a esta seccion para ver todos tus alumnos registrados</p>
              </div>
            </div>
          </div>
            
          <div class="col s12 m6">
            <div class="card">
              <div class="card-image">
                <img src="../assets/imgs/bckg-wor.png" alt="" class="responsive-img">
                <a class="btn-floating pulse halfway-fab red z-depth-3"><i class="material-icons">book</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Ver Materias</span>
                <p>Ingresa a esta seccion para ver todas tus materias registradas </p>
              </div>
            </div>
          </div>
            
          <div class="col s12 m12 clases">
            <div class="card">
              <div class="card-image">
                <img src="../assets/imgs/bckg-wor.png" alt="" class="responsive-img">
                <a class="btn-floating pulse halfway-fab red z-depth-3"><i class="material-icons">library_books</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Clases</span>
                <p>Ingresa para ver tus clases actuales </p><br>
                <a href="" class="btn">Ver Clases</a>
              </div>
            </div>
          </div>
            
        </div>  
        
      </div>
    </div>
  <div class="divider"></div>
        <img src="../assets/imgs/Logo-UDG.png" class="responsive-img imgLogo" />
  <div class="divider"></div>
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