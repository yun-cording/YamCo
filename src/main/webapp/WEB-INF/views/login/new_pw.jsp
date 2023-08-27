<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/login/new_pw.css" />
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="">
	<div id="mydiv">
	
	<div style="width:990px; margin: auto; margin-top:240px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext"><span style="color:tomato">새 비밀번호</span>를 입력해 주세요!!</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>
	
	<div style="margin-top:200px;">
	<input type="text" placeholder="새 비밀번호 : " class="textfiled">
	<div class="idline"></div>
	</div>
	<div style="margin-top:100px;">
	<input type="text" placeholder="비밀번호 확인 : " class="textfiled">
	<div class="idline"></div>
	</div>
	<div style="text-align:center; margin-top:120px;">
	<button class="buttons" style="background:#FF6347;"><span>비밀번호 변경</span></button>
	<button class="buttons" style="background:gray;"><span>돌아가기</span></button>
	</div>
	
	</div>
	</form>
</body>
</html>