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
					<div class="col-md-4">
						<div class="btn-group">
  							<button type="button" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-th"></span> Cover</button>
  							<button type="button" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-th-list"></span> List</button>
						</div>
						Sort:
						<select>
 							<option value="relevancy">Relevance</option>
 							<option value="titleAz">Title A-Z</option>
							<option value="titleZa">Title Z-A</option>
							<option value="authorAz">Author A-Z</option>
							<option value="authorZa">Author Z-A</option>
							<option value="releaseDate">Release Date</option>
							<option value="addedToSite">Added to Site</option>
							<option value="mostPopular">Most Popular</option>
						</select>
					</div>
				</div>
				<hr>
			</div>
		</div>
		
		<div class="row">
	<!-- Search Results -->
			<div id="searchResultContainer" class="col-md-8 col-md-offset-2">
				<c:forEach end="12" var="book" items = "${searchResults}">
		<!-- Search Result -->
					<div class="col-md-3">
						<div class="thumbnail">
							<img class="img-responsive" src="<c:url value="${book.imageFilePath}" />" alt="...">
							<div class="caption">
								<h6 class="resultInfo">${book.title}</h6>
								<h6 class="resultInfo">AUTHORS</h6>
							</div>
						</div>
					</div>
				 </c:forEach>
			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>
	
</body>

</html>