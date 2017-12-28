<!-- DataTable Bootstrap Script -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="js" value="/resources/js" />

<script src="${js}/angular.js"></script>

<!-- DataTable Bootstrap Script -->
<script src="${js}/productsController.js"></script>
<div class="container"  data-ng-app="Marketplace"  data-ng-controller="ProductController as pCtrl" >

	<div class="row" data-ng-init="pCtrl.fetchProducts()">

		
		<div class="col-md-12">

			<div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							<li data-target="#carousel-example-generic" data-slide-to="3"></li>
							<li data-target="#carousel-example-generic" data-slide-to="4"></li>
							<li data-target="#carousel-example-generic" data-slide-to="5"></li>
							<li data-target="#carousel-example-generic" data-slide-to="6"></li>
						</ol>
						<div class="carousel-inner">
							
							<div class="item active">
								<img class="slide-image" src="${images}/1.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/2.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/3.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/4.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/5.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/6.png"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/7.png"
									alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>
		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>
		
		<div class="col-md-9">
				<div class="row">
                	<div class="col-xs-12">
                		<h3>Nos produits les plus en vue !</h3>
                		<hr/>
                	</div>
                </div>

                <div class="row is-table-row">
                	
                    <div style='width:40%;height:20%' class="col-sm-4" data-ng-repeat="product in pCtrl.mvProducts">                    	
                        <div class="thumbnail">
                            <img style='width:50%;height:50%' data-ng-src="${images}/{{product.code}}.jpg" alt="{{product.name}}" class="landingImg">
                            <h5>{{product.name}}</h5>
                            <hr/>
                            <div class="caption" style='height:50%'>
                                <h4 class="pull-right">DT {{product.unitPrice}}</h4>
                                <p>{{product.description}}</p>
                               
                                <a data-ng-href="${contextRoot}/show/{{product.id}}/product" class="btn btn-primary pull-right">Voir</a>
                                &nbsp; &nbsp; &nbsp; 
                                <a class="btn btn-success pull-right" data-toggle="modal" data-target="#myCategoryModal">Evaluer</a>
                            </div>
                        </div>
                        
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <h4>Voir plus de produits !</h4>
                        <hr/>
                        <a class="btn btn-primary" href="${contextRoot}/show/all/products">Plus de produits</a>
                    </div>

                </div>
				
				<div class="row">
                	<div class="col-xs-12">
                		<h3>Nos produits les plus vendus !</h3>
                		<hr/>
                	</div>
                </div>
               <div class="row is-table-row">
                	
                    <div class="col-sm-4" data-ng-repeat="product in pCtrl.mpProducts">                    	
                        <div class="thumbnail">
                            <img data-ng-src="${images}/{{product.code}}.jpg" alt="{{product.name}}" class="landingImg">
                            <h5>{{product.name}}</h5>
                            <hr/>
                            <div class="caption">
                                <h4 class="pull-right"> {{product.unitPrice}} DT</h4>
                                <p>{{product.description}}</p>
                                <a data-ng-href="${contextRoot}/show/{{product.id}}/product" class="btn btn-primary pull-right">Voir</a>
                          <p>{{product.Commentaire}}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <h4>Voir plus de produits !</h4>
                        <hr/>
                        <a class="btn btn-primary" href="${contextRoot}/show/all/products">Plus de produits</a>
                    </div>

                </div>
</div>
		</div>

	</div>

</div>
<!-- /.container -->
<div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3>Evaluer le produit </h3>
	      </div>
	      <div class="modal-body">
	      <div class="tab-content">
				
				<div class="panel panel-success">

				<div class="panel-body">
					<form action="${contextRoot}/login" method="POST"
						class="form-horizontal" id="loginForm">
						<div class="form-group">
							<label for="username" class="col-md-4 control-label">Votre commentaire :
							</label>
							<div class="col-md-8">
								<textarea  name="username" id="username"
									class="form-control" ></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Sauvegarder"
									class="btn btn-success" />
							</div>
						</div>
					</form>

				</div>

			</div>

		</div>
	      </div>
	    </div>
	  </div>
	</div>
