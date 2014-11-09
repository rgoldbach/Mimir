<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp" %>

<!DOCTYPE html>
<html lang="en">

<%@ include file="/WEB-INF/views/library/include/head.jsp" %>

<body>
	<!-- Main Content -->
	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h2>ff${book.bookDisplay.title}</h2><!--Book Title-->
                    <!-- <h5>Is it a series?</h5><!-- Series? --> 
                    <h5>by 
                    		<c:forEach var="author" items = "${book.authors}">
                    			<a><c:out value="${author.name}"/></a>
                    		</c:forEach>	
                    </h5><!-- Author -->
					
				</div>
	<div class="modal-body">
		<input id = "currentBook" type="hidden" value="testId">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-6">
                    <img class="img-responsive" src= "${book.bookDisplay.imageFilePath}"  alt="">
                </div>

                <div class="col-md-6">
                    


                    <h3>Book Description</h3>
                    <p>
						${book.bookDisplay.description}
                    </p>
                    <br>
                    <h4>Rating</h4>  
                    <div id="controls">
                        <input onclick="rateBook()" id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-symbol="&#xF379" data-default-caption="{rating} helmets" data-star-captions="{}" data-size="sm">
                        <button onclick = "borrowBook()" id="borrowBookButton" class="bg-primary btn-lg">Borrow</button>
                        <button onclick= "wishlistBook()" id = "wishlistBookButton" class="bg-info btn-sm">Wishlist</button>
                    </div>
                </div>

            </div>
            <!-- /.row -->
           			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>
	
	
	
</body>

</html>