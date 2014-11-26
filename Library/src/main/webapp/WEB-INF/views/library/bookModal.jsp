<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp" %>
<!DOCTYPE html>
<html lang="en">
<body>
	<!-- Main Content -->
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
			<span>&times;</span><span class="sr-only">Close</span>
		</button>
		<h2>${book.bookDisplay.title}</h2><!--Book Title-->
		<!-- <h5>Is it a series?</h5><!-- Series? --> 
		<h5>by 
        	<c:forEach var="author" items = "${book.authors}">
        		<a><c:out value="${author.name}"/></a>
        	</c:forEach>	
		</h5><!-- Author -->				
	</div>
	<div class="modal-body">
		<input id = "currentBook" type="hidden" value="${book.bookId}">
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
                    <div id="controls">
                        <signin:BookModal />
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