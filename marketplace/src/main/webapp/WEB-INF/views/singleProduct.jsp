<div class="container">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


	<!-- Breadcrumb -->
	<div class="row">

		<div class="col-xs-12">


			<ol class="breadcrumb">

				<li><a href="${contextRoot}/home">Accueil</a></li>
				<li><a href="${contextRoot}/show/all/products">Produits</a></li>
				<li class="active">${product.name}</li>

			</ol>


		</div>


	</div>


	<div class="row">

		<!-- Display the product image -->
		<div class="col-xs-12 col-sm-4">

			<div class="thumbnail">

				<img src="${images}/${product.code}.jpg" class="img img-responsive" />

			</div>

		</div>


		<!-- Display the product description -->
		<div class="col-xs-12 col-sm-8">

			<h3>${product.name}</h3>
			<hr />

			<p>${product.description}</p>
			<hr />

			<h4>
				Prix : <strong> ${product.unitPrice} DT/-</strong>
			</h4>
			<hr />



			<c:choose>

				<c:when test="${product.quantity < 1}">

					<h6>
						Qtt. disponible : <span style="color: red">Rupture de stock !</span>
					</h6>

				</c:when>
				<c:otherwise>

					<h6>Qtt. disponible : ${product.quantity}</h6>

				</c:otherwise>

			</c:choose>


			<security:authorize access="isAnonymous() or hasAuthority('BUYER')">

				<c:choose>

					<c:when test="${product.quantity < 1}">

						<a href="javascript:void(0)" class="btn btn-success disabled"><strike>
								<span class="glyphicon glyphicon-shopping-cart"></span> Ajouter au panier
						</strike></a>

					</c:when>
					<c:otherwise>

						<a href="${contextRoot}/cart/add/${product.id}/product"
							class="btn btn-success"> <span
							class="glyphicon glyphicon-shopping-cart"></span> Ajouter au panier
						</a>




					</c:otherwise>

				</c:choose>
			</security:authorize>


			<security:authorize access="hasAuthority('SELLER')">
				<a href="${contextRoot}/manage/${product.id}/product"
					class="btn btn-success"> <span
					class="glyphicon glyphicon-pencil"></span> Modifier
				</a>
			</security:authorize>



			<a href="${contextRoot}/show/all/products" class="btn btn-warning">
				Continuer le shopping</a>
				
				
		  <!-- --------------------- Stars------------------------- -->
				
			<hr />
			 <div class="btn-toolbar">
			  <div class="btn-group">
				<span class="btn"><i class="icon-envelope"></i></span>
				<span class="btn" ><i class="icon-print"></i></span>
				<span class="btn" ><i class="icon-zoom-in"></i></span>
				<span class="btn" ><i class="icon-star"></i></span>
				<span class="btn" ><i class=" icon-thumbs-up"></i></span>
				<span class="btn" ><i class="icon-thumbs-down"></i></span>
			  </div>
			</div>

			<!-- --------------------- COMMENTS------------------------- -->

			<hr />

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="home">
					<h2>Evaluation du produit </h2>
				</div>
				<div class="panel panel-success">

				<div class="panel-body">
					<form action="${contextRoot}/login" method="POST"
						class="form-horizontal" id="loginForm">
						<div class="form-group">
							<label for="username" class="col-md-4 control-label">
							
							</label>
							
						</div>
						
					</form>

				</div>

			</div>

		</div>


	</div>


</div>

</div>

