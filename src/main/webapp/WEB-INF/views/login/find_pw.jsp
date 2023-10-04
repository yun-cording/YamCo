<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/login/find_pw.css?after" />
</head>
<body>
${alert}
	<jsp:include page="member_header.jsp" />
	<form action="" method="post">
	<div id="mydiv">
	
	<div style="width:1120px; margin: auto; margin-top:150px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext">가입하실 때 입력하신 <span style="color:tomato">아이디</span>를 입력해 주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>
	
	<div style="margin-top:200px;" class="chk">
	<input type="text" placeholder="아이디(이메일)" class="textfiled" id="m_id" name="m_id" oninput="idChk()">
	<div id="idline"></div>
	<span class="id_Chk"></span>
	</div>
	<div style="text-align:center; margin-top:120px;">
	<button type="button" class="buttons" style="background:gray;"onclick="find_pw(this.form)" id="findPw" disabled><span>비밀번호 찾기</span></button>
	<button type="button" class="buttons" style="background: gray;" onclick="history.go(-1)"><span>돌아가기</span></button>
	</div>	
	
	</div>
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
	var status = 0;
	
	function log() {
		if(status == 1){
			document.getElementById('findPw').disabled=false;
			document.getElementById('findPw').style.backgroundColor="tomato";
		} else {
			document.getElementById('findPw').disabled=true;
			document.getElementById('findPw').style.backgroundColor="gray";
		}
	}
	
	$(document).ready(function() {
		$("#m_id").keyup(function() {
		var chk = $("#m_id").val();		
		function checkValidSomeThing(param) {
			  var myRe = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			  return myRe.test(param);
			}

			var txt = $(".id_Chk");
			if(chk === ''){
				txt.text("");
				status = 0;
				log();
			}else if(!checkValidSomeThing(chk)){
				txt.text("이메일 형식으로 입력해주세요.").css("color", "red");		
				status = 0;
				log();
			}else{
				$.ajax({
					url : "/go_memberIdChk.do",
					method : "post",
					dataType : "text",
					data : "m_id=" + $("#m_id").val(),
					async : false,
					success : function(result) {
						if(result >= 1){
							txt.text("가입하신 아이디입니다.").css("color", "green");
							 status = 1;
							 log();
						}else if(result == -1){
							txt.text("탈퇴한 회원입니다.").css("color", "red");
							status = 0;
							log();
						}else if(result == -2){
							txt.text("가입하신 적이 없는 아이디입니다.").css("color", "red");
							status = 0;
							log();
						}
					},
					error : function() {
						alert("오류");
					}
				});
			}
		});
	});
	
		function find_pw(f) {
			f.action = "/member_findPw.do";
			f.submit();
		}
	</script>
</body>
</html>