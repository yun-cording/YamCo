<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bestlist.css?after" />
</head>
<body>
	<div class="bestlist">
		<div id="bestlist_label">
			<span>오늘의 인기 레시피</span>
		</div>
		<c:forEach items="${bestList }" var="k" varStatus="vs">
			<div class="bestlist_subject">
				<span>${vs.index+1}위</span>
				<span>${k.u_rcp_title }</span>
				<span>
				<img src="resources/images/icon_tomato_ver2_1.png" alt="" width="12px">
				${empty k.avg_grade ? 0 : k.avg_grade }
				</span>
			</div>
		</c:forEach>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="resources/js/user/sidebar.js"></script>
</body>
</html>