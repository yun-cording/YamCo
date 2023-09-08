<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/recentlist.css?after" />
</head>
<body>
	<div id=quickmenu_total>
		<div class="quickmenu">
			<div class="recent">
				<span>최근 본 레시피</span> <br> <br>
			</div>
			<c:forEach items="${recent }" var="k">
			<!-- idx가 1만 이상 -->
				<c:choose>
					<c:when test="${k.idx>=10000 }">
						<a href="/user_recipe_detail.do?rcp_idx=${k.idx }">
							<div class="recent_center">
								<img	src="${k.img }" alt="" >
								<p class="cate">${k.cate } | ${k.title }</p>
								<p class="writer">작성자 : ${k.writer }</p>
							</div>
						</a>
					</c:when>
					<c:otherwise>
						<a href="/go_publicDet.do?rcp_seq=${k.idx }">
							<div class="recent_center">
								<img	src="${k.img }" alt="" >
								<p class="cate">${k.cate } | ${k.title }</p>
								<p class="writer">작성자 : ${k.writer }</p>
							</div>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</body>
</html>