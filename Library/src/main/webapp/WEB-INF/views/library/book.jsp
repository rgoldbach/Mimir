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
			<!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-6">
                    <img class="img-responsive" src="resources/img/TestImg1.jpg" alt="">
                </div>

                <div class="col-md-6">
                    <h2>A Brief History Of Time</h2><!--Book Title-->
                    <!-- <h5>Is it a series?</h5><!-- Series? --> 
                    <h5>by <a>Stephen Hawking</a></h5><!-- Author -->


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
            <br>


            <div id="accordion" class="panel-group">

                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#collapseOne" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Details</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <p><b>File Size</b>: 2437 Kilobytes</p>
                            <p><b>Publisher</b>: Bantam; 10 Anv edition (May 4, 2011)</p>
                            <p><b>ISBN-10</b>: 0553380168</p>
                            <p><b>ISBN-13</b>: 978-0553380163</p>
                        </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div data-toggle="collapse" data-target="#collapseTwo" class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Editorial Reviews</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <p>
                                "[Hawking] can explain the complexities of cosmological physics with an engaging combination of clarity and wit. . . . His is a brain of extraordinary power." - <b>The New York Review of Books</b>
                            </p>
                            <p>
                                ""This book marries a child's wonder to a genius's intellect. We journey into Hawking's universe while marvelling at his mind." - <b>The Sunday Times (London)</b>
                            </p>
                            <p>
                                "Masterful." - <b>The Wall Street Journal</b>
                            </p>
                            <p>
                                "Stupendous!" - <b>Local Drunk</b>
                            </p>
                            <p>
                                "Charming and lucid . . . [A book of] sunny brilliance." - <b>The New Yorker</b>
                            </p>

                            <p>
                                "Lively and provocative . . . Mr. Hawking clearly possesses a natural teacher's gifts-easy, good-natured humor and an ability to illustrate highly complex propositions with analogies plucked from daily life." - <b>The New York Times</b>
                            </p>
                            <p>
                                "Even as he sits helpless in his wheelchair, his mind seems to soar ever more brilliantly across the vastness of space and time to unlock the secrets of the universe." - <b>Time</b>
                            </p>



                        </div>
                    </div>
                </div>


            </div>
            <br>
			</div>
		</div>
	</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/library/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/library/include/jsSources.jsp" %>
	
	
	
</body>

</html>