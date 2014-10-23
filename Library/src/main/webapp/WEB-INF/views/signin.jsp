<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Mímir</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/resources/css/clean-blog.css" />"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/Library/"><img
					style="max-width: 100px; margin-top: -15px;"
					src="<c:url value="/resources/img/logo.png" />"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">My Account</a></li>
					<li><a href="index.jsp">Sign Out</a></li>
					<li><a href="#" data-toggle="modal" data-target="#helpModal">Help</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="search-header"
		style="background-image: url('<c:url value="/resources/img/lib-bg-sm.jpg" />')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<div class="input-group input-group-lg">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									Search <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#" data-toggle="modal" data-target="#advancedSearchModal">Advanced Search</a></li>
								</ul>
							</div>
							<!-- /btn-group -->
							<input type="text" class="form-control" placeholder="&quot;So many books, so little time.&quot; - Frank Zappa"> 
								<span class="input-group-btn">
								<a href="search?type=Normal" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></a>
							</span>
						</div>
						<!-- /input-group -->

					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
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
	</div>
	
	<hr>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<ul class="list-inline text-center">
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-facebook fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Mímir 2014</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- START MODALS -->
	<div class="modal fade" id="signInModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Sign In</h4>
				</div>
				<div class="modal-body">
					<form>
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Email" name="email" type="email">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password">
							</div>
							<div class="checkbox">
								<label> <input name="remember" type="checkbox" value="Remember Me">Remember Me</label>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Sign In</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="registerModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Register</h4>
				</div>
				<div class="modal-body">
					<form>
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Library Card Number" name="LibNum" type="text">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Email" name="email" type="email">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Retype Password" name="repassword" type="password">
							</div>
							
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Register</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="helpModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Help</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="advancedSearchModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Advanced Search</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<fieldset>
							<legend>Book Information</legend>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="titleInput">Title:</label>
								<div class="col-sm-9">
									<input id="titleInput" name="titleInput" type="text"
										placeholder="Title..." class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="authorCreatorInput">Author:</label>
								<div class="col-sm-9">
									<input id="authorCreatorInput" name="authorCreatorInput"
										type="text" placeholder="Author..."
										class="form-control">
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="dateAddedSelect"> Added:</label>
								<div class="col-sm-9">
									<select id="dateAddedSelect" name="dateAddedSelect"
										class="form-control">
										<option>Past 7 Days</option>
										<option>Past 14 Days</option>
										<option>Past 30 Days</option>
										<option>Past 3 Months</option>
										<option>Past 6 Months</option>
										<option>Past Year</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="subjectSelect">Subject:
								</label>
								<div class="col-sm-9">
									<select id="subjectSelect" name="subjectSelect"
										class="form-control">
										<option>All Subjects</option>
										<option>Action</option>
										<option>Adventure</option>
										<option>African American Fiction</option>
										<option>African American Nonfiction</option>
										<option>Alternative</option>
										<option>Ambient</option>
										<option>Analysis</option>
										<option>Animation</option>
										<option>Antiques</option>
										<option>Architecture</option>
										<option>Art</option>
										<option>Ballet</option>
										<option>Beginning Reader</option>
										<option>Biography &amp; Autobiography</option>
										<option>Blues</option>
										<option>Business</option>
										<option>Careers</option>
										<option>Cartoon</option>
										<option>Chamber Music</option>
										<option>Chemistry</option>
										<option>Chick Lit Fiction</option>
										<option>Children</option>
										<option>Children's Music</option>
										<option>Children's Video</option>
										<option>Choral</option>
										<option>Christian Fiction</option>
										<option>Christian Nonfiction</option>
										<option>Classic Film</option>
										<option>Classic Literature</option>
										<option>Classical</option>
										<option>Comedy</option>
										<option>Comic and Graphic Books</option>
										<option>Computer Technology</option>
										<option>Concertos</option>
										<option>Cooking &amp; Food</option>
										<option>Country</option>
										<option>Crafts</option>
										<option>Crime</option>
										<option>Criticism</option>
										<option>Current Events</option>
										<option>Documentary</option>
										<option>Drama</option>
										<option>Economics</option>
										<option>Education</option>
										<option>Electronica</option>
										<option>Engineering</option>
										<option>Entertainment</option>
										<option>Erotic Literature</option>
										<option>Essays</option>
										<option>Ethics</option>
										<option>Family &amp; Relationships</option>
										<option>Fantasy</option>
										<option>Feature Film</option>
										<option>Feminist</option>
										<option>Fiction</option>
										<option>Film Music</option>
										<option>Finance</option>
										<option>Folk</option>
										<option>Folklore</option>
										<option>Foreign Film</option>
										<option>Foreign Language</option>
										<option>Foreign Language Study</option>
										<option>Foreign Language Study - Chinese</option>
										<option>Foreign Language Study - French</option>
										<option>Foreign Language Study - German</option>
										<option>Foreign Language Study - Italian</option>
										<option>Foreign Language Study - Japanese</option>
										<option>Foreign Language Study - Russian</option>
										<option>Foreign Language Study - Spanish</option>
										<option>Foreign Language Study - Vietnamese</option>
										<option>Games</option>
										<option>Gardening</option>
										<option>Gay/Lesbian</option>
										<option>Gender Studies</option>
										<option>Genealogy</option>
										<option>Geography</option>
										<option>Grammar &amp; Language Usage</option>
										<option>Health &amp; Fitness</option>
										<option>Historical Fiction</option>
										<option>History</option>
										<option>Holiday Music</option>
										<option>Home Design &amp; Décor</option>
										<option>Horror</option>
										<option>Human Rights</option>
										<option>Humor (Fiction)</option>
										<option>Humor (Nonfiction)</option>
										<option>IMAX</option>
										<option>Indie</option>
										<option>Inspirational</option>
										<option>Instructional</option>
										<option>Instrumental</option>
										<option>Jazz</option>
										<option>Journalism</option>
										<option>Judaica</option>
										<option>Juvenile Fiction</option>
										<option>Juvenile Literature</option>
										<option>Juvenile Nonfiction</option>
										<option>Language Arts</option>
										<option>Law</option>
										<option>Literary Anthologies</option>
										<option>Literary Criticism</option>
										<option>Literature</option>
										<option>Management</option>
										<option>Marketing &amp; Sales</option>
										<option>Martial Arts</option>
										<option>Mathematics</option>
										<option>Media Studies</option>
										<option>Medical</option>
										<option>Military</option>
										<option>Multi-Cultural</option>
										<option>Music</option>
										<option>Musical</option>
										<option>Mystery</option>
										<option>Mythology</option>
										<option>Nature</option>
										<option>New Age</option>
										<option>Non-English Fiction</option>
										<option>Non-English Nonfiction</option>
										<option>Nonfiction</option>
										<option>Opera &amp; Operetta</option>
										<option>Orchestral</option>
										<option>Outdoor Recreation</option>
										<option>Performing Arts</option>
										<option>Pets</option>
										<option>Philosophy</option>
										<option>Photography</option>
										<option>Physics</option>
										<option>Picture Book Fiction</option>
										<option>Picture Book Nonfiction</option>
										<option>Poetry</option>
										<option>Politics</option>
										<option>Pop</option>
										<option>Professional</option>
										<option>Psychiatry</option>
										<option>Psychiatry &amp; Psychology</option>
										<option>Psychology</option>
										<option>Ragtime</option>
										<option>Recovery</option>
										<option>Reference</option>
										<option>Religion &amp; Spirituality</option>
										<option>Research</option>
										<option>Rock</option>
										<option>Romance</option>
										<option>Scholarly</option>
										<option>Science</option>
										<option>Science Fiction</option>
										<option>Science Fiction &amp; Fantasy</option>
										<option>Self Help</option>
										<option>Self-Improvement</option>
										<option>Short Film</option>
										<option>Short Stories</option>
										<option>Sociology</option>
										<option>Soundtrack</option>
										<option>Sports &amp; Recreations</option>
										<option>Study Aids &amp; Workbooks</option>
										<option>Suspense</option>
										<option>Technology</option>
										<option>Theater</option>
										<option>Thriller</option>
										<option>Transportation</option>
										<option>Travel</option>
										<option>Travel Literature</option>
										<option>True Crime</option>
										<option>TV Series</option>
										<option>Urban Fiction</option>
										<option>Vocal</option>
										<option>Western</option>
										<option>Women's Studies</option>
										<option>World Music</option>
										<option>Young Adult Fiction</option>
										<option>Young Adult Literature</option>
										<option>Young Adult Nonfiction</option>
										<option>Young Adult Video</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="formatSelect">Format:
								</label>
								<div class="col-sm-9">
									<select id="formatSelect" name="formatSelect"
										class="form-control">
										<option>All Formats</option>
										<option>All eBooks</option>
										<option>All Audiobooks</option>
										<option>All Music</option>
										<option>Kindle Book</option>
										<option>OverDrive Read</option>
										<option>EPUB eBook</option>
										<option>Open EPUB eBook</option>
										<option>PDF eBook</option>
										<option>OverDrive MP3 Audiobook</option>
										<option>OverDrive WMA Audiobook</option>
										<option>OverDrive Video</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="languageSelect">Language:
								</label>
								<div class="col-sm-9">
									<select id="languageSelect" name="languageSelect"
										class="form-control">
										<option>All Languages</option>
										<option>Arabic</option>
										<option>Chinese (Simplified)</option>
										<option>Czech</option>
										<option>English</option>
										<option>French</option>
										<option>German</option>
										<option>Greek</option>
										<option>Hebrew</option>
										<option>Hindi</option>
										<option>Hungarian</option>
										<option>Italian</option>
										<option>Japanese</option>
										<option>Korean</option>
										<option>Mongolian</option>
										<option>Persian</option>
										<option>Polish</option>
										<option>Portuguese</option>
										<option>Romanian</option>
										<option>Russian</option>
										<option>Spanish</option>
										<option>Swedish</option>
										<option>Tagalog</option>
										<option>Thai</option>
										<option>Turkish</option>
										<option>Urdu</option>
										<option>Vietnamese</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="publisherSelect">Publisher:
								</label>
								<div class="col-sm-9">
									<select id="publisherSelect" name="publisherSelect"
										class="form-control">
										<option>These should be</option>
										<option>Filled Out Dynamically</option>
										<option>Selecting The Different</option>
										<option>Types of Publishers</option>
										<option>Currently In Our</option>
										<option>Database.</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="awardSelect">Awards:
								</label>
								<div class="col-sm-9">
									<select id="awardSelect" name="awardSelect"
										class="form-control">
										<option>These should be</option>
										<option>Filled Out Dynamically</option>
										<option>Selecting The Different</option>
										<option>Types of Awards</option>
										<option>Currently In Our</option>
										<option>Database.</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-1 checkbox col-sm-9">
									<label> <input id="availableNowOnly" type="checkbox"
										value=""> Only Show Books Available Now
									</label>
								</div>
							</div>

							<fieldset>
								<legend>Levels</legend>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="interestFromSelect">Interest
										Level: </label>
									<div class="col-sm-4">
										<select id="interestFromSelect" name="interestFromSelect"
											class="form-control">
											<option>All</option>
											<option>Lower Grades (K-3)</option>
											<option>Middle Grades (4-8)</option>
											<option>Lower Grades + (6-12)</option>
											<option>Upper Grades (8-12)</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="interestToSelect" name="interestToSelect"
											class="form-control">
											<option>All</option>
											<option>Lower Grades (K-3)</option>
											<option>Middle Grades (4-8)</option>
											<option>Lower Grades + (6-12)</option>
											<option>Upper Grades (8-12)</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="atosFromSelect">ATOS
										Level: </label>
									<div class="col-sm-4">
										<select id="atosFromSelect" name="atosFromSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="atosToSelect" name="atosToSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="readingFromSelect">Reading
										Level: </label>
									<div class="col-sm-4">
										<select id="readingFromSelect" name="readingFromSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="readingToSelect" name="readingToSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
								</div>
							</fieldset>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<a href="search?type=Advanced" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END MODALS -->


	<!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.js" />"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/resources/js/clean-blog.js" />"></script>
	
</body>

</html>