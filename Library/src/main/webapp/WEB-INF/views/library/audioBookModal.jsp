<%@ include file="/WEB-INF/views/library/include/tagHandlers.jsp" %>
<!DOCTYPE html>
<html lang="en">
<body>
	<!-- Main Content -->
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">
			<span>&times;</span><span class="sr-only">Close</span>
		</button>
		<h2>${audiobook.book.bookDisplay.title}</h2><!--Book Title-->
		<!-- <h5>Is it a series?</h5><!-- Series? --> 
		<h5>by 
        	<c:forEach var="author" items = "${audiobook.book.authors}">
        		<a><c:out value="${author.name}"/></a>
        	</c:forEach>
        <span style = "float:right">
        	Available Formats:
        	<c:forEach var="format" items = "${audiobook.audioBookFormats}">
				<a>${format.format.formatType}</a>
			</c:forEach>	
		</span>
		</h5><!-- Author -->
		<h5>Published by <a><c:out value="${audiobook.publisher.name }"/></a> 
		<span style = "float:right">	Available Languages: 
			<c:forEach var="language" items = "${audiobook.languages}">
				<a>${language.language.language}</a>
			</c:forEach>
		</span>
		
		
		</h5>				
	</div>
	<div class="modal-body">
		<input id = "currentBook" type="hidden" value="${audiobook.book.bookId}">
		<input id ="borrowedBookFormat" type = "hidden" value ="AudioBook">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<!-- Portfolio Item Row -->
            <div class="row">
                <div class="col-md-6">
                    <img class="img-responsive" src= "${audiobook.book.bookDisplay.imageFilePath}"  alt="">
                </div>
                <div class="col-md-6">
                    <h3>Book Description</h3>
                    <p>
						${ebook.book.bookDisplay.description}
                    </p>
                    <br>                   
                    <div id="controls">
                        <signin:AudioBookModal />
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