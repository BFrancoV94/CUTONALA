<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista</title>
        <link rel="stylesheet" href="../css/styles-Header.css"/>
        <link rel="stylesheet" href="../css/Footer-white.css">
        <link rel="stylesheet" href="../css/styles-formReg.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <link rel="shorcut icon" href="../imgs/udg.jpg"> 
        <link rel="stylesheet" href="css/styles-lista.css"/>
        <link href="https://file.myfontastic.com/a8ZvznDTaLhAc2PB4WcHnH/icons.css" rel="stylesheet">
    </head>
    <body>
    	<header>
			<nav class="navbar navbar-default" id="navigation-purple">
        		<div class="container">
            		<a href="#"><img class="img-responsive img-circle avatar" src="../imgs/cut.jpg" alt="Avatar"></a>
            		<div class="navbar-header">
                		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
                		</button>
            		</div>
            		<div class="collapse navbar-collapse" id="myNavbar">
		                <ul class="nav navbar-nav">
		                    <li><a href="registroMaterias.jsp">Home</a></li>
		                    <li><a href="materia.jsp">Mis Materias</a></li>
		                    <li><a href="#">Listas</a></li>
		                    <li><a href="../formats/logout.jsp">Salir</a></li>
		
		                </ul>
		            </div>
		        </div>
    		</nav>
		</header>
		<section class="section">
			<div class="contenedor-menu">	
				<h3>Materias Registradas </h3>
				<ul  class="menu">
                                    <% for (int i = 0; i < 5; i++) {
                                    %>
					<li ><a href="#">Programación I<i class="icon-down icon"></i></a>
						<ul >
							<li>
								<p>Nombre | completo</p>
								<p>Código alumno</p>
							</li>
							<li>
								<p>Edgar figueroa gútierrez</p>
								<p>212317663</p>
							</li>
							<li>
								<p>Nancy deÁnda</p>
								<p>212317634</p>
							</li>
                                                        <br>
                                                        
						</ul>
                                            
                                        </li>	
                                        
					<li ><a href="#">Estadistica y probabilidad<i class="icon-down icon"></i></a>
                                            
						<ul >
							<li>
								<p>Nombre completo</p>
								<p>Código alumno</p>
							</li>
							<li>
								<p>Edgar figueroa gútierrez</p>
								<p>212317663</p>
							</li>
							<li>
								<p>Nancy deÁnda</p>
								<p>212317634</p>
							</li>
						</ul>
                                        
                                        <% } %>
				</ul>
                                
			</div>
				
			<aside class="lateral">
                            <div class="add-btn-alumno"> 
                                <h3>Agregar Alumno(s)</h3>
                                <button onclick="form();" id="btnForm"><img src="imgs/icons/add.png" /> Aregar </button>
                            </div>
				<div class="contenedor-form">
                                    <h2>Agregar Alumnos</h2><br>
					<form action="" method="get">
                                            <input type="text" name="nombres" placeholder="Nombres"><br>
						<input type="text" name="apellido_paterno" placeholder="Apellido Paterno"><br>
						<input type="text" name="apellido_materno" placeholder="Apellido Materno"><br>
						<input type="text" name="codigo" placeholder="Matricula estudiante"><br>
						<input type="text" name="asignatura" placeholder="Asignatura" class="asignatura"><br>
                                                <div id="inRadio">
							<label for="matutino">	Matutino </label>
							<input type="radio" id="matutino" name="turno" value="matutino">
							<label for="vespertino"> Vespertino </label>
							<input type="radio" id="vespertino" name="turno" value="vespertino">
						</div>
					</form>
				</div>
                            
			</aside>
		</section>
		<footer id="myFooter">
	        <div class="container">
	            <ul>
	                <li><a href="#">Manual de Usuario</a></li>
	                <li><a href="#">Sugerencias</a></li>
	                <li><a href="#">Termino & Condiciones</a></li>
	            </ul>
	        
	            <p class="footer-copyright">Universidad de Guadalajara - CUTONALÁ <small>&copy;</small> 2017 Copyright</p><br>
	            
	            <div class="div-img">
	                <img src="../imgs/UDG.png" alt=""/>
	                <img class="img-responsive img-circle avatar" src="../imgs/cut.jpg" alt="Avatar"/>
	            </div>
	        </div>  
   		</footer>
   		
   		 <script src="../js/jsApi.js"></script>
   		 <script src="js/script.js"></script>
		 <script src="../js/bootstrap.js"></script>
    </body>
</html>    