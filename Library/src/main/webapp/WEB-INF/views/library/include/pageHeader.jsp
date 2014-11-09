<!-- Page Header -->
<header class="search-header"
	style="background-image: url('<c:url value="/resources/img/lib-bg-sm.jpg" />')">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<br>
				<form class="form-horizontal" action="./search" method="get">
					<div class="site-heading">
<!-- Start Basic Search -->
						<div class="form-group">
							<div class="input-group input-group-lg">
								<div class="input-group-btn">
	<!-- Terms Input -->
									<button type="button" class="btn btn-default" disabled style="opacity:1">
										<b>Search</b></button>
									<button type="button" class="btn btn-default"
										data-toggle="collapse" data-target="#advancedSearch">
										<span class="glyphicon glyphicon-list"></span>
									</button>
								</div>
								<!--  placeholder="&quot;So many books, so little time.&quot; - Frank Zappa" -->
								<input type="search" name="query"  class="form-control"> <span
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
										<h2 class="col-sm-5">Book Information</h2>
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
											<select class="selectpicker" data-width="span5" data-live-search="true" title="" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Language Input -->
										<label for="language" class="col-sm-1 control-label">Language:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5" data-live-search="true" title="" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Publisher Input -->
										<label for="publisher" class="col-sm-1 control-label">Publisher:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5" data-live-search="true" title="" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Awards Input -->
										<label for="awards" class="col-sm-1 control-label">Awards:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5" data-live-search="true" title="" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Added Input -->
										<label for="added" class="col-sm-1 control-label">Added:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Format Input -->
										<label for="format" class="col-sm-1 control-label">Format:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5" data-live-search="true" title="" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Availability Input -->			
										<label for="subject" class="col-sm-2 control-label">Available
											Only: </label>
										<div class="col-sm-1">
											<input type="checkbox" class="form-control" id="availability">
										</div>
									</div>
	<!-- Reading Level Inputs -->
									<div class="form-group">
										<h2 class="col-sm-5">Reading Levels</h2>
									</div>
									<div class="form-group">
		<!-- Interest Input -->
										<label for="title" class="col-sm-1 control-label">Interest Level:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-sm-1">
										<label for="title" class="col-sm-1 control-label"> to 
										</label>
										</div>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
									<div class="form-group">
		<!-- ATOS Input -->
										<label for="title" class="col-sm-1 control-label">ATOS Level:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-sm-1">
										<label for="title" class="col-sm-1 control-label"> to 
										</label>
										</div>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
									<div class="form-group">
		<!-- Reading Input -->
										<label for="title" class="col-sm-1 control-label">Reading Level:
										</label>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-sm-1">
										<label for="title" class="col-sm-1 control-label"> to 
										</label>
										</div>
										<div class="col-sm-5">
											<select class="selectpicker" data-width="span5">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
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