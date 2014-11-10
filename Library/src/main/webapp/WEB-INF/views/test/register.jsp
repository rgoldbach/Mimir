<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap Core -->
<link href="<c:url value="/resources/bootstrap/css/bootstrap.css" />"
	rel="stylesheet">
<!-- BootstrapValidator -->
<link
	href="<c:url value="/resources/bootstrapValidator/css/bootstrapValidator.css" />"
	rel="stylesheet">

</head>
<body>
	<div>
		<h1>
			<img height="100"
				src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif" />
			Register <img height="100"
				src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif" />
		</h1>
	</div>
	<div>
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#registerModal">Register</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="registerModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="registerForm" method="post" class="form-horizontal"
					data-bv-message="This value is not valid"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Register</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Full name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="firstName"
									placeholder="First name" data-bv-notempty="true"
									data-bv-notempty-message="The first name is required and cannot be empty" />
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="lastName"
									placeholder="Last name" data-bv-notempty="true"
									data-bv-notempty-message="The last name is required and cannot be empty" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Username</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="username"
									data-bv-message="The username is not valid"
									data-bv-notempty="true"
									data-bv-notempty-message="The username is required and cannot be empty"
									data-bv-regexp="true" data-bv-regexp-regexp="^[a-zA-Z0-9_\.]+$"
									data-bv-regexp-message="The username can only consist of alphabetical, number, dot and underscore"
									data-bv-stringlength="true" data-bv-stringlength-min="6"
									data-bv-stringlength-max="30"
									data-bv-stringlength-message="The username must be more than 6 and less than 30 characters long"
									data-bv-different="true" data-bv-different-field="password"
									data-bv-different-message="The username and password cannot be the same as each other" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Email address</label>
							<div class="col-sm-5">
								<input class="form-control" name="email" type="email"
									data-bv-notempty="true"
									data-bv-emailaddress="true"
									data-bv-emailaddress-message="The input is not a valid email address" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password"
									data-bv-notempty="true"
									data-bv-notempty-message="The password is required and cannot be empty"
									data-bv-identical="true"
									data-bv-identical-field="confirmPassword"
									data-bv-identical-message="The password and its confirm are not the same"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Retype password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control"
									name="confirmPassword" data-bv-notempty="true"
									data-bv-notempty-message="The confirm password is required and cannot be empty"
									data-bv-identical="true" data-bv-identical-field="password"
									data-bv-identical-message="The password and its confirm are not the same"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- JS -->
	<!-- jQuery -->
	<script src="<c:url value="/resources/jquery/js/jquery-2.1.1.js" />"></script>

	<!-- Bootstrap -->
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>

	<!-- bootstrapValidator -->
	<script src="<c:url value="/resources/bootstrapValidator/js/bootstrapValidator.js" />"></script>

	<script>
	$(document).ready(function() {
    $('#registerForm').bootstrapValidator();});
	</script>
</body>
</html>