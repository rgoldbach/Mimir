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

	<!-- Search js --> 
	<script src="<c:url value="/resources/custom/library/js/search.js" />"></script>

</body>

</html>