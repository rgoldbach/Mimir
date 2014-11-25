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

</head>

<body>

	<div class="navbar navbar-fixed-top navbar-default" style="background:#F8DE7E;">
                <div class="container">
                    <br><img src="<c:url value="/resources/img/TestLama.png" />" height="100" alt="" align="left"/><h1>zon</h1>
                    <nav class="navbar-collapse collapse pull-left" style="line-height:3px; height:3px;">
                        <ul class="nav navbar-nav" style="display:inline-block;">
                            <li><a href="">Buy a Lamadle</a>
                            </li>
                            <li><a href="">Lamadle eBooks</a>
                            </li>
                            <li><a href="">Daily Lamas</a>
                            </li>
                            <li><a href="">Free Lama Apps</a>
                            </li>
                            <li><a href="">Lamastand</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="container">
                <div class="row"><br><br><br><br><br><br><br><br><br></div>
                <div class="row clearfix">
                    <div class="col-md-1 column">
                    </div>
                    <div class="col-md-3 column">
                        <img class="img-responsive" src="<c:url value="/resources/img/TestImg1.jpg" />" />
                    </div>
                    <div class="col-md-8 column">
                        <h2>
                            Book Title
                        </h2>
                        <h4>
                            Book Author
                        </h4>
                        <p>
                            such Description wow book description, such book so descript. such Description wow book description, such book so descript. such Description wow book description, such book so descript. such Description wow book description, such book so descript. such Description wow book description, such book so descript. such Description wow book description, such book so descript. such Description wow book description, such book so descript. 
                        </p>
                        <br><br>
                        <div class="row clearfix">
                            <div class="col-md-1 column">
                            </div>
                            <div class="col-md-2 column">
                                <button type="button" class="btn btn-success btn-lg">Rent</button>
                            </div>
                            <div class="col-md-1 column">
                            </div>
                            <div class="col-md-2 column">
                                <a href="book" type="button" class="btn btn-lg btn-default">Return</a>
                            </div>
                            <div class="col-md-6 column">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.js" />"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/resources/js/clean-blog.js" />"></script>
	
</body>

</html>