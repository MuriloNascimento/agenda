<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>${requestScope.pageName}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cerulean/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://localhost:8080/agenda/skin/css/estilo.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<section>
			<div class="container-fluid">
				<div class="row titulo">
					<div class="col-md-12">
						<div class="">
						  <h2><span class="glyphicon glyphicon-earphone"></span> ${requestScope.pageName}</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<form  class="form-horizontal" action="${baseURL}/contato/cadastrar" method="post">
							<input type="hidden" value="${requestScope.contato.id}" name="id">
  							<div class="form-group">
							    <label for="inputNome" class="col-sm-2 control-label">Nome</label>
							    <div class="col-sm-10">
							    	<input type="text" name="nome" class="form-control" id="inputNome" placeholder="Nome" value="${requestScope.contato.nome}">
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputTelefone" class="col-sm-2 control-label">Telefone</label>
							    <div class="col-sm-10">
							    	<input type="tel" name="telefone" class="form-control" id="inputTelefone" placeholder="00-000000000" value="${requestScope.contato.telefone}">
							    </div>
							</div>
  							<div class="form-group">
						      <div class="col-lg-10 col-lg-offset-2">
						      	<button type="submit" class="btn btn-primary">CADASTRAR</button>
						        <button type="reset" class="btn btn-default">APAGAR</button>
						        <a class="btn btn-info" href="${baseURL}/contato/consulta" role="button">VOLTAR</a>
						      </div>
						    </div>
						    <c:if test="${not empty msgm}">
							    <div class="form-group">
							      <div class="col-lg-10 col-lg-offset-2">
							      	    <div class="alert alert-warning" role="alert">
										  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
										  ${msgm}
										</div>
							      </div>
							    </div>
						    </c:if>
  						</form>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>