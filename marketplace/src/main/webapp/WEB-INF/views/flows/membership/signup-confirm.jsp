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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
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
		
		
		<!-- Page Content -->


		<div class="content">

			<div class="container">


				<div class="row">
		<div class="col-sm-6">
	
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>D�tails personnels</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<h3>Nom : <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h3>
						<h4>Adresse mail : <strong>${registerModel.user.email}</strong></h4>
						<h4>Contact : <strong>${registerModel.user.contactNumber}</strong></h4>
						<h4>R�le : <strong>${registerModel.user.role}</strong></h4>
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Sauvegarder</a>
						</p>
					</div>
				</div>
			
			</div>
					
		
		</div>
		
		<div class="col-sm-6">
		
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Adresse exp�ditrice</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<p>${registerModel.billing.addressLineOne}, </p>
						<p>${registerModel.billing.addressLineTwo}, </p>
						<p>${registerModel.billing.city} -  ${registerModel.billing.postalCode}, </p>
						<p>${registerModel.billing.state}</p>
						<p>${registerModel.billing.country}</p>
						<p>
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Sauvegarder</a>
						</p>
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
	
	<div class="row">
		
		<div class="col-sm-4 col-sm-offset-4">
			
			<div class="text-center">
				
				<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-lg btn-primary">Confirmer</a>
				
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
		</div>

</body>

</html>