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
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
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
				<a class="navbar-brand" href="#"><img
					style="max-width: 100px; margin-top: -15px;"
					src="<c:url value="/resources/img/logo.png" />"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Sign Up</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('<c:url value="/resources/img/lib-bg.jpg" />')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<h1>Search Box Goes Here</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div class="post-preview">
					<h2 class="post-title">eBooks</h2>
					<h3 class="post-subtitle">Most Popular</h3>
					<div id="Carousel" class="carousel slide">
						<!-- Carousel items -->
						<div class="carousel-inner">

							<div class="item active">
								<div class="row">
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
									<div class="col-md-3">
										<a href="#" class="thumbnail"><img
											src="http://placehold.it/250x250" alt="Image"
											style="max-width: 100%;"></a>
									</div>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#Carousel"
							class="left carousel-control"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							data-slide="next" href="#Carousel" class="right carousel-control"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--.Carousel-->
				</div>
				<hr>
				<div class="post-preview">
					<h2 class="post-title">Audio</h2>
					<h3 class="post-subtitle">Most Popular</h3>
					<p class="post-meta">[book] [book] [book] [book] [book] [book]
						[book] [book] [book]</p>
				</div>
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

	<!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/resources/js/clean-blog.min.js" />"></script>

	<script>
	$(document).ready(function() {
	    $('#Carousel').carousel({
	        interval: 5000
	    })
	});
	</script>
</body>

</html>
