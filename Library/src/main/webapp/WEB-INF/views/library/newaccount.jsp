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
							<c:if test="${(empty currentUser.borrowedEBooks) and (empty currentUser.borrowedAudioBooks)}">
								<i>Your bookshelf is empty!</i>
							</c:if>
							<c:forEach items="${currentUser.getBorrowedEBooks()}" var="element">
								<div id = "bookshelfEBook${element.getEBook().getEBookId()}" class="col-md-4" style="margin-bottom: 1cm;">
										<div>
											<h3>eBook</h3>
											<a data-toggle="modal"  onclick = "bookModal('${element.getEBook().getEBookId()}', 'EBook')" class="thumbnail"> <img width="175px" src="<c:out value="${element.getEBook().getBook().getBookDisplay().getImageFilePath()}"/>"> </a>
											<h4>
												<a href="#"><c:out value="${element.getEBook().getBook().getBookDisplay().getTitle()}" /></a>
											</h4>
											<h5>
											<a href="#"><c:out value="${element.getEBook().getBook().getAuthors()[0].getName()}" /></a>
											</h5>
										
											<!-- Rating -->
											<button onclick = "downloadBook(${element.getEBook().getEBookId()}, 'EBook')"class="btn btn-primary">Download</button>
											<button onclick = "returnBook(${element.getEBook().getEBookId()}, 'EBook')"class="btn btn-danger">Return</button>
											<input id='input-21b' value='${element.bookRating}' type='number' class='rating ebook' min=0 max=5 step=0.5 data-symbol='&#xF379' formattype = 'EBook' bookid =${element.getEBook().getEBookId()} data-size='xs'>											
											<br>
										</div>
								</div>
							</c:forEach>
							<c:forEach items="${currentUser.getBorrowedAudioBooks()}" var="element">
								<div id = "bookshelfAudioBook${element.getAudioBook().getAudioBookId()}" class="col-md-4" style="margin-bottom: 1cm;">
										<div>
											<h3>AudioBook</h3>
											<a data-toggle="modal"  onclick = "bookModal('${element.getAudioBook().getAudioBookId()}', 'AudioBook')" class="thumbnail"> <img width="175px" src="<c:out value="${element.getAudioBook().getBook().getBookDisplay().getImageFilePath()}"/>"></a>
											<h4>
												<a href="#"><c:out value="${element.getAudioBook().getBook().getBookDisplay().getTitle()}" /></a>
											</h4>
											<h5>
											<a href="#"><c:out value="${element.getAudioBook().getBook().getAuthors()[0].getName()}" /></a>
											</h5>
										
											<!-- Rating -->
											<button onclick = "downloadBook(${element.getAudioBook().getAudioBookId()}, 'AudioBook')"class="btn btn-primary">Download</button>
											<button onclick = "returnBook(${element.getAudioBook().getAudioBookId()}, 'AudioBook')"class="btn btn-danger">Return</button>
											<input id='input-21c' value='${element.bookRating}' formattype = 'AudioBook' bookid =${element.getAudioBook().getAudioBookId()} type='number' class='rating audio' min=0 max=5 step=0.5 data-symbol='&#xF379' data-default-caption='{rating} helmets' data-star-captions='{}' data-size='xs'>
											<br>
										</div>
								</div>
							</c:forEach>		
						</div>
					</div>
					<!-- Holds -->
					<div class="tab-pane col-md-11" id="tab_bookHolds">
						<h1>Book Holds</h1>
						<hr>
						<div class="panel-group" id="holds">
							<div class="panel panel-default">
								<div class="panel-heading" id="available">
									<h4 class="panel-title">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#holds" href="#collapseAvailable"> Recently Added
											<span id="recentlyAddedSize" class="label label-success">${recentlyAddedSize}</span>
										</a>
									</h4>
								</div>
								<div id="collapseAvailable" class="panel-collapse collapse">
									<div class="panel-body">
										<c:if test="${empty recentlyAdded}">
											<i>You have no recently added books!</i>
										</c:if>
										<c:forEach items="${recentlyAdded}" var="recentlyAdded">
											<div id="recentlyAdded${recentlyAdded.format}${recentlyAdded.bookFormatId}" class="col-md-3" style="margin-bottom: 1cm;">
												<h4 id="recentlyAddedFormat${recentlyAdded.format}${recentlyAdded.bookFormatId}">${recentlyAdded.format}</h4>
												<a href="#"> 
													<img width="100px"src="<c:url value="${recentlyAdded.imageFilePath}" />">
												</a>
												<h4>
													<a href="#">${recentlyAdded.bookTitle}</a>
												</h4>
												<h5>
													<a href="#">${recentlyAdded.author}</a>
												</h5>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" id="pending">
									<h4 class="panel-title">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#holds" href="#collapsePending"> Pending </a>
									</h4>
								</div>
								<div id="collapsePending" class="panel-collapse collapse">
									<div class="panel-body">
										<c:if test="${empty pending}">
											<i>You have no books on hold!</i>
										</c:if>
										<c:forEach items="${pending}" var="pending">
											<div id="pending${pending.format}${pending.bookFormatId}" class="col-md-3" style="margin-bottom: 1cm;">
												<h4 id="pendingFormat${pending.format}${pending.bookFormatId}">${pending.format}</h4>
												<a href="#"> 
													<img width="100px"src="<c:url value="${pending.imageFilePath}" />">
												</a>
												<h4>
													<a href="#">${pending.bookTitle}</a>
												</h4>
												<h5>
													<a href="#">${pending.author}</a>
												</h5>
												<h5>
													<span>Queue Position: ${pending.positionInQueue}</span>
												</h5>
												<button class="btn btn-danger" onclick="removeHold(${pending.bookFormatId}, '${pending.format}')">Remove</button>
											</div>
										</c:forEach>
									</div>
								</div>
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
											<c:if test="${empty wishlist}">
												<i>You have no books on hold!</i>
											</c:if>
											<c:forEach items="${wishlist}" var="element">
												<div id="wishlist${element.format}${element.bookFormatId}" class="col-md-3" style="margin-bottom: 1cm;">
													<h4 id="wishlistFormat${element.format}${element.bookFormatId}">${element.format}</h4>
													<a data-toggle="modal"  onclick = "bookModal('${element.bookFormatId}', '${element.format}')"> 
														<img width="100px"src="<c:url value="${element.imageFilePath}" />">
													</a>
													<h4>
														<a href="#">${element.bookTitle}</a>
													</h4>
													<h5>
														<a href="#">${element.author}</a>
													</h5>

													<button class="btn btn-danger" onclick="removeFromWishlist(${element.bookFormatId}, '${element.format}')">Remove</button>
												</div>
											</c:forEach>
											<!--<c:if test="${empty wishlistBooks}">
												<i>You have no books on hold!</i>
											</c:if>
											<c:forEach items="${wishlistBooks}" var="element">
												<div id = "wishlistBook${element.bookDisplayId}" class="col-md-4">
													<div>
														<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${element.bookDisplayId}"> 
															<img width="175px" src="<c:out value="${element.getImageFilePath()}"/>"> 
														</a>
														<h3>
															<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${element.bookDisplayId}">
																<c:out value="${element.getTitle()}" />
															</a>
														</h3>
														<button onclick="removeFromWishlist(${element.bookDisplayId})" btn btn-danger">Remove</button>
														<br>
													</div>
												</div>
											</c:forEach>-->
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
											<c:if test="${empty recommended}">
												<i>No recommended books!</i>
											</c:if>
											<c:forEach items="${recommended}" var="recommended">
												<div id="recommended${recommended.format}${recommended.bookFormatId}" class="col-md-3" style="margin-bottom: 1cm;">
													<h4 id="recommendedFormat${recommended.format}${recommended.bookFormatId}">${recommended.format}</h4>
													<a data-toggle="modal"  onclick = "bookModal('${recommended.bookFormatId}', '${recommended.format}')"> 
														<img width="100px"src="<c:url value="${recommended.imageFilePath}" />">
													</a>
													<h4>
														<a href="#">${recommended.bookTitle}</a>
													</h4>
													<h5>
														<a href="#">${recommended.author}</a>
													</h5>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" id="history">
										<h4 class="panel-title">
											<a class="collapsed" data-toggle="collapse" data-parent="#lists" href="#collapseHistory">
												History
											</a>
										</h4>
									</div>
									<div id="collapseHistory" class="panel-collapse collapse">
										<div class="panel-body">
											<c:if test="${empty pastBorrowed}">
												<i>History is empty!</i>
											</c:if>
											<c:forEach items="${pastBorrowed}" var="pastBorrowed">
												<div id="pastBorrowed${pastBorrowed.format}${pastBorrowed.bookFormatId}" class="col-md-3" style="margin-bottom: 1cm;">
													<h4 id="pastBorrowedFormat${pastBorrowed.format}${pastBorrowed.bookFormatId}">${pastBorrowed.format}</h4>
													<a data-toggle="modal"  onclick = "bookModal('${pastBorrowed.bookFormatId}', '${pastBorrowed.format}')"> 
														<img width="100px"src="<c:url value="${pastBorrowed.imageFilePath}" />">
													</a>
													<h4>
														<a href="#">${pastBorrowed.bookTitle}</a>
													</h4>
													<h5>
														<a href="#">${pastBorrowed.author}</a>
													</h5>
												</div>
											</c:forEach>
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

				<form id="changeUserForm" class="form-horizontal"
					data-bv-message="This value is not valid"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
						<div class="form-group">
								<span id="changeInfoError" class="formerror"></span>
							</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Library Card Number</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="libraryCardNumber" id = "changeLibraryCardNumber"
									value="<c:out value="${currentUser.libraryCardNumber}" />"
									disabled  />
							</div>
						</div>
						<input id="oldemail" type ="hidden" value = <c:out value="${currentUser.accountInfo.loginCredentials.email}"/>  >
						<div class="form-group">
							<label class="col-sm-3 control-label">First Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="firstName" id = "changeFirstName"
								data-bv-notempty="true"
								data-bv-notempty-message="The first name is required and cannot be empty"
									value=<c:out value="${currentUser.accountInfo.firstName}"/> />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">Last Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="lastName" id = "changeLastName"
								data-bv-notempty="true"
								data-bv-notempty-message="The last name is required and cannot be empty"
									value=<c:out value="${currentUser.accountInfo.lastName}"/> />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Email address</label>
							<div class="col-sm-5">
								<input class="form-control" name="email" type="text" id = "changeEmail"
									value="<c:out value="${currentUser.accountInfo.loginCredentials.email}" />"
									data-bv-regexp="true" data-bv-regexp-regexp="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"
									data-bv-regexp-message="The input is not a valid email address" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">New Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password" id = "changePassword"
									value="<c:out value="${currentUser.accountInfo.loginCredentials.password}" />"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>
						
						<div class="form-group">
							
							<label class="col-sm-3 control-label">Confirm New Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control"
									name="confirmPassword" id = "changePasswordConfirm"
									value="<c:out value="${currentUser.accountInfo.loginCredentials.password}" />"
									data-bv-notempty="true"
								data-bv-notempty-message="The confirm password is required and cannot be empty"
								data-bv-identical="true" data-bv-identical-field="password"
								data-bv-identical-message="The password and its confirm are not the same"
								data-bv-different="true" data-bv-different-field="username"
								data-bv-different-message="The password cannot be the same as username"  />
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="col-sm-3 control-label">Current Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password" id = "changeCurrentPassword"
									value=""
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>
					</form>
							<div class="col-sm-offset-4 col-sm-3">
								<button onclick = "changeUserInfo()"  class="btn btn-primary">Save Changes</button>
							</div>
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/library/include/footer.jsp"%>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp"%>
		
	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp"%>
	
	<script>
	function changeRecentlyAddedSizeColor(){
		if(parseInt($('#recentlyAddedSize').text()) == 0){
			$('#recentlyAddedSize').removeClass('label-success').addClass('label-danger');
		}	
	}
	changeRecentlyAddedSizeColor();
	</script>

</body>

</html>