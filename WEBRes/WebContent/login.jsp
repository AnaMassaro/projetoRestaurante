<%@page import="control.UserDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="style.css">
	
	<style>
	
	  body {
            background-image:url(./img/fundoLogin.jpg);  
            background-repeat: no-repeat;
            background-size: cover;
        }
	
	 body,html{
     		height:100%;
     }
     .c{
     	margin-top:15%;
     }
     
      a:hover{
     	text-decoration:none;
     }
     
	</style>
</head>
<body>

	<%
		String user = request.getParameter("user");
		String senha = request.getParameter("senha");
		
		User u = new User();
		UserDAO ud = new UserDAO();
		
		if( (user != null) && (senha != null)) {
			boolean login = ud.login(user, senha);
			if(login == true) {
				response.sendRedirect("cadastrarProduto.jsp");
			}else {
				response.sendRedirect("login.jsp");
			}
		}
	%>

	<div class="container c">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-4">
					<div class="card p-5" style="background-color:rgba(46, 45, 44,0.7)">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-12">
									<form action="#" method="get">
									<div class="input-group mb-3">
 										 <div class="input-group-prepend">
    										<span class="input-group-text" id="basic-addon1"><img src="img/iconeLogin.png" height="20px" width="20px"></span>
  										 </div>
  											<input type="text" name="user" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
									</div>
									
									
									<div class="input-group mb-3">
 										 <div class="input-group-prepend">
    										<span class="input-group-text" id="basic-addon1"><img src="img/cadeado.png" height="20px" width="20px"></span>
  										 </div>
  											<input type="password" name="senha" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
									</div>
									
									<div class="form-group">
									<button class="btn btn-danger btn-block" type="submit">Acessar</button>
									
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>

</body>
</html>