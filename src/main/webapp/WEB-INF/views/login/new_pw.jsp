<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/login/new_pw.css?after" />
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="">
	<div id="mydiv">
	
	<div style="width:990px; margin: auto; margin-top:150px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1.png" style="width:80px;">
	<span id="maintext"><span style="color:tomato">새 비밀번호</span>를 입력해 주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_2.png" style="width:80px;">
	</div>

	<div style="margin-top:200px;" class="chk">
	<input type="password" placeholder="새 비밀번호" name="m_pw" id="m_pw" class="textfiled" oninput="pwChk_go()">
	<div class="idline"></div>
	<span id="pwTxt"></span>
	</div>
	<div style="margin-top:100px;" class="chk">
	<input type="password" placeholder="비밀번호 확인" id="pwChk" class="textfiled" oninput="pwChk_go()">
	<div class="idline"></div>
	<span id="pwDouble"></span>
	</div>
	<div style="text-align:center; margin-top:120px;">
	<input type="hidden" name="m_id" value="${mvo.m_id}"> 
	<button class="buttons" id="change_pw" style="background:gray;" onclick="change_pw(this.form)" disabled><span>비밀번호 변경</span></button>
	<button class="buttons" style="background:gray;" onclick="history.go(-1)"><span>돌아가기</span></button>
	</div>
	
	</div>
	</form>
	<script type="text/javascript">
		var status = 0;
		
	function log() {
		if(status == 1){
			document.getElementById('change_pw').disabled=false;
			document.getElementById('change_pw').style.backgroundColor="tomato";
		} else {
			document.getElementById('change_pw').disabled=true;
			document.getElementById('change_pw').style.backgroundColor="gray";
		}
	}
	
	function pwChk_go() {
		var pw = document.getElementById('m_pw').value;
		var pwChk = document.getElementById('pwChk').value;
		
		function checkValidSomeThing(param) {
			var pwtxt = /^(?=.*?[a-z])(?=.*?[0-9]).{8,15}$/;
			  return pwtxt.test(param);
			}
		if(pw == null || pw == '' || checkValidSomeThing(pw)){
			document.getElementById('pwTxt').innerHTML='';
			status = 0;
			log();
		}else if(!checkValidSomeThing(pw)){
			document.getElementById('pwTxt').innerHTML=' 최소 8자리 이상 15자리 이하 영문 소문자, 숫자를 사용해주세요.';
			document.getElementById('pwTxt').style.color="red";
			status = 0;
			log();
		}
		
		if(pwChk == null || pwChk == ''){
			document.getElementById('pwDouble').innerHTML='';
			status = 0;
			log();
		}else if(pw != pwChk){
			document.getElementById('pwDouble').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('pwDouble').style.color="red";
			status = 0;
			log();
		}else{
			document.getElementById('pwDouble').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('pwDouble').style.color="green";
			status = 1;
			log();
		}
	}
	
	function change_pw(f) {
		f.action = "/member_changPw.do";
		f.submit();
	}
	</script>
</body>
</html>