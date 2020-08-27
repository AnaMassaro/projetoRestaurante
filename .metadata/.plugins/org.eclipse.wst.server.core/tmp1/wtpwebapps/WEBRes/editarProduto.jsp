<%@page import="control.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Produto</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="style.css">
	
	<style>
	
	  body {
            background-image:url(./img/plano2.jpg);  
            background-repeat: no-repeat;
            background-size: cover;
            
        }
        
		input[type=text]:hover, textarea:hover{ 
		        background: #ffffff; border:1px solid black;
		}
		
		
		#input {
		width:450px;
		}

	</style>
</head>
<body>

	
  <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="adm.jsp" id="escola" style="color: white;">CONTROLE</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                   </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            
                  <ul class="navbar-nav mr-auto">
                    
                    <li class="nav-item">
                      <a class="nav-link" href="controleProduto.jsp" style="color: white;">Controle de produtos</a>
                    </li>
                    
                  </ul>
            </div>
          </nav>
          
              <%
    String pegaCod = request.getParameter("codEdit");
    
    Produto p = new Produto();
    ProdutoDAO pd = new ProdutoDAO();
    
    if(pegaCod != null) {
     p = pd.getProduto(Integer.parseInt(pegaCod));
    
    %>
    

	<div class="container mt-5">           
        <div class="row ">
   			<div class="col-8">
   			
   			</div>
   			<div class="col-lg-4 col-sm-12">
   				<div class="card c">
   					<div class="card-header">
   						<h5>Editar produto</h1>
   					</div>
   					<div class="card-body">
   						<form method="get" action="Processa">
   						
   							<input type="hidden" name="codEditCapturado" value="<%=p.getCodigo()%>">
   							
   							<div class="form-group">
   								<label>Nome</label>
   								<input type="text" name="nomeEdit" class="form-control" value="<%=p.getNome()%>">
   							</div>
   							<div class="form-group">
   								<label>Descri��o</label>
   								<input type="text" name="descricaoEdit" class="form-control" value="<%=p.getDescricao()%>">
   							</div>
   					
   							<div class="form-group">
   								<label>Pre�o</label>
   								<input type="text" name="precoEdit" class="form-control" value="<%=p.getPreco()%>">
   							</div>
   							<input type="hidden" name="acao" value="editarProduto">
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