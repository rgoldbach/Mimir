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
			
				        <!-- Page Content -->
        <div class="col-lg-12">
            <ul class="nav nav-pills nav-stacked col-md-2">
                <li class="active"><a href="#tab_a" data-toggle="pill"> <p align="center"> <i class="fa fa-book fa-5x">  </i> <span style="font-size:200%;"> <br>Bookshelf </span> </p> </a></li>
                <li><a href="#tab_b" data-toggle="pill"> <p align="center"> <i class="fa fa-tasks fa-4x"> </i> <span style="font-size:200%;"> <br>Lists   </span> </p> </a></li>
                <li><a href="#tab_c" data-toggle="pill"> <p align="center"> <i class="fa fa-pause fa-4x"> </i> <span style="font-size:200%;"> <br>Holds   </span> </p> </a></li>
                <li><a href="#tab_d" data-toggle="pill"> <p align="center"> <i class="fa fa-info-circle fa-4x"> </i> <span style="font-size:200%;"> <br>Information </span> </p> </a></li>
            </ul>
            <div class="container">

                <div class="tab-content col-md-10">
                    <div class="tab-pane active" id="tab_a">

                        <div class="container">
                            <center><h1 class="page-header">Bookshelf</h1></center>
                            <div class="row row-centered">
                               
                                
                                <div class="col-md-3 col-centered portfolio-item">
                                    <a href="#">
                                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg1.jpg" />">
                                    </a>
                                    <h3>
                                        <a href="#">A Brief History Of Time</a>
                                    </h3>
                                    <h4>
                                        <a href="#">Stephen Hawking</a>
                                    </h4>
                                    <p>Description Pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>                    
                                

                                <div class="col-md-3 col-md-offset-1 col-centered portfolio-item">
                                    <a href="#">
                                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg3.jpg" />">
                                    </a>
                                    <h3>
                                        <a href="#">Game of Thrones</a>
                                    </h3>
                                    <h4>
                                        <a href="#">George R.R. Martin</a>
                                    </h4>
                                    <p>Description Pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row-centered">
                                <div class="col-md-3 col-centered portfolio-item">
                                    <a href="#">
                                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg4.jpg" />">
                                  
                                    </a>
                                    <h3>
                                        <a href="#">Harry Potter And The Sorcerer's Stone</a>
                                    </h3>
                                    <h4>
                                        <a href="#">J.K. Rowling</a>
                                    </h4>
                                    <p>Description Pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>



                                <div class="col-md-3 col-md-offset-1 col-centered portfolio-item">
                                    <a href="#">
                                       <img class="img-responsive" src="<c:url value="/resources/img/TestImg6.jpg" />">
                                  
                                    </a>
                                    <h3>
                                        <a href="#">A People's History Of The United States</a>
                                    </h3>
                                    <h4>
                                        <a href="#">Howard Zinn</a>
                                    </h4>
                                    <p>Description Pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="tab-pane" id="tab_b">

                        <div class="container">
                            <center><h1 class="page-header">Lists</h1></center>

                            <div id="accordion" class="panel-group">
                                <div class="panel panel-primary">
                                    <div data-toggle="collapse" data-target="#collapseOne" class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Waitlist</a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <!--BOOKS START-->

                                            <div class="container">
                                                <center><h3 class="page-header">Books you want to borrow</h3></center>
                                                <div class="row row-centered">

                                                    <div class="col-md-3 col-centered portfolio-item">
                                                        <a href="#">
                                                           <img class="img-responsive" src="<c:url value="/resources/img/TestImg1.jpg" />">
                                  
                                                        </a>
                                                        <h3>
                                                            <a href="#">A Brief History Of Time</a>
                                                        </h3>
                                                        <h4>
                                                            <a href="#">Stephen Hawking</a>
                                                        </h4>
                                                        <p>Description Pending...</p>
                                                        <div align="center">
                                                            <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                                            <button class="btn btn-info">Borrow</button>
                                                        </div>
                                                    </div>                    


                                                    <div class="col-md-3 col-md-offset-1 col-centered portfolio-item">
                                                        <a href="#">
                                                           <img class="img-responsive" src="<c:url value="/resources/img/TestImg3.jpg" />">
                                  
                                                        </a>
                                                        <h3>
                                                            <a href="#">Game of Thrones</a>
                                                        </h3>
                                                        <h4>
                                                            <a href="#">George R.R. Martin</a>
                                                        </h4>
                                                        <p>Description Pending...</p>
                                                        <div align="center">
                                                            <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                                            <button class="btn btn-info">Borrow</button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row-centered">
                                                    <div class="col-md-3 col-centered portfolio-item">
                                                        <a href="#">
                                                            <img class="img-responsive" src="<c:url value="/resources/img/TestImg4.jpg" />">
                                  
                                                        </a>
                                                        <h3>
                                                            <a href="#">Harry Potter And The Sorcerer's Stone</a>
                                                        </h3>
                                                        <h4>
                                                            <a href="#">J.K. Rowling</a>
                                                        </h4>
                                                        <p>Description Pending...</p>
                                                        <div align="center" >
                                                            <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                                            <button class="btn btn-info" disabled='disabled'>Borrow</button>
                                                        </div>
                                                    </div>



                                                    <div class="col-md-3 col-md-offset-1 col-centered portfolio-item">
                                                        <a href="#">
                                                            <img class="img-responsive" src="<c:url value="/resources/img/TestImg6.jpg" />">
                                  
                                                        </a>
                                                        <h3>
                                                            <a href="#">A People's History Of The United States</a>
                                                        </h3>
                                                        <h4>
                                                            <a href="#">Howard Zinn</a>
                                                        </h4>
                                                        <p>Description pending...</p>
                                                        <div align="center" >
                                                            <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                                            <button class="btn btn-info">Borrow</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <!--BOOKS END-->
                                        </div>
                                    </div>      
                                </div>


                                <div class="panel panel-primary">
                                    <div data-toggle="collapse" data-target="#collapseTwo" class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Rated Titles</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="panel-body">

                                            <div class="alert alert-info" role="alert">You haven't rated any titles yet.</div>

                                        </div>
                                    </div>       
                                </div>

                                <div class="panel panel-primary">
                                    <div data-toggle="collapse" data-target="#collapseThree" class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Recommended for you</a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">

                                            <div class="alert alert-info" role="alert">No titles recommended for you, start rating books!</div>

                                        </div>
                                    </div>       
                                </div>

                                <div class="panel panel-primary">
                                    <div data-toggle="collapse" data-target="#collapseFour" class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Titles you recommend</a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse">
                                        <div class="panel-body">

                                            <div class="alert alert-info" role="alert">Titles you have recommended will show up here.</div>

                                        </div>
                                    </div>       
                                </div>


                            </div>

                        </div>


                    </div>
                    <div class="tab-pane" id="tab_c">



                        <div class="container">
                            <center><h1 class="page-header">Holds</h1></center>
                            <div class="row row-centered">
                                <div class="col-md-3 col-centered portfolio-item">
                                    <a href="#">
                                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg10.jpg" />">
                                  
                                    </a>
                                    <h3>
                                        <a href="#">Top Secret Twenty-One</a>
                                    </h3>
                                    <h4>
                                        <a href="#">Janet Evanovich</a>
                                    </h4>
                                    <p>Description pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>                    


                                <div class="col-md-3 col-md-offset-1 col-centered portfolio-item">
                                    <a href="#">
                                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg7.jpg" />">
                                  
                                    </a>
                                    <h3>
                                        <a href="#">The Fault In Our Stars</a>
                                    </h3>
                                    <h4>
                                        <a href="#">John Green</a>
                                    </h4>
                                    <p>Description pending...</p>
                                    <div align="center" >
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row-centered">
                                <div class="col-md-3 col-centered portfolio-item">
                                    <a href="#">
                                     <img class="img-responsive" src="<c:url value="/resources/img/TestImg5.jpg" />">
                                  
                                    </a>
                                    <h3>
                                        <a href="#">A Partial History Of Lost Causes</a>
                                    </h3>
                                    <h4>
                                        <a href="#">Jennifer Dubois</a>
                                    </h4>
                                    <p>Description pending...</p>
                                    <div align="center">
                                        <input id="input-21b" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" data-star-captions="{}">
                                        <button class="btn btn-danger">Return</button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>


                    <div class="tab-pane" id="tab_d">

                        <div class="container">
                            <center><h1 class="page-header">Information</h1></center>
                            <!--Todo Readonly-->
                            <form class="form-horizontal">
                                <fieldset>
                                    <!-- Form Name -->
                                    <center><h3> Settings</h3></center>
                                    <br>
                                    <!-- Text input-->
                                    <div class="form-group">

                                        <label class="col-md-4 control-label" for="LibraryCardNumber">Library Card Number:</label>  
                                        <div class="col-md-4">
                                            <input id="LibraryCardNumber" name="LibraryCardNumber" type="text" placeholder="Ex: 123456789" class="form-control input-md" disabled="disabled">

                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="Username">Username:</label>  
                                        <div class="col-md-4">
                                            <input id="Username" name="Username" type="text" placeholder="Ex: baconman4" class="form-control input-md" disabled="disabled">

                                        </div>
                                    </div>
                                    <!-- Password input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="Password">Password:</label>
                                        <div class="col-md-4">
                                            <input id="Password" name="Password" type="password" placeholder="password" class="form-control input-md" disabled="disabled">
                                        </div>




                                    </div>     

                                    <div align="center" class="form-group">                                        
                                        <!--<p style="font-size:large;">--> 
                                        <a class="btn btn-info" role="button" href="javascript.void(0);" data-toggle="modal" data-target="#settings-modal">Edit Settings</a> 
                                        <!--</p>--> 
                                    </div>

                                </fieldset>
                            </form>

                        </div>
                    </div>
                </div><!-- tab content -->

            </div>

        </div>

        <!--<div id="page-wrapper">-->
        <div id="settings-modal" class="modal fade settings-modal" tabindex="-1" role="dialog" aria-labelledby="bootstrapLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Settings</h4>
                    </div>
                    <div class="modal-body">

                        <form role="form" class="form-horizontal" data-toggle="validator">
                            <fieldset>
                                <!--<legend>User Settings</legend>-->


                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="libraryCardNumberInput">Library Card Number: </label>
                                    <div class="col-sm-9">
                                        <input id="libraryCardNumberInput" name="libraryCardNumberInput" type="number" placeholder="123456789" class="form-control" disabled="disabled">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="userNameInput">Username:</label>
                                    <div class="col-sm-9">
                                        <input id="userNameInput" name="userNameInput" type="text" placeholder="SampleUsername" class="form-control">
                                    </div>
                                </div>




                                <div class="form-group">                                        
                                    <label class="col-sm-2 control-label" for="passwordInput">Password: </label>
                                    <div class="col-sm-9">

                                        <input id="passwordInput" name="passwordInput" type="password" placeholder="samplePassword" class="form-control">
                                    </div>
                                </div> 

                                <div class="form-group">                                     
                                    <label class="col-sm-2 control-label" for="passwordConfirmInput">Confirm Password: </label>
                                    <div class="col-sm-9">
                                        <input id="passwordConfirmInput" name="passwordConfirmInput" 
                                               type="password" placeholder="samplePassword" class="form-control" data-match="#passwordInput" data-match-error="Passwords don't match">
                                        <div class="help-block with-errors"></div> 
                                    </div>


                                </div>


                            </fieldset>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        <button type="button" class="btn btn-primary"><i class="fa fa-save"></i> Save Settings</button>
                    </div>
                </div>
            </div>
        </div>

        <!--</div> -->

				<hr>
			</div>
		</div>
	
	<hr>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

	<%@ include file="/WEB-INF/views/include/modals.jsp" %>

	<%@ include file="/WEB-INF/views/include/javascriptSources.jsp" %>

</body>

</html>
