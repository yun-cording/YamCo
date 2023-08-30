<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/login/member_join.css?after" />
<script type="text/javascript">
var status1 = 0;
var status2 = 0;
var status3 = 0;
var status4 = 0;
var status5 = 0;
var status6 = 0;

function memberinfochk() {
	alert("개인 회원 약관에 동의");
	status5 = 1;
}

function memberinfoagree() {
	alert("개인정보 수집 및 이용 동의");
	status6 = 1;	
	if(status1==1 && status2==1 && status3==1 && status4==1 && status5==1 && status6==1){
		document.getElementById('join_chk').style.backgroundColor="tomato";
		document.getElementById('join_chk').disabled=false;
	}
}

function memberJoin_go(f) {
	f.action = "/member_join.do";
	f.submit();
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
		status2 = 0;
	}else if(!checkValidSomeThing(pw)){
		document.getElementById('pwTxt').innerHTML=' 최소 8자리 이상 15자리 이하 영문 소문자, 숫자를 사용해주세요.';
		document.getElementById('pwTxt').style.color="red";
		status2 = 0;
	}
	
	if(pwChk == null || pwChk == ''){
		document.getElementById('pwDouble').innerHTML='';
		status2 = 0;
	}else if(pw != pwChk){
		document.getElementById('pwDouble').innerHTML='비밀번호가 일치하지 않습니다.';
		document.getElementById('pwDouble').style.color="red";
		status2 = 0;
	}else{
		document.getElementById('pwDouble').innerHTML='비밀번호가 일치합니다.';
		document.getElementById('pwDouble').style.color="green";
		status2 = 1;
	}
}

function phoneChk_go() {
	var phone = document.getElementById('m_phone').value;
	
	function checkValidSomeThing(param) {
		var phoneNum = /^\d{3}\d{4}\d{4}$/;
		  return phoneNum.test(param);
		}
	
	if(phone == null || phone == ''){
		document.getElementById('phoneChk').innerHTML='';
		status3 = 0;
	}else if(!checkValidSomeThing(phone)){
		document.getElementById('phoneChk').innerHTML='핸드폰 번호 11자리 "-"를 제외하고 모두 입력해주세요.';
		document.getElementById('phoneChk').style.color="red";
		status3 = 0;
	}else if(checkValidSomeThing(phone)){
		document.getElementById('phoneChk').innerHTML='';
		status3 = 1;
	}
}

function birthChk_go() {
	var birth = document.getElementById('m_birthday').value;

	function checkValidSomeThing(param) {
		var birthNum = /^[0-9]{4}$/;
		  return birthNum.test(param);
		}
	if(birth == null || birth == ''){
		document.getElementById('birthChk').innerHTML='';
		status4 = 0;
	}else if(!checkValidSomeThing(birth)){
		document.getElementById('birthChk').innerHTML='생년은 제외하고 생일 4자리만 입력해주세요.';
		document.getElementById('birthChk').style.color="red";
		status4 = 0;
	}else if(checkValidSomeThing(birth)){
		document.getElementById('birthChk').innerHTML='';
		status4 = 1;
	}
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#m_id").keyup(function() {
		var chk = $("#m_id").val();		
		function checkValidSomeThing(param) {
			  var myRe = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			  return myRe.test(param);
			}

		var txt = $(".idDoubleChk");
			if(chk === ''){
				txt.text("");
				status1 = 0;
			}else if(!checkValidSomeThing(chk)){
				txt.text("이메일 형식으로 입력해주세요.").css("color", "red");		
				status1 = 0;
			}else{
				$.ajax({
					url : "/go_memberIdChk.do",
					method : "post",
					dataType : "text",
					data : "m_id=" + $("#m_id").val(),
					async : false,
					success : function(result) {
						if(result >= 1){
							$(".idDoubleChk").text("중복된 아이디입니다.").css("color", "red");
							 status1 = 0;
						}else{
							$(".idDoubleChk").text("사용 가능한 아이디입니다.").css("color", "green");
							status1 = 1;
						}
					},
					error : function() {
						alert("오류");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="member_header.jsp" />	
	<form action="" method="post">
	<div id="mydiv">	
	<div class="middleform">
	<input type="text" placeholder="아이디(이메일)" class="middletext" name="m_id" id="m_id">
	<div class="idline"></div>
	<span class="idDoubleChk"></span>
	</div>
	<div class="chk">
	<input type="password" placeholder="비밀번호" class="textfiled" name="m_pw" id="m_pw" oninput="pwChk_go()">
	<div class="idline"></div>
	<span id="pwTxt"></span>
	</div>
	<div class="chk">
	<input type="password" placeholder="비밀번호 확인 " class="textfiled" id="pwChk" oninput="pwChk_go()">
	<div class="idline"></div>
	<span id="pwDouble"></span>
	</div>
	<div class="chk">
	<input type="text" placeholder="휴대폰 " class="textfiled" name="m_phone" id="m_phone" oninput="phoneChk_go()">
	<div class="idline"></div>
	<span id="phoneChk"></span>
	</div>
	
	<div class="middleform">
	<input type="text" placeholder="생일 ex)1016" class="middletext" name="m_birthday" id="m_birthday" oninput="birthChk_go()">
	<input type="radio" value="남자" name="gender"  class="radiobox" checked><span class="chktext">남자</span>
	<input type="radio" value="여자" name="gender" class="radiobox" ><span class="chktext">여자</span>
	<div id="birthline" ></div>
	<span id="birthChk"></span>
	</div>
	
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span >개인 회원 약관에 동의</p>
	<input type="checkbox" value="" name="" id="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<span style="width: 600px; margin-top: 12px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</span>
	<input type="checkbox" value="" name="" id="chkbox2" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:30px;">
	<input type="hidden" name="gender">
	<button class="buttons" style="background:gray;" id="join_chk" onclick="memberJoin_go(this.form)" disabled><span>회원가입</span></button>
	<button type="button" class="buttons" style="background: gray"><span>돌아가기</span></button>
	</div>
	</div>
	</form>
</body>
</html>