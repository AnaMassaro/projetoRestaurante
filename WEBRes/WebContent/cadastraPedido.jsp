<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Pedido</title>

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
            background-image:url(./img/finalizar.jpg);  
            background-repeat: no-repeat;
            background-size: cover;
            
        }
     </style>
	
</head>
<body>


	<div class="container mt-5">           
        <div class="row ">
   			<div class="col-4">
   			
   			</div>
   			<div class="col-lg-4 col-sm-12">
   				<div class="card c">
   					<div class="card-header">
   						<h5>Cadastrar Pedido</h1>
   					</div>
   					<div class="card-body">
   						
   							
   							
   							<div class="form-group">
   								<label>Numero do pedido</label>
   								<input type="text" name="nPedido" class="form-control" disabled placeholder="Preenchimento AUTOMATICO">
   							</div>
   						<form method="get" action="Processa">
   							<div class="form-group">
   								<label>Insira a identificação do cliente</label>
   								<input type="text" name="comanda" class="form-control">
   							</div>
   							
   					
   							<input type="hidden" name="acao" value="aquiPEDIDO">
   							<input type="submit" class="btn btn-danger btn-block">
   						</form>
   						
   					</div>
   				</div>
   			</div>
        </div>
    </div>
</body>
</html>