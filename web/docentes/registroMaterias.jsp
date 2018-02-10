<%@page import="processBD.conexionBD"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : registroMaterias
    Created on : 4/05/2017, 12:02:44 PM
    Author     : bryan
--%>
<%
    //creo mis objetos tipo conexion
    conexionBD cn=new conexionBD();
    conexionBD cne=new conexionBD();   
    conexionBD cnData=new conexionBD();
%>
<%@page import="processBD.conexionBD"%>
<%@include file="formats/dtosDocente.jsp" %>
<%@page session="true" %>
<%
    if(userTeacher!="" && acceso!=null){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Authors" content="Eduardo Vargas - Bryan Franco ">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido</title>
    <link href="../assets/css/library/fontsIcons.css" rel="stylesheet">
    <link rel="shortcut icon" href="../assets/imgs/cut.jpg">
    <link href="assets/css/library/fontsIcons.css" rel="stylesheet"> 
    <link rel="stylesheet" type="text/css" href="../assets/css/registroMaterias.css">
    <link rel="stylesheet" href="../assets/css/library/materialize.min.css">
    </head>
    <body>
         <!-- Menu -->

<nav class="teal lighten-2 z-depth-4">
  <div class="nav-wrapper">
      <a href="inicio.jsp" class="brand-logo">
      CUTONALÁ
    </a>
    <a href="#" data-activates="mobile-collap" class="button-collapse">
      <i class="material-icons">menu</i>
    </a>
    <ul class="right hide-on-med-and-down">
      
      <li>
        <a href="inicio.jsp">Inicio
          <i class="material-icons right">home</i>
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
              <span class="white-text name" style="font-size: 80%;">bryan Franco</span>
          </a>
          <a href="maestros/perfil.html">
              <span class="white-text email">bryanfranco_94@hotmail.com</span>
          </a>
        </div>
      </li>  
      <li>
         <a href="inicio.jsp" class="white-text">
            <i class="material-icons left white-text">home</i>
            Inicio
        </a>
      </li>
      <li>
        <a href="../formats/logout.jsp" class="white-text">
            <i class="material-icons left white-text">close</i>
            salir
        </a>
      </li>
    </ul>
  </div>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown4" class="dropdown-content teal lighten-2 white-text">
    <li><a href="inicio.jsp" class="white-text">Modificar Datos</a></li>
  <li class="divider"></li>
  <li><a href="#!" class="white-text">Clases</a></li>
  <li class="divider"></li>
  <li ><a href="../formats/logout.jsp" class="white-text">Salir</a></li>
</ul>
<!-- fin menu -->

        
        <script type="text/javascript" class='message'>
            function handleSelect(myForm){
                var valueCarrera=document.getElementsByTagName("formRegM");
                var select = document.getElementById('optionListCarrera').value;
                //alert(myForm.optionListCarrera.options.length);
                var selIndex=myForm.optionListCarrera.selectedIndex;
                //alert(selIndex);
                var selName=myForm.optionListCarrera.options[selIndex].text;
                if(selName==="SELECIONA UNA CARRERA"){
                }else{
                    alert(select);            
                }
            }
        </script>


<div class="container z-depth-4">
  <div class="card">
       <h5 class="white darken-4 center" style="padding: 1%;"><% out.print(Nombre+" "+Apellidos); %></h5>
 <div class="card-image waves-block">
            <img src="../assets/imgs/Logo-UDG.png" class="responsive-img">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">
        <i class="material-icons right">more_vert</i></span>
        <h5 class="center">Registro de Materia</h5>
      <p>
        <div class="row">
            <form class="col s12 m12" id="formRegM"  method="POST" action="registroMaterias.html">
            
            <div class="input-field col s12 m12">
              <select class="icons"  style="text-align: left;" >
                  <option value="" disabled selected>Elije una carrera</option>
                <%
                    try{
                        cne.Conectar();
                        String sqlCarreras="SELECT * FROM carrera ORDER BY Id_carrera ASC";
                        cne.st=cne.conec.createStatement();
                        cne.rt=cne.st.executeQuery(sqlCarreras);
                    }catch(Exception e){
                        out.print(e.toString());
                        out.print("<center>"
                                    +"<p>Ha Ocurrido Un Error "+e.toString()+"<br>"
                                         +"Redirija en este Link(<a href='registroMaterias.jsp'> Cargar de Nuevo</a>)<p>"
                                 +"</center>");
                    }
                    while (cne.rt.next()){
                        out.print(
                             "<option value='"+cne.rt.getString(1)+"' id='optionCarrera' "
                            +" data-icon='../assets/imgs/cut.jpg' class='right circle tooltipped' "
                            +" data-position='left' data-delay='50' data-tooltip=' "+cne.rt.getInt(1)+" ' >"+
                                  cne.rt.getString(2)
                            +"</option>");
                    }
                %>
              </select>
              <label>Selecciona a continuacion una Carrera</label>
            </div>

            <div class="input-field col s12 m12">
              <select class="icons" style="text-align: left;" >
                <option value="" disabled selected>Elije una asignatura</option>
                <div id="resOptionCarrs"></div>
              </select>
              <label>Selecciona a continuacion una asignatura</label>
            </div>
            
            <div class="input-field col s12">
              <select>
                <option value="" disabled selected>salon/aula</option>
                <option value="Aula">Aula</option>
                <option value="Salon">Salon</option>
              </select>
              <label>Selecciona Aula o Salon</label>
            </div>
              
        
        <div class="row z-depth-4">
            <br><br><br><br><br><br><br><br><br><br><br> 
            <br><br><div class="divider"></div><br>  
            
            <div class="input-field col l4 s12 m12">
                <input id="claveDocente" disabled="" type="text" name="claveDocente" class="validate" value="<% out.print(CodigoDocente); %>">
                <label for="claveDocente">Clave de Docente</label>
            </div>
            <div class="input-field col l4 s12 m12">
                <input id="last_name" type="text" class="validate">
                <label for="last_name">Codigo del Curso</label>
            </div>
            <div class="input-field col l4 s12 m12">
                <input id="last_name" type="text" class="validate">
                <label for="last_name">Nombre del Aula/Numero</label>
            </div>
        </div>

        <div class="row z-depth-4">
        <h5 class="center">Eliga un horario para la asignatura</h5>
        <br><div class="divider"></div><br>    
          <div class="col s12 m12">
            <table class="responsive-table ">
              <thead>
                <tr class="">
                    <th class="teal darken-4 white-text">Hora</th>
                    <th class="teal darken-4 white-text">Lunes</th>
                    <th class="teal darken-4 white-text">Martes</th>
                    <th class="teal darken-4 white-text">Miercoles</th>
                    <th class="teal darken-4 white-text">Jueves</th>
                    <th class="teal darken-4 white-text">Viernes</th>
                    <th class="teal darken-4 white-text">Sabado</th>
                </tr>
              </thead>

              <tbody>
            <% 
                String formatHrMat[]={"7:00-9:00","9:00-11:00","11:00-13:00","13:00-15:00","15:00-17:00","17:00-19:00","19:00-21:00"};
                String formatNmeDay[]={"Lunes","Martes","Miercoles","Jueves","Viernes","Sabado"};
                for(int i=0;i<=6;i++){ 
            %>
                <tr>
                    <td><p><% out.print(formatHrMat[i]); %> </p></td>
                    <% for(int j=0;j <= 5 ;j++){ %>
                    <td>
                        <p>
                          <input type="checkbox" id="check_<%out.print(j+"_"+formatHrMat[i]+"_"+formatNmeDay[j]); %>" 
                                 value="<%out.print(formatHrMat[i]+"_"+formatNmeDay[j]); %>" 
                                 name="checkDay" />
                          <label for="check_<%out.print(j+"_"+formatHrMat[i]+"_"+formatNmeDay[j]); %>"
                                 class="tooltipped"
                                 data-position="top" data-delay="50" 
                                 data-tooltip="<%out.print(formatHrMat[i]+"_"+formatNmeDay[j]); %>"><i class="material-icons right">check</i></label>
                        </p>
                    </td>
                     <% } %>
                </tr>
            <% } %>

              </tbody>

            </table>
          </div>
        </div>
        <div class="row">
          <div class="col s6 m6 l6 xl6">
               <button class="btn teal darken-1 z-depth-3" type="submit">Registrar</button>
          </div>
          <div class="col s6 m6 l6 xl6">
                <button class="btn red darken-3 z-depth-3" type="reset">limpiar</button>  
          </div>
        </div>
    </form>
    <br><br>
    <div class="divider"></div><br><br>
    
  </div>
      </p>
    </div>
    <div class="card-reveal">
      	<span class="card-title text-darken-4">
      		<i class="material-icons right">close</i>
      	</span>
      	<h5 class="center">Cancelar registro de asignatura</h5>
      <p>
        <span class="white-text">Da click en el boton para cancelar el registro</span><br>
        <a href="maestros/perfil.html" class="btn ">Cancelar</a>
      </p>
    </div>
  </div>
</div>

 <footer class="page-footer teal darken-4">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text center">Centro Universitario de Tonalá</h5>
                <p class="grey-text text-lighten-4 center">
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
            © 2017  CUTONALÁ - UDG <br>
            <div class="divider"></div>
            <a class="grey-text text-lighten-4 right" href="#!">
               <i class="material-icons right">developer_board</i>
               Manual de usuario</a>
            </div>
          </div>      
</footer>
            
      
        
        
          
<script src="../assets/js/library/jquery-3.2.1.min.js"></script>
    <script src="../assets/js/library/materialize.js"></script>
    <script src="../assets/js/library/materialize.min.js"></script>
    <script src="../assets/js/registroMaterias.js"></script>

    <script type="text/javascript">
      $( document ).ready(function(){
        $(".mobile-col").sideNav();
        $(".button-collapse").sideNav();
        $('.tap-target').tapTarget('open');
        $('.tap-target').tapTarget('close');
        $('select').material_select();
      });
    </script>
</body>    
</html>
<%
    cne.closeBD();
%>
<% }else{
        response.sendRedirect("../formats/logout.jsp");
    }
%>