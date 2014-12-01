<nav class="navbar navbar-default navbar-static-top"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<p>
			<a class="navbar-brand" href=""><img
				style="max-width: 100px; margin-top: -15px; display: inline"
				src="<c:url value="/resources/img/logo.png" />"> Admin</a>
		<p>
	</div>
	<ul class="nav navbar-top-links navbar-right">
		<li>
    		<form action="./">
        		<button class="btn btn-default navbar-btn"><span class="glyphicon glyphicon-log-out"></span></button>
    		</form>
		</li>
	</ul>
	<div class="navbar-default sidebar">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="admin"><i class="fa fa-bar-chart-o fa-fw"></i> Reports</a></li>
				<li><a href="#"><i class="fa fa-book fa-fw"></i> Books<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="addBooks">Add Books</a></li>
						<li><a href="searchBooks">Search</a></li>
					</ul> <!-- /.nav-second-level --></li>
				<li><a href="users"><i class="fa fa-users fa-fw"></i>
						Users</a></li>
				<li><a href="support"><i class="fa fa-ticket fa-fw"></i>
						Support</a></li>
			</ul>
		</div>
	</div>
</nav>
