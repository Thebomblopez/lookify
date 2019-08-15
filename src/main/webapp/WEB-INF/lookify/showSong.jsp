<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body style="padding:1% 0;">
	<div class="container z-depth-3" style="padding: 1%;">

		<a href="/dashboard" style="float: right;">Dashboard</a>

		<p>
			Title:
			<c:out value="${song.title }" />
		</p>

		<p>
			Artist:
			<c:out value="${song.artist}" />
		</p>

		<p>
			Rating(1-10):
			<c:out value="${song.rating}" />
		</p>

		<br> <a href="/delete/${song.id}">Delete</a>
	</div>
</body>
</html>