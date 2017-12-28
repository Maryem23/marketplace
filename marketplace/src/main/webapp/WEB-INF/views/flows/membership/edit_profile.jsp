<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MarketPlace-WIM - ${title}</title>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 0Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	window.menu = '${title}';
	
	window.contextRoot = '${contextRoot}'
	
</script>
</head>

<body>
<div class="se-pre-con"></div>
	<div class="wrapper">

	    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <a class="navbar-brand" href="${flowExecutionUrl}&_eventId=home">MarketPlace-WIM</a>
	            </div>
			</div>
		</nav>
<div>

			<div  class="container">


				<div class="row">

					<div class="col-md-6 col-md-offset-3">

						<div class="panel panel-primary">

							<div class="panel-heading">
								<h4>${title}</h4>
							</div>

							<div class="panel-body">

							

						<form action="${contextRoot}/modif">
									<div class="form-group">
										<label class="control-label col-md-4">Nom</label>
										<div class="col-md-8">
											<input name="nom"  value="${nom}" type="text" class="form-control" placeholder="Nom" />
										</div>
									</div>
		                            <div class="form-group">
										<label class="control-label col-md-4">Prénom</label>
										<div class="col-md-8">
											<input id="prenom" name="prenom" value="${prenom}" type="text" class="form-control" placeholder="Prénom" />
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-4">Adresse mail</label>
										<div class="col-md-8">
											<input name="mail" type="text"  value="${mail}" class="form-control" placeholder="Adresse mail" />
										</div>
									</div>
		                            <div class="form-group">
										<label class="control-label col-md-4">Contact</label>
										<div class="col-md-8">
											<input name="contact" value="${contact}" type="text" class="form-control" placeholder="Contact" />
										</div>
									</div>
									
									<div class="form-group">
										<label class="control-label col-md-4">Mot de passe</label>
										<div class="col-md-8">
											<input name="pass"  value="${pass}"type="password" class="form-control" placeholder="Mot de passe" />
										</div>
									</div>
		                          

									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
											<Button type="submit"
												class="btn btn-primary">
											        Modifier <span
													class="glyphicon glyphicon-chevron-right"></span>
											</Button>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
											<a href="home"
												class="btn btn-primary">
											        Accueil <span
													class="glyphicon glyphicon-chevron-right"></span>
											</a>
										</div>
									</div>
								</form>


					


							</div>


						</div>


					</div>


				</div>
</div>

			</div>

	<%@include file="../flows-shared/footer.jsp" %>			
	<script src="${js}/jquery.js"></script>

		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>
		
		<!-- Self coded javascript -->
		<script src="${js}/myapp.js"></script>
		<script type="text/javascript">
        function test(){
        	
      
        	alert("teestt"+document.getElementById("nom").value)
        }
        </script>
		</div>

</body>

</html>

