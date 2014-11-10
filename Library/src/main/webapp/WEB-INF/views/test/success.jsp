<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div>
	<h1>
		<img width="60" src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif"/>
			Success Page
		<img width="60" src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif"/>
	</h1>
</div>
<div>

You want to search for ${advancedSearchForm}
<br>
<br> Individual aspects of a search can be accessed like this...
<br> ${advancedSearchForm.title}
<br> ${advancedSearchForm.genre}
<br><br>
<br><a href="test">back</a>
</div>
</body>
</html>