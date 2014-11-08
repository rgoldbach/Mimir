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
					<h2>A Brief History Of Time</h2><!--Book Title-->
                    <!-- <h5>Is it a series?</h5><!-- Series? --> 
                    <h5>by <a>Stephen Hawking</a></h5><!-- Author -->
					
				</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			<!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-6">
                    <img class="img-responsive" src="resources/img/TestImg1.jpg" alt="">
                </div>

                <div class="col-md-6">
                    


                    <h3>Book Description</h3>
                    <p>
                        #1 NEW YORK TIMES BESTSELLER

                        A landmark volume in science writing by one of the great minds of our time, Stephen Hawking's book explores such profound questions as: How did the universe begin-and what made its start possible? Does time always flow forward? Is the universe unending-or are there boundaries? Are there other dimensions in space? What will happen when it all ends?

                        Told in language we all can understand, A Brief History of Time plunges into the exotic realms of black holes and quarks, of antimatter and ""arrows of time," of the big bang and a bigger God-where the possibilities are wondrous and unexpected. With exciting images and profound imagination, Stephen Hawking brings us closer to the ultimate secrets at the very heart of creation.
                    </p>
                    <br>
                    <h4>Rating</h4>  
                    <div id="controls">
                        <input id="input-21b" value="4" type="number" class="rating" min=0 max=5 step=0.5 data-symbol="&#xF379" data-default-caption="{rating} helmets" data-star-captions="{}" data-size="sm">
                        <a href="llamazon.jsp"><button class="bg-primary btn-lg">Borrow</button></a>
                        <button class="bg-info btn-sm">Wishlist</button>
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