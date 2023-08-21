<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_index</title>
<link rel="stylesheet"
	href="https://cdn.korzh.com/metroui/v4/css/metro-all.min.css">
<link rel="stylesheet" href="resources/css/admin/admin_index.css">
<script src="https://cdn.korzh.com/metroui/v4/js/metro.min.js"></script>
</head>
<body>
	<!-- 	<header></header> -->
	<div id="admin_index_container">
		<aside><jsp:include page="admin_sidebar.jsp" /></aside>
		<header><jsp:include page="admin_header.jsp" /></header>
		<main><jsp:include page="admin_main_dashboard.jsp" /></main>
	</div>
	<!-- 	<footer></footer> -->
</body>
</html>