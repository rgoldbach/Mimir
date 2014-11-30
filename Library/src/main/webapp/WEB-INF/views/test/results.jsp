<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp" %>

<!DOCTYPE html>
<html lang="en">

<%@ include file="/WEB-INF/views/library/include/head.jsp" %>

<body>

	<%@ include file="/WEB-INF/views/library/include/navbar.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/pageHeader.jsp" %>

	<!-- Main Content -->
	<div class="container">
<!-- Search Menu -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="row">
					<div class="col-lg-3">
						<!-- Switch between Cover and List display -->
						<div class="btn-group btn-group-lg">
  							<button id="coverDisplay" type="button" class="btn btn-default"><span class="glyphicon glyphicon-th"></span> Cover</button>
  							<button id="listDisplay" type="button" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span> List</button>
						</div>
						<br>
						<!-- Hey, this probably shouldn't be hard coded! -->
						<select id="sortBy" class="resultDisplay selectpicker" data-width="190px">
							<optgroup label="Sort By">
 								<option value="relevance">Relevance</option>
 								<option value="highestRated">Highest Rated</option>
 								<option value="titleAtoZ">Title A-Z</option>
								<option value="titleZtoA">Title Z-A</option>
								<option value="authorAtoZ">Author A-Z</option>
								<option value="authorZtoA">Author Z-A</option>
								<option value="releaseDate">Release Date</option>
								<option value="addedToSite">Added to Site</option>
								<option value="mostPopular">Most Popular</option>
							</optgroup>
						</select>
						<br>
						<select id="filterBy" class="resultDisplay selectpicker" data-width="190px">
							<optgroup label="Filter By">
								<option value="noFilter">No Filter</option>
 								<option value="eBookOnly" data-icon="glyphicon glyphicon-book" value="eBookOnly">eBook Only</option>
 								<option value="audioOnly" data-icon="glyphicon glyphicon-headphones" value="audioOnly">Audio Only</option>
 							</optgroup>
						</select>
					</div>
					<div class="col-lg-9">
						<p class="text-left">${message}</p>
						<hr>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		<!-- Display Results in 'Cover' View -->
			<div id="coverResultContainer" class="col-md-8 col-md-offset-2">
				<!-- Results appended -->
			</div>
		<!-- Display Results in 'List' View -->
			<div id="listResultContainer" class="col-md-8 col-md-offset-2" >
				<!-- Results appended -->
			</div>
		</div>
		
		<!-- Request more results. If no / no more results found, don't show this. -->
		<div class="row">
			<div class="col-md-2 col-md-offset-5">
				<button id="moreResults" type="button" class="btn btn-default btn-lg btn-block">More (#)</button>
			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>

	<script>
		$(document).ready(function() {
							// Get the first page of search results
							sortThenFilter();
							
							// Init result view
							$('#coverDisplay').addClass('active');
							$('#listResultContainer').hide();

							// Toggle between cover and list
							$('#coverDisplay, #listDisplay').click(function() {
								if ($(this).attr('id') == 'coverDisplay') {
									$(this).addClass('active');
									$('#listDisplay').removeClass('active');
									$('#listResultContainer').hide();
									$('#coverResultContainer').show();
								} else {
									$(this).addClass('active');
									$('#coverDisplay').removeClass('active');
									$('#coverResultContainer').hide();
									$('#listResultContainer').show();
								}
							});

							// Sort then Filter
							$('.resultDisplay').change(function() {
								// Empty the current results
								$('#coverResultContainer').empty();
								$('#listResultContainer').empty();
								sortThenFilter();
							});
							
							function sortThenFilter(){
								// Get the types
								var sortType = $('#sortBy').val();
								var filterType = $('#filterBy').val();
								sort(sortType, filterType);
							}

							// Sort search results
							function sort(sortType, filterType) {
								$.ajax({
									url : 'sortResults?sortType=' + sortType,
									type : 'GET',
									complete : function() {
										filter(filterType);
									}
								});
							}

							// Filter the results
							function filter(filterType) {
								$.ajax({
									url : 'filterResults?filterType=' + filterType,
									type : 'GET',
									complete : function() {
										moreResults();
									}
								});
							}

							// Load more results
							$('#moreResults').click(function() {
								moreResults();
							});

							// Load more results
							function moreResults() {
								$.ajax({
											url : 'loadResults',
											type : 'GET',
											success : function(jResultPage) {
												console.log(jResultPage);
												var coverResults = '';
												var listResults = '';
												// For each result...
												$(jResultPage.jResults)
														.each(
																function(index) {
																	// Generate the cover result html
																	coverResults += '<div class="col-md-3">';
																	coverResults += '<div class="thumbnail">';
																	coverResults += '<div class="ayyyLmao">';
																	coverResults += '<img class="img-responsive" src="' + this.imgPath + '" alt="...">';
																	if (this.format == 'AudioBook') {
																		coverResults += '<span class="ayyyLmaoContent"><span class="glyphicon glyphicon-headphones"></span></span>';
																	}
																	if (this.format == 'EBook') {
																		coverResults += '<span class="ayyyLmaoContent"><span class="glyphicon glyphicon-book"></span></span>';
																	}
																	coverResults += '</div>';
																	coverResults += '<div class="caption">';
																	coverResults += '<h6 class="resultInfo">'
																			+ this.title
																			+ '</h6>';
																	coverResults += '<h6 class="resultInfo">'
																			+ this.authors
																			+ '</h6>';
																	coverResults += '</div>';
																	coverResults += '</div>';
																	coverResults += '</div>';
																	// Generate the list result html
																	listResults += '<div class="col-md-12"><h3>'
																			+ this.title
																			+ ' by <a href="#">'
																			+ this.authors
																			+ '</a> ';
																	if (this.format == 'AudioBook') {
																		listResults += '<span class="label label-default"><span class="glyphicon glyphicon-headphones"></span></span>';
																	}
																	if (this.format == 'EBook') {
																		listResults += '<span class="label label-default"><span class="glyphicon glyphicon-book"></span></span>';
																	}
																	listResults += '</h3></div>';
																	listResults += '<div class="thumbnail col-md-2"><img class="img-responsive" src="' + this.imgPath + '" alt="..."></div>';
																	listResults += '<div class="col-md-2"><p style="font-size:15px;"><span class="glyphicon glyphicon-tags"></span>';
																	listResults += '<a href="#"> Tag</a>,';
																	listResults += '<br><a href="#">Tag</a>,';
																	listResults += '<br><a href="#">Tag</a>';
																	listResults += '</p></div>';
																	listResults += '<div class="col-md-8"><p  style="font-size:13px;">';
																	listResults += this.description;
																	listResults += '</p></div>';
																	listResults += '<div class="col-md-12"><hr></div>';
																});

												// Show results
												$(coverResults).hide().appendTo('#coverResultContainer').fadeIn(1000);
												$(listResults).hide().appendTo('#listResultContainer').fadeIn(1000);

												// If the more button's hidden (if the last search hid it)
												if ($('#moreResults').css('display') == 'none') {
													$('#moreResults').show();
												}
												// Hide the more button if there's no more results
												if (jResultPage.remainingResults == 0) {
													$('#moreResults').hide();
												} else {
													$('#moreResults')
															.html('More ('+ jResultPage.remainingResults + ')');
												}
											}
										});
							}
						});
	</script>

</body>

</html>