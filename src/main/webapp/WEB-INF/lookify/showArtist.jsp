<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.margin-left {
	margin-left: 2%;
}
</style>
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
	<div id="wrapper" style="width: 85%; margin: 1% auto;">
		<header class="nav-wrapper left row" style="width: inherit;">
			<a href="/songs/new" class="margin-left col s2">Add New</a> <a
				href="/search/topTen" class="margin-left col s2">Top Songs</a>

			<form action="/search"  class="margin-left col s6">
					<input type="text" name="artistName" class="col s4">
					<input type="submit"value="New Search" class="col s4 waves-effect waves-light btn">
			</form>
			<a href="/dashboard" class="right">Dashboard</a>
		</header>
		<div id="main">
			<table style="margin: 1% auto;">
				<thead>
					<tr>
						<th>Name</th>
						<th>rating</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${songs}" var="song">
						<tr>
							<td><a href="/songs/${song.id}"><c:out
										value="${song.title}" /></a></td>
							<td><c:out value="${song.rating}" /></td>
							<td><a href="delete/${song.id}">delete</a> | <a
								href="/songs/edit/${song.id}">edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>