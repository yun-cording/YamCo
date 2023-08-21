<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_header</title>

<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.korzh.com/metroui/v4/css/metro-all.min.css"> -->
<link rel="stylesheet" href="resources/css/admin/admin_header.css">
<!-- <script src="https://cdn.korzh.com/metroui/v4/js/metro.min.js"></script> -->
</head>
<body>
	<div id="admin_header_container">
		<div id="admin_header_left">공백</div>
		<div id="admin_header_right">
			<!-- 로그인 성공여부 체크 -->
			<%-- 				<c:choose> --%>
			<%-- 					<c:when test="${loginChk == 'ok'}"> --%>
			<div>
				<a href="/"><img src="resources/images/java2.png" alt=""><span
					class="badge inside bg-blue fg-white">21</span></a>
			</div>
			<div>${mvo.m_name }???님, 안녕하세요</div>
			<div>
				<a href="/"><img src="resources/images/java4.gif" alt=""></a>
			</div>
			<%-- 					</c:when> --%>
			<%-- 					<c:otherwise> --%>
			<!-- 						<a href="/"> 로그인 </a> -->
			<%-- 					</c:otherwise> --%>
			<%-- 				</c:choose> --%>
		</div>
	</div>
</body>
</html>