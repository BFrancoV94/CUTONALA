<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Materias</title>
        <link rel="stylesheet" href="../css/styles-Header.css"/>
        <link rel="stylesheet" href="../css/Footer-white.css">
        <link rel="stylesheet" href="../css/styles-formReg.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <link rel="shorcut icon" href="../imgs/udg.jpg"> 
        <link href="https://file.myfontastic.com/a8ZvznDTaLhAc2PB4WcHnH/icons.css" rel="stylesheet">
    </head>
    <body onload="lanzar()">
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
		                    <li><a href="lista.jsp">Listas</a></li>
		                    <li><a href="../formats/logout.jsp">Salir</a></li>
		
		                </ul>
		            </div>
		        </div>
    		</nav>
		</header>
		<section class="section">
			<div class="contenedor-menu materias">	
				<h3>Materias Registradas </h3>
				<ul  class="menu">
					<li><a href="#">Pogramación I<i class="icon-down icon"></i></a>
						<ul >
							<li>
								<p>Parcial I</p>
								<p>Tareas 10%</p>
								<p>Acistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
							<li>
								<p>Parcial II</p>
								<p>Tareas 10%</p>
								<p>Asistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
							<li>
								<p>Parcial III</p>
								<p>Tareas 10%</p>
								<p>Asistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
						</ul>
					</li>
					<li><a href="#">Estadistica y probabilidad<i class="icon-down icon"></i></a>
						<ul >
							<li>
								<p>Parcial I</p>
								<p>Tareas 10%</p>
								<p>Acistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
							<li>
								<p>Parcial II</p>
								<p>Tareas 10%</p>
								<p>Acistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
							<li>
								<p>Parcial III</p>
								<p>Tareas 10%</p>
								<p>Acistencias  10% </p>
								<p>Examen 30% </p>
								<p>Proyecto 50%</p>
								<p>Total 100%</p>
							</li>
						</ul>
					</li>	
				</ul>
			</div>
		</section>
        <br><br><br><br><br>
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