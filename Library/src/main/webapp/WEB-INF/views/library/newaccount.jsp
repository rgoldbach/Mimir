<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="/WEB-INF/views/library/include/head.jsp"%>

<body>

	<%@ include file="/WEB-INF/views/library/include/navbar.jsp"%>

	<%@ include file="/WEB-INF/views/library/include/pageHeader.jsp"%>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<h2>Dashboard</h2>
				<hr>
				<ul class="nav nav-pills nav-stacked">
  					<li class="active"><a href="#tab_bookshelf" class="btn btn-default btn-lg" data-toggle="tab"><span class="glyphicon glyphicon-book pull-left"></span> Bookshelf</a></li>
  					<li><a href="#tab_bookHolds" class="btn btn-default btn-lg" data-toggle="tab"><span class="glyphicon glyphicon-pause pull-left"></span> Book Holds</a></li>
  					<li><a href="#tab_bookLists" class="btn btn-default btn-lg" data-toggle="tab"><span class="glyphicon glyphicon-align-left pull-left"></span> Book Lists</a></li>
  					<li><a href="#tab_accountInfo" class="btn btn-default btn-lg" data-toggle="tab"><span class="glyphicon glyphicon-info-sign pull-left"></span> Account Info</a></li>
				</ul>
			</div>
			<div class="col-md-9 col-md-offset-1">
				<div class="tab-content">
	<!-- Bookshelf -->
					<div class="tab-pane col-md-11 active" id="tab_bookshelf">
						<h1>Bookshelf</h1>
						<hr>
						<div>
							<c:forEach items="${dummyBooks}" var="element">
								<div class="col-md-4">
										<div>
											<a href="#"> <img width="175px" src="<c:out value="${element.getImageFilePath()}"/>"> </a>
											<h3>
												<a href="#"><c:out value="${element.getTitle()}" /></a>
											</h3>
											<h4>
											<a href="#"><c:out value="${element.getBook().getAuthors()[0].getName()}" /></a>
											</h4>
										
											<!-- Rating -->
											<button class="btn btn-danger">Return</button>
											<br>
										</div>
								</div>
							</c:forEach>	
						</div>
					</div>
		<!-- Holds -->
					<div class="tab-pane col-md-11" id="tab_bookHolds">
						<div class="row">
						<div class="col-md-6">
						<h1>Book Holds</h1>
						<hr>
						</div>
						</div>
						<div class="row">
						<div class="col-md-12">
						<h2>Available</h2>
						<hr>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg3.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-success">Borrow</button>
							<br>
							<br>
						</div>
						</div>
						<div class="row">
						<div class="col-md-12">
						<h2>Pending</h2>
						<hr>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg6.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-danger">Remove</button>
							<br>
							<br>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg7.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-danger">Remove</button>
							<br>
							<br>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg4.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-danger">Remove</button>
							<br>
							<br>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg5.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-danger">Remove</button>
							<br>
							<br>
						</div>
						<div class="col-md-3">
							<a href="#"> <img width="100px"
								src="<c:url value="/resources/img/TestImg7.jpg" />">
							</a>
							<h4>
								<a href="#">Title</a>
							</h4>
							<h5>
								<a href="#">Author</a>
							</h5>
							<button class="btn btn-danger">Remove</button>
							<br>
							<br>
						</div>
						</div>
					</div>
	<!-- Lists -->
					<div class="tab-pane col-md-11" id="tab_bookLists">
						<h1>Book Lists</h1>
						<hr>
						<div>
							<div class="panel-group" id="lists">
								<div class="panel panel-default">
									<div class="panel-heading" id="wishlisted">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#lists" href="#collapseWishlisted">
												Wishlist
											</a>
										</h4>
									</div>
									<div id="collapseWishlisted" class="panel-collapse collapse">
										<div class="panel-body">
											<i>You have not wishlisted any books.</i>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="rated">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#lists" href="#collapseRated">
												Rated
											</a>
										</h4>
									</div>
									<div id="collapseRated" class="panel-collapse collapse">
										<div class="panel-body">
											<i>You have not rated any books.</i>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="recommended">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#lists" href="#collapseRecommended">
												Recommended For You
											</a>
										</h4>
									</div>
									<div id="collapseRecommended" class="panel-collapse collapse">
										<div class="panel-body">
											<i>There are no books recommended for you.</i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

	<!-- Info -->
					<div class="tab-pane col-md-11" id="tab_accountInfo">
						<h1>Account Info</h1>
						<hr>
						<div class="well">

				<form id="accountInfoForm" method="post" class="form-horizontal"
					data-bv-message="This value is not valid"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
					
						<div class="form-group">
							<label class="col-sm-3 control-label">Library Card Number</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="libraryCardNumber"
									placeholder="123456789"
									disabled />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">First Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="firstName"
									placeholder="William" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">Last Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="lastName"
									placeholder="Shakespeare" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Email address</label>
							<div class="col-sm-5">
								<input class="form-control" name="email" type="text"
									placeholder="will@shakespeare.com"
									data-bv-regexp="true" data-bv-regexp-regexp="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"
									data-bv-regexp-message="The input is not a valid email address" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>
						
						<div class="form-group">
							
							<label class="col-sm-3 control-label">Confirm password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control"
									name="confirmPassword" data-bv-notempty="true"
									data-bv-notempty-message="The confirm password is required and cannot be empty"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-3">
								<button type="submit" class="btn btn-primary">Save Changes</button>
							</div>
						</div>
					</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/library/include/footer.jsp"%>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp"%>
		
	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp"%>

</body>

</html>