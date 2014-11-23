<!-- Page Header -->
<header class="search-header"
	style="background-image: url('<c:url value="/resources/img/lib-bg-sm.jpg" />')">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<br>
				<form id="searchForm" class="form-horizontal" action="quickSearch" method="GET">
					<div class="site-heading">
<!-- Start Basic Search -->
						<div class="form-group">
							<div class="input-group input-group-lg">
								<div class="input-group-btn">
	<!-- Search Label -->
									<button type="button" class="btn btn-default" disabled style="opacity:1">
										<b>Search</b>
									</button>
	<!-- Switch between Quick/Advanced Search -->
									<button type="button" class="btn btn-default" id="toggleSearch" data-toggle="collapse" data-target="#advancedSearch">
										<span class="glyphicon glyphicon-list"></span>
									</button>
								</div>
	<!-- Quick Search -->
								
								<input id="quickSearch" type="search" name="query" class="form-control">
	<!-- Quick/Advanced Search Submit -->
								<span class="input-group-btn">
									<button type="submit" class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
<!-- Start Advanced Search -->
						<div id="advancedSearch" class="collapse">
							<div class="panel panel-default">
								<div class="panel-body">
	<!-- Book Information Inputs -->
									<div class="form-group">
										<div class="col-md-7">
											<label style="font-size:25px;" class="control-label">Book Information</label>
											<label style="font-size:15px;" for="availability" class="control-label">(Available Only <input type="checkbox" id="availability">)</label>
										</div>
									</div>
									<div class="form-group">
		<!-- Title Input -->
										<div class="col-md-2">
											<label for="title" class="control-label">Title
											</label>
										</div>
										<div class="col-md-10">
											<input id="title" type="search" class="form-control">
										</div>
									</div>
									<div class="form-group">
		<!-- Author Input -->
										<div class="col-md-2">
											<label for="author" class="control-label">Author
											</label>
										</div>
										<div class="col-md-10">
											<input id="author" type="search" class="form-control">
										</div>
									</div>
									<div class="form-group">
		<!-- Genre Input -->
										<div class="col-md-2">
											<label for="genre" class="control-label">Genre
										</label>
										</div>
										<div class="col-md-4">
											<select id="genre" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Language Input -->
										<div class="col-md-2">
											<label for="language" class="control-label">Language
										</label>
										</div>
										<div class="col-md-4">
											<select id="language" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
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
										<div class="col-md-2">
											<label for="publisher" class="control-label">Publisher
										</label>
										</div>
										<div class="col-md-4">
											<select id="publisher" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Awards Input -->
										<div class="col-md-2">
											<label for="awards" class="control-label">Awards
										</label>
										</div>
										<div class="col-md-4">
											<select id="awards" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
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
										<div class="col-md-2">
											<label for="added" class="control-label">Added
										</label>
										</div>
										<div class="col-md-4">
											<select id="added" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
		<!-- Format Input -->
										<div class="col-md-2">
											<label for="format" class="control-label">Format
										</label>
										</div>
										<div class="col-md-4">
											<select id="format" class="selectpicker" data-live-search="true" title="" data-width="100%" multiple>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
									</div>
	<!-- Reading Level Inputs -->
									<div class="form-group">
										<br>
									</div>
									<div class="form-group">
		<!-- Interest -->			
										<div class="col-md-3 col-md-offset-2">
											<label class="control-label">Interest Level</label>
										</div>
										<div class="col-md-2">
											<select id="interestLevelStart" class="selectpicker" data-width="100%">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-md-1">
											<label class="control-label"> to </label>
										</div>
										<div class="col-md-2">
											<select id="interestLevelEnd" class="selectpicker" data-width="100%">
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
		<!-- ATOS -->			
										<div class="col-md-3 col-md-offset-2">
											<label class="control-label">ATOS Level</label>
										</div>
										<div class="col-md-2">
											<select id="atosLevelStart" class="selectpicker" data-width="100%">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-md-1">
											<label class="control-label"> to </label>
										</div>
										<div class="col-md-2">
											<select id="atosLevelEnd" class="selectpicker" data-width="100%">
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
		<!-- Reading -->			
										<div class="col-md-3 col-md-offset-2">
											<label class="control-label">Reading Level</label>
										</div>
										<div class="col-md-2">
											<select id="readingLevelStart" class="selectpicker" data-width="100%">
												<option> </option>
      											<option>1</option>
      											<option>2</option>
      											<option>3</option>
      											<option>4</option>
      											<option>5</option>
      										</select>
										</div>
										<div class="col-md-1">
											<label class="control-label"> to </label>
										</div>
										<div class="col-md-2">
											<select id="readingLevelEnd" class="selectpicker" data-width="100%">
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