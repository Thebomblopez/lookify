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

		<header>
			<h1 style="display: inline-block">Top Ten Songs:</h1>
			<a href="/dashboard" style="float: right;">Dashboard</a>
		</header>

		<div id="main">
			<ol>
				<c:forEach items="${topTen}" var="song">
					<li><a href="/songs/${song.id}"><c:out
								value="${song.title }" /></a> - <c:out value="${song.artist}" /></li>
				</c:forEach>
			</ol>
		</div>

	</div>
</body>
</html>