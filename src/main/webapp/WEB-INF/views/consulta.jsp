<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						  <h2><span class="glyphicon glyphicon-earphone"></span> Agenda de telefones</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<form  class="form-horizontal" action="${baseURL}/contato/consulta" method="post">
  							<div class="input-group">
  								<input type="search" class="form-control" name="palavra" placeholder="Encontre seus contatos">
  								<span class="input-group-btn">
  									<button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></button>
  								</span>
  							</div>
  							
  						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="bs-example" data-example-id="hoverable-table">
							<table class="tabela table table-hover table-bordered">
								<thead>
									<tr>
										<th>Id</th>
										<th>Nome</th>
										<th>Telefone</th>
										<th>Alterar</th>
										<th>Deletar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="contato" items="${requestScope.contatos}">
										<tr>
											<td>${contato.id}</td>
											<td>${contato.nome}</td>
											<td>${contato.telefone}</td>
											<td><a href="${baseURL}/contato/alteracao/${contato.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
											<td><a href="${baseURL}/contato/deletar/${contato.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
								
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9">
					</div>
					<div class="col-md-3">
						<a class="btn btn-primary btn-block" href="cadastro" role="button"><span class="glyphicon glyphicon-plus"></span> NOVO</a>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>