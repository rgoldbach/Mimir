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
				style="max-width: 150px; margin-top: -15px;"
				src="<c:url value="/resources/img/logo.png" />"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul id="signInArea" class="nav navbar-nav navbar-right">
				<signin:SignIn /> <!-- see custom tags package -->
			</ul>
		</div>
	</div>
</nav>