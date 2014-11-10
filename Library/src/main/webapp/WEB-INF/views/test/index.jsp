<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div>
	<h1>
		<img width="60" src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif"/>
			Test Page
		<img width="60" src="http://img3.wikia.nocookie.net/__cb20130914143133/fallout/images/9/95/Alien_Dance.gif"/>
	</h1>
</div>
<div>
	<h3>Advanced Search</h3>
	<h4>Using controller.TestPageController and model.AdvancedSearchForm</h4>
	<h5>see http://examples.javacodegeeks.com/enterprise-java/spring/mvc/spring-mvc-dropdown-box-example/</h5>
	<p>
		<b>Book Info</b>: Title, Author, Genre, Language, Publisher, Awards, Added, Format, Available
	<br>
		<b>Levels</b>: Interest Level, ATOS Level, Reading Level
	</p>
	<form:form method="POST" commandName="advancedSearchForm">
		<table>
			<tr>
				<td>Title: </td>
				<td><form:input path="title"/></td>
			</tr>
			<tr>
				<td>Author: </td>
				<td><form:input path="author"/></td>
			</tr>
			<tr>
				<td>Genre: </td>
				<td><form:select path="genre">
					  <form:option value="" label="" />
					  <form:options items="${genres}" />
				       </form:select>
                </td>
                <td>Language: </td>
				<td><form:select path="language">
					  <form:option value="" label="" />
					  <form:options items="${languages}" />
				       </form:select>
                </td>
			</tr>
			<tr>
				<td>Publisher: </td>
				<td><form:select path="publisher">
					  <form:option value="" label="" />
					  <form:options items="${publishers}" />
				       </form:select>
                </td>
                <td>Awards: </td>
				<td><form:select path="award">
					  <form:option value="" label="" />
					  <form:options items="${awards}" />
				       </form:select>
                </td>
			</tr>
			<tr>
				<td>Added: </td>
				<td><form:select path="added">
					  <form:option value="" label="" />
					  <form:options items="${addeds}" />
				       </form:select>
                </td>
                <td>Format: </td>
				<td><form:select path="format">
					  <form:option value="" label="" />
					  <form:options items="${formats}" />
				       </form:select>
                </td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>
			<tr>
		</table>
	</form:form>
</div>
</body>
</html>