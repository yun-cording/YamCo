<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜 회원가입</title>
<link rel="stylesheet" href="resources/css/login/social_join.css?after" />
<script type="text/javascript">
function memberinfochk() {
	alert("개인 회원 약관에 동의");
}
function memberinfoagree() {
	alert("개인정보 수집 및 이용 동의");
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#textfiled").keyup(function() {
		var chk = $("#textfiled").val();		
		var txt = $("#detail");
			if(chk === ''){
				txt.text("");
			}else{
				$.ajax({
					url : "/member_nick_chk.do",
					method : "post",
					dataType : "text",
					data : "m_nick="+chk,
					async : false,
					success : function(result) {
						if(result >= 1){
							$("#detail").text("중복된 아이디입니다.").css("color", "red");			
						}else{
							$("#detail").text("사용 가능한 아이디입니다.").css("color", "green");
						}
					},
					error : function() {
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="/setNick.do">
	<div id="mydiv">
	
	<div style="width:1100px; margin: auto; margin-top:240px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext"><span style="color:tomato">냠냠레시피</span>에서 사용하실 닉네임을 정해주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>
	
	<div style="margin-top:200px;">
	<input type="text" name="m_nick" value="${m_nick }" id="textfiled" required>
	<div id="idline"></div>
	<div id="detail"></div>
	</div>
	
	<div class="textchk" style="margin-top:20px;">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span >개인 회원 약관에 동의</p>
	<input type="checkbox" value="" name="" class="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</p>
	<input type="checkbox" value="" name="" class="chkbox" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:120px;">
	<button type="submit" class="buttons" style="background:#FF6347;"><span>회원가입</span></button>
	<button type="button" class="buttons" style="background:gray;" onclick="history.go(-1)"><span>돌아가기</span></button>
	</div>
	<input type="hidden" value="${m_id }" name="m_id">
	</div>
	</form>
</body>
</html>