<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Song</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body style="padding:1% 0;">
	<div class="container z-depth-3" style="padding: 1%;">

		<header>

			<a href="/dashboard" style="float: right;">DashBoard</a>
		</header>

		<div id="main">

			<form:form action="/songs/action_new" method="POST"
				modelAttribute="song">

				<p>
					<form:label path="title">Title:</form:label>
					<form:errors path="title" />
					<form:input path="title" />
				</p>
				<p>
					<form:label path="artist">Artist:</form:label>
					<form:errors path="artist" />
					<form:input path="artist" />
				</p>
				<p>
					<form:label path="rating">Rating:</form:label>
					<form:errors path="rating" />
					<form:select path="rating" items="${ratingRange}" class="browser-default col s3"/>
				</p>
				<input type="submit" value="Submit" class="col s4 waves-effect waves-light btn"/>
			</form:form>
		</div>
	</div>
</body>
</html>