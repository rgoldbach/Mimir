<%@ include file="/WEB-INF/views/include/tagHandlers.jsp" %>

<!DOCTYPE html>
<html lang="en">

<%@ include file="/WEB-INF/views/include/head.jsp" %>

<body>

	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>

	<%@ include file="/WEB-INF/views/include/pageHeader.jsp" %>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<h3>${type} ${message}</h3>
				<div class="btn-group">
				  <button type="button" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-list-alt"></span> Image List</button>
				  <button type="button" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-th-list"></span> Text List</button>
				</div>
				<hr>
			</div>
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="book" title="Lorem ipsum" class="thumbnail"><img
							src="<c:url value="/resources/img/TestImg1.jpg" />"
							alt="Lorem ipsum" /></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="glyphicon glyphicon-tags"></i> <span><a
									href="#">Science</a>, <a href="#">Nonfiction</a>, <a href="#">Learn</a></span></li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<h3>
							<a href="book" title="">A Brief History of Time</a>
						</h3>
						<h4>
							<a href="#" title="">Stephen Hawking</a>
						</h4>
						<hr>
						<h5>A landmark volume in science writing by one of the great
							minds of our time, Stephen Hawking's book explores such profound
							questions as: How did the universe begin-and what made its start
							possible? Does time always flow forward? Is the universe
							unending-or are there boundaries? Are there...</h5>
						<a href="#">More</a>
					</div>
					<span class="clearfix borda"></span>
				</article>
				<hr>
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="book" title="Lorem ipsum" class="thumbnail"><img
							src="<c:url value="/resources/img/TestImg2.jpg" />"
							alt="Lorem ipsum" /></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="glyphicon glyphicon-tags"></i> <span><a
									href="#">Fiction</a>, <a href="#">Future</a>, <a href="#">School</a></span></li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<h3>
							<a href="book" title="">The Giver</a>
						</h3>
						<h4>
							<a href="#" title="">Lois Lowry</a>
						</h4>
						<hr>
						<h5>Jonas's world is perfect. Everything is under control.
							There is no war or fear of pain. There are no choices. Every
							person is assigned a role in the community. When Jonas turns 12
							he is singled out to receive special training from The Giver. The
							Giver alone holds the memories of the...</h5>
						<a href="#">More</a>
					</div>
					<span class="clearfix borda"></span>
				</article>
				<hr>
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="book" title="Lorem ipsum" class="thumbnail"><img
							src="<c:url value="/resources/img/TestImg3.jpg" />"
							alt="Lorem ipsum" /></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="glyphicon glyphicon-tags"></i> <span><a
									href="#">Fantasy</a>, <a href="#">Dragons</a>, <a href="#">Awesome</a></span></li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<h3>
							<a href="book" title="">Game of Thrones</a>
						</h3>
						<h4>
							<a href="#" title="">George R.R. Martin</a>
						</h4>
						<hr>
						<h5>For the first time, all five novels in the epic fantasy
							series that inspired HBO's Game of Thrones are together in one
							boxed set. An immersive entertainment experience unlike any
							other, A Song of Ice and Fire has earned George R. R.
							Martin-dubbed "the American Tolkien" by Time magazine-interna...
						</h5>
						<a href="#">More</a>
					</div>
					<span class="clearfix borda"></span>
				</article>
				<hr>
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col md-3">
						<center>
							<img style="max-width: 100px;"
								src="<c:url value="/resources/img/loading.gif" />" />
						</center>
					</div>
				</article>
			</div>
		</div>
	</div>

	<hr>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/include/javascriptSources.jsp" %>
	
</body>

</html>
