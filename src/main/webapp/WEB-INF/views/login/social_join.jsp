<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜 회원가입</title>
<link rel="stylesheet" href="resources/css/login/social_join.css?after" />
<script type="text/javascript">
	var status = 0;
	function socialJoin_go(f){
		if(status == 1){
			f.action = "/member_nick.do";
			f.submit();
		}
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#textfiled").keyup(function() {
		var chk = $("#textfiled").val();		
		var txt = $("#detail");
		function checkValidSomeThing(param) {
			var pattern = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
			  return pattern.test(param);
			}
			if(chk === ''){
				txt.text("");
				status = 0;
			}else if(!checkValidSomeThing(chk)){
				txt.text("닉네임은 특수문자를 제외한 2자 이상 10자 이하로 작성해주세요.").css("color", "red");		
				status = 0;
			}
			else {
				$.ajax({
					url : "/member_nick_chk.do",
					method : "post",
					dataType : "text",
					data : "m_nick="+chk,
					async : false,
					success : function(result) {
						if(result >= 1){
							txt.text("중복된 아이디입니다.").css("color", "red");	
							status = 0;
						}else{
							txt.text("사용 가능한 아이디입니다.").css("color", "green");
							status = 1;							
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
	<form action="/setNick.do" method="post">
	<div id="mydiv">
	
	<div style="width:1100px; margin: auto; margin-top:150px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext"><span style="color:tomato">냠냠레시피</span>에서 사용하실 닉네임을 정해주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>
	
	<div style="margin-top:100px;">
	<input type="text" name="m_nick" value="${m_nick }" id="textfiled" required>
	<div id="idline"></div>
	<div id="detail"></div>
	</div>
			
	<div style="text-align:center; margin-top:120px;">
	<button type="submit" class="buttons" style="background:tomato;" onclick="socialJoin_go(this.form)"><span>회원가입</span></button>
	<button type="button" class="buttons" style="background:gray;" onclick="history.go(-1)"><span>돌아가기</span></button>
	</div>
	<input type="hidden" value="${m_id }" name="m_id">
	</div>
	</form>
</body>
</html>