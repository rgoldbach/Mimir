<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<!-- Head -->
<%@ include file="/WEB-INF/views/admin/include/head.jsp"%>
<%@ include file="/WEB-INF/views/admin/include/jsSources.jsp"%>

<body>
	<script>
		
	</script>
	<!-- Navigation Bar -->
	<%@ include file="/WEB-INF/views/admin/include/navbar.jsp"%>

	<div id="wrapper">

		<!-- Navigation -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<br>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">View User</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- THIS ISN'T ACTUALLY A FORM -->

							<!-- Text input-->

							<div class="col-md-3">
								<input id="adminLibraryCard" name="" type="text"
									placeholder="Enter The Users Library Card Number"
									class="form-control input-md">
							</div>

							<!-- Button trigger modal -->
							<button onclick="getUser()" class="btn btn-info">View</button>
							<span id="userlookuperror" class="formerror"></span>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title" id="myModalLabel">View
												Username's Account</h4>
										</div>
										<div class="modal-body">
											<!-- Start Modal -->
											<div class="row">
												<div class="col-lg-6">
													<form>
														<input id="oldemail" type = "hidden">
														<span id="userChangeError" class="formerror"></span>
														<div class="form-group">
															<label>Library Card Number:</label> <input disabled
																id="userLibraryCard" class="form-control">
														</div>
														<div class="form-group">
															<label>Email:</label> <input id="userEmail"
																class="form-control">
														</div>
														<div class="form-group">
															<label>First Name:</label> <input id="userFirstName"
																class="form-control">
														</div>
														<div class="form-group">
															<label>Last Name:</label> <input id="userLastName"
																class="form-control">
														</div>
														<div class="form-group">
															<label>Password:</label> <input id="userPassword"
																type="password" class="form-control">
														</div>
													</form>
												</div>
												<!-- /.col-lg-6 (nested) -->
											</div>
											<!-- /.row (nested) -->

											<!-- End Modal -->
										</div>
										<div class="modal-footer">
											<button onclick="saveUserChanges()" type="button"
												class="btn btn-success">Save Changes</button>
											<button onclick="banUser()" type="button"
												class="btn btn-danger">Remove User Account</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">Register Admin</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form id="registerForm" class="form-horizontal"
								data-bv-message="This value is not valid"
								data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
								data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
								data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
								<div class="modal-body">
									<span id="adminregerror" class = "formerror"></span>
									<div class="form-group">
										<label class="col-sm-3 control-label">First Name</label>
										<div class="col-sm-4">
											<input id="firstNameReg" type="text" class="form-control"
												name="firstName" placeholder="William"
												data-bv-notempty="true"
												data-bv-notempty-message="The first name is required and cannot be empty" />
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">Last Name</label>
										<div class="col-sm-4">
											<input id="lastNameReg" type="text" class="form-control"
												name="lastName" placeholder="Shakespeare"
												data-bv-notempty="true"
												data-bv-notempty-message="The last name is required and cannot be empty" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">Email address</label>
										<div class="col-sm-5">
											<input id="emailReg" class="form-control" name="email"
												type="text" placeholder="will@shakespeare.com"
												data-bv-notempty="true" data-bv-regexp="true"
												data-bv-regexp-regexp="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"
												data-bv-regexp-message="The input is not a valid email address" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">Password</label>
										<div class="col-sm-5">
											<input id="passwordReg" type="password" class="form-control"
												name="password" data-bv-notempty="true"
												data-bv-notempty-message="The password is required and cannot be empty"
												data-bv-different="true" data-bv-different-field="username"
												data-bv-different-message="The password cannot be the same as username" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">Retype password</label>
										<div class="col-sm-5">
											<input type="password" class="form-control"
												id="passwordConfirmReg" name="confirmPassword"
												data-bv-notempty="true"
												data-bv-notempty-message="The confirm password is required and cannot be empty"
												data-bv-identical="true" data-bv-identical-field="password"
												data-bv-identical-message="The password and its confirm are not the same"
												data-bv-different="true" data-bv-different-field="username"
												data-bv-different-message="The password cannot be the same as username" />
										</div>
									</div>

								</div>
								
							</form>
							<div class="modal-footer">
									<button id="register" onclick="registerAdmin()" name="register"
										class="btn btn-primary">Register</button>

							</div>


						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>

		</div>

		<!-- JS -->
		<%@ include file="/WEB-INF/views/admin/include/jsSources.jsp"%>
</body>
</html>