<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/login/find_pw.css" />
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="" method="post">
	<div id="mydiv">
	
	<div style="width:1120px; margin: auto; margin-top:150px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext">가입하실 때 입력하신 <span style="color:tomato">아이디</span>를 입력해 주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>
	
	<div style="margin-top:200px;">
	<input type="text" placeholder="아이디(이메일)" id="textfiled m_id" name="m_id" required>
	<div id="idline"></div>
	</div>
	<div style="text-align:center; margin-top:120px;">
	<button class="buttons" style="background:#FF6347;"onclick="find_pw(this.form)"><span>비밀번호 찾기</span></button>
	<button class="buttons" style="background: gray;"><span>돌아가기</span></button>
	</div>	
	
	</div>
	</form>
	<script type="text/javascript">
		function find_pw(f) {
			f.action = "/member_findPw.do";
			f.submit();
		}
	</script>
</body>
</html>