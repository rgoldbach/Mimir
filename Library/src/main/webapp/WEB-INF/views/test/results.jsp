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
  							<button id="coverDisplay" type="button" class="active btn btn-default"><span class="glyphicon glyphicon-th"></span> Cover</button>
  							<button id="listDisplay" type="button" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></span> List</button>
						</div>
						<br>
						<!-- Hey, this probably shouldn't be hard coded! -->
						<select class="selectpicker" data-width="190px">
							<optgroup label="Sort By">
 								<option value="relevancy">Relevance</option>
 								<option value="titleAz">Title A-Z</option>
								<option value="titleZa">Title Z-A</option>
								<option value="authorAz">Author A-Z</option>
								<option value="authorZa">Author Z-A</option>
								<option value="releaseDate">Release Date</option>
								<option value="addedToSite">Added to Site</option>
								<option value="mostPopular">Most Popular</option>
							</optgroup>
						</select>
					</div>
					<div class="col-lg-9">
						<!-- If there are any, use ${message} to display the number of results! -->
						<p style="font-size:20px;" class="text-left">${message}</p>
						<hr>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		<!-- Display Results in 'Cover' View -->
			<div id="coverResultContainer" class="col-md-8 col-md-offset-2">
				
			</div>
		<!-- Display Results in 'List' View -->
			<div id="listResultContainer" class="col-md-8 col-md-offset-2" style="display:none;">
				<div class="row">
					<div class="col-md-12">
						<h3>Title by <a href="#">Authors</a></h3>
					</div>
					<div class="thumbnail col-md-2">
						<img class="img-responsive" src="/Library/resources/img/TestImg4.jpg" alt="...">
					</div>
					
					<div class="col-md-2">
						<p  style="font-size:15px;">
							<span class="glyphicon glyphicon-tags"></span>
							<a href="#"> Tag</a>,
							<br><a href="#">Tag</a>,
							<br><a href="#">Tag</a>
						</p>
					</div>
					<div class="col-md-8">
						<p  style="font-size:13px;">
							Jonas's world is perfect. Everything is under control.
							There is no war or fear of pain. There are no choices. Every
							person is assigned a role in the community. When Jonas turns 12
							he is singled out to receive special training from The Giver. The
							Giver alone holds the memories of the...
						</p>
					</div>
					<div class="col-md-12">
						<hr>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Request more results. If no / no more results found, don't show this. -->
		<div class="row">
			<div class="col-md-2 col-md-offset-5">
				<button id="moreResults" type="button" class="btn btn-default btn-lg btn-block">More</button>
			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>

	<script>
	$(document).ready(function() {
		moreResults();
		
		$('#coverDisplay').click(function(){
			$('#listResultContainer').hide();
			$('#coverResultContainer').show();
			$('#listDisplay').removeClass('active');
			$('#coverDisplay').addClass('active');
		});
		$('#listDisplay').click(function(){
			$('#coverResultContainer').hide();
			$('#listResultContainer').show();
			$('#coverDisplay').removeClass('active');
			$('#listDisplay').addClass('active');
		});
		$('#moreResults').click(function(){
			$('#moreResults').hide();
			moreResults();
			$('#moreResults').show();
		});
		
	});
	</script>
	
</body>

</html>