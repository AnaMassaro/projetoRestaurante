<%@page import="model.User"%>
<%@page import="control.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Usuario</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="style.css">
	
	<style>
		body,html{
			height:100%;
		}
		
        body {
            background-image:url(./img/fundoLogin.jpg);  
            background-repeat: no-repeat;
            background-size: cover;
            
        }
        
     </style>
     
</head>
<body>

     <%
    String pegaCod = request.getParameter("codUser");
    
   User u = new User();
   UserDAO ud = new UserDAO();
    
    if(pegaCod != null) {
    	
    	u = ud.getUser(Integer.parseInt(pegaCod));
    %>
    
	<div class="container mt-5">           
        <div class="row ">
   			<div class="col-8">
   			
   			</div>
   			<div class="col-lg-4 col-sm-12">
   				<div class="card c">
   					<div class="card-header">
   						<h5>Editar usuario</h1>
   					</div>
   					<div class="card-body">
   					
   						<form method="get" action="Processa">
   							
   							<input type="hidden" name="codUser" value="<%=u.getCodigoUser() %>">
   							
   							<div class="form-group">
   								<label>User</label>
   								<input type="text" name="userEdit" value="<%=u.getUser() %>" class="form-control">
   							</div>
   					
   							<div class="form-group">
   								<label>Password</label>
   								<input type="text" name="senhaEdit" value="<%=u.getSenha() %>" class="form-control">
   							</div>
   							
   							<input type="hidden" name="acao" value="editarUsuario">
   							<input type="submit" class="btn btn-danger btn-block">
   						</form>
   						<%} %>
   					</div>
   				</div>
   			</div>
        </div>
    </div>

</body>
</html>