<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp" %>

<!DOCTYPE html>
<html lang="en">

<%@ include file="/WEB-INF/views/library/include/head.jsp" %>

<body>

	<%@ include file="/WEB-INF/views/library/include/navbar.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/pageHeader.jsp" %>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div data-step="4" data-intro="Here are the most popular books on Mimir right now." class="ebooksMostPopular">
					<h1 class="post-title">eBooks</h1>
					<h3 class="post-subtitle">Most Popular</h3>
					<div id="eBooksMostPopularCarousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">

							<div class="item active">
								<div class="row">
									<c:forEach begin="0" end="3" var="book" items = "${topBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=EBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<c:forEach begin="4" end="7" var="book" items = "${topBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=EBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#eBooksMostPopularCarousel"
							class="left carousel-control"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							data-slide="next" href="#eBooksMostPopularCarousel" class="right carousel-control"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--.Carousel-->
				</div>
				<hr>
				<div class="ebooksNewArrivals">
					<h3 class="post-subtitle">New Arrivals</h3>
					<div id="ebooksNewArrivalsCarousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<c:forEach begin="0" end="3" var="book" items = "${newBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=EBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<c:forEach begin="4" end="7" var="book" items = "${newBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=EBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>

						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#ebooksNewArrivalsCarousel"
							class="left carousel-control"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							data-slide="next" href="#ebooksNewArrivalsCarousel" class="right carousel-control"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--.Carousel-->
				</div>
				
				<div class="audioBooksMostPopular">
					<h1 class="post-title">Audio Books</h1>
					<h3 class="post-subtitle">Most Popular</h3>
					<div id="audioBooksMostPopularCarousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">

							<div class="item active">
								<div class="row">
									<c:forEach begin="0" end="3" var="book" items = "${topAudioBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=AudioBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<c:forEach begin="4" end="7" var="book" items = "${topAudioBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=AudioBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->
						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#audioBooksMostPopularCarousel"
							class="left carousel-control"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							data-slide="next" href="#audioBooksMostPopularCarousel" class="right carousel-control"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--.Carousel-->
				</div>
				<hr>
				<div class="audioBooksNewArrivals">
					<h3 class="post-subtitle">New Arrivals</h3>
					<div id="audioBooksNewArrivalsCarousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">

							<div class="item active">
								<div class="row">
									<c:forEach begin="0" end="3" var="book" items = "${newAudioBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=AudioBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<c:forEach begin="0" end="3" var="book" items = "${newAudioBooks}">
                    					<div class="col-md-3">
											<a data-toggle="modal" data-target = "#bookModal" href="bookModal?whichBook=${book.bookDisplayId}&bookFormat=AudioBook" class="thumbnail"><img
												src="<c:url value="${book.imageFilePath}" />" alt="Image"
												style="max-width: 100%;"></a>
										</div>
                    				</c:forEach>
								</div>
								<!--.row-->
							</div>
							<!--.item-->
						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#audioBooksNewArrivalsCarousel"
							class="left carousel-control"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							data-slide="next" href="#audioBooksNewArrivalsCarousel" class="right carousel-control"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--.Carousel-->
				</div>
				
			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>

	<script>

		$(document).ready(function() {
			$('.carousel').carousel({
				interval : 5000
			})
		});
		$('.carousel').carousel('cycle');
	</script>

</body>

</html>
