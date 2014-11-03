<!-- Page Header -->
<header class="search-header"
	style="background-image: url('<c:url value="/resources/img/lib-bg-sm.jpg" />')">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<br>
				<form class="form-horizontal">
					<div class="site-heading">
<!-- Start Basic Search -->
						<div class="form-group">
							<div class="input-group input-group-lg">
								<div class="input-group-btn">
	<!-- Terms Input -->
									<button type="button" class="btn btn-default" disabled>
										Search</button>
									<button type="button" class="btn btn-default"
										data-toggle="collapse" data-target="#advancedSearch">
										<span class="glyphicon glyphicon-list"></span>
									</button>
								</div>
								<!--  placeholder="&quot;So many books, so little time.&quot; - Frank Zappa" -->
								<input type="search" class="form-control"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
<!-- End Basic Search -->
<!-- Start Advanced Search -->
						<div id="advancedSearch" class="collapse">
							<div class="panel panel-default">
								<div class="panel-body">
	<!-- Book Information Inputs -->
									<div class="form-group">
										<fieldset>
											<legend class="col-sm-5">Book Information</legend>
										</fieldset>
									</div>
									<div class="form-group">
		<!-- Title Input -->
										<label for="title" class="col-sm-1 control-label">Title:
										</label>
										<div class="col-sm-11">
											<input type="search" class="form-control" id="title">
										</div>
									</div>
									<div class="form-group">
		<!-- Author Input -->
										<label for="author" class="col-sm-1 control-label">Author:
										</label>
										<div class="col-sm-11">
											<input type="search" class="form-control" id="author">
										</div>
									</div>
									<div class="form-group">
		<!-- Subject Input -->
										<label for="subject" class="col-sm-1 control-label">Subject:
										</label>
										<div class="col-sm-5">
											<select class="form-control" id="subject">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
		<!-- Language Input -->
										<label for="language" class="col-sm-1 control-label">Language:
										</label>
										<div class="col-sm-5">
											<select class="form-control" id="language">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Publisher Input -->
										<label for="publisher" class="col-sm-1 control-label">Publisher:
										</label>
										<div class="col-sm-5">
											<select class="form-control" id="publisher">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
		<!-- Awards Input -->
										<label for="awards" class="col-sm-1 control-label">Awards:
										</label>
										<div class="col-sm-5">
											<select class="form-control" id="awards">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Added Input -->
										<label for="added" class="col-sm-1 control-label">Added:
										</label>
										<div class="col-sm-4">
											<select class="form-control" id="added">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
		<!-- Format Input -->
										<label for="format" class="col-sm-1 control-label">Format:
										</label>
										<div class="col-sm-4">
											<select class="form-control" id="format">
												<option>Example 1</option>
												<option>Example 2</option>
												<option>Example 3</option>
												<option>Example 4</option>
												<option>Example 5</option>
											</select>
										</div>
		<!-- Availability Input -->
										<label for="subject" class="col-sm-1 control-label">Available
											Only: </label>
										<div class="col-sm-1">
											<input type="checkbox" class="form-control" id="availability">
										</div>
									</div>
	<!-- Reading Level Inputs -->
									<div class="form-group">
										<fieldset>
											<legend class="col-sm-5">Reading Levels</legend>
										</fieldset>
									</div>
									<div class="form-group">
		<!-- Interest Input -->
										<label for="title" class="col-sm-2 control-label">Interest Level:
										</label>
										<div class="col-sm-9">
											<input type="search" class="form-control" placeholder="SLIDER GOES HERE">
										</div>
									</div>
									<div class="form-group">
		<!-- ATOS Input -->
										<label for="title" class="col-sm-2 control-label">ATOS Level:
										</label>
										<div class="col-sm-9">
											<input type="search" class="form-control" placeholder="SLIDER GOES HERE">
										</div>
									</div>
									<div class="form-group">
		<!-- Reading Input -->
										<label for="title" class="col-sm-2 control-label">Reading Level:
										</label>
										<div class="col-sm-9">
											<input type="search" class="form-control" placeholder="SLIDER GOES HERE">
										</div>
									</div>
								</div>
							</div>
<!-- End Advanced Search -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>