<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_sidebar</title>
<style type="text/css">
* {
	margin: 0px auto;
	padding: 0px;
}

html, body {
	width: 100%;
}

aside {
	width: 20%;
	display: inline-block;
	float: left;
}

main {
	width: 80%;
	display: inline-block;
	float: left;
}
</style>
</head>
<body>
<!-- 	<header></header> -->
	<aside><jsp:include page="admin_sidebar.jsp" /></aside>
	<main><jsp:include page="admin_sidebar.jsp" /></main>
<!-- 	<footer></footer> -->
</body>
</html>