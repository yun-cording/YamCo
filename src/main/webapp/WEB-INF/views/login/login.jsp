<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠로그인</title>
<link rel="stylesheet" href="/resources/css/login/login.css?after" />
<link rel="icon" type="image/x-icon"
	href="/resources/images/icon_tomato.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- google login -->
 <script src="https://accounts.google.com/gsi/client" async defer></script>
	
<style type="text/css">

</style>
<script type="text/javascript">
function checkValidSomeThing(param) {
	  var myRe = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	  return myRe.test(param);
	}

function clearPlaceholder(element) {
    // 입력란이 포커스를 받으면 placeholder 내용을 지움
    element.placeholder = '';
    // 글자색을 기본색으로 변경
    element.style.color = 'black';
  }
  
function restorePlaceholder(element, defaultPlaceholder) {
    // 입력란에서 포커스가 빠져나가면 placeholder 내용을 다시 설정
    if (!element.value) {
      element.placeholder = defaultPlaceholder;
      element.style.color = 'lightgray';
    }
  }
  
  function public_login(f) {
	  var id = document.getElementById('m_id').value;
	  var pw = document.getElementById('m_pw').value;
	  if(id == '' || id == null){
		  alert("아이디를 입력해주세요.");
		  return;
	  }else if(!checkValidSomeThing(id)){
		  alert("이메일 형식으로 입력해주세요.");
		  return;
	  }
	  
	  if(pw == '' || pw == null){
		  alert("비밀번호를 입력해주세요.");
		  return;
	  }
	f.action="/member_login.do";
	f.submit();
}
</script>
</head>
<body>
	 ${alert}
<form method="post">
<c:set var="clientId" value="YvbCvm24gWq60XdG4a8G" />
<c:set var="redirectURI" value="https://nohssam.shop/naver_login.do" />
<c:set var="REST_API_KEY" value="aab498f24417783525d7f40dcb83e5e6"></c:set>
<c:set var="REDIRECT_URI" value="https://nohssam.shop/kakaologin.do"></c:set>
	<div id="content">
	<div id="top_color">
		<a href="/main.do"><img class="center"
			src="/resources/images/logo_white_yamyam.png"></a>
	</div>
	<div id="top_pattern"></div>
	<div class="login_text">로 그 인</div>
	<div>
		<input class="border" id="m_id" name="m_id" type="text" placeholder="아이디"
			onfocus="clearPlaceholder(this)"
			onblur="restorePlaceholder(this, '아이디')" required>
	</div>
	<div>
		<input class="border" id="m_pw" name="m_pw" type="password" placeholder="비밀번호"
			onfocus="clearPlaceholder(this)"
			onblur="restorePlaceholder(this, '비밀번호')" required>
	</div>
	<input type="hidden" name="url" value="${url}">
	<button class="color login_bt" onclick="public_login(this.form)">로그인</button>
	<a id="find_pw" href="/find_pw.do">비밀번호 찾기</a>
	<div class="social">
			<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${clientId }&redirect_uri=${redirectURI}&state=1">
			<div class="socialnaver leftbin"><img class="social_size" src="/resources/images/naver_login.png"></div></a>
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}">
			<div class="socialkakao margin"><img class="social_size" src="/resources/images/kakao_login.png"></div></a>
		<div id="g_id_onload" data-client_id="931730291564-rocrnk3v1pph5j9q775qtinavfktiab9.apps.googleusercontent.com" data-callback="handleCredentialResponse" ></div>
		<div class="g_id_signin margin"></div>
	</div>
	<div>
		<a href="/member_join.do">
		<div class="color join">
			회원가입
		</div>
		</a>
	</div>
</div>
<script type="text/javascript">
		function handleCredentialResponse(response) {
		    // 자료 파싱해서 console창에 띄우는 부분
		    const responsePayload = parseJwt(response.credential);
		    console.log("ID: " + responsePayload.sub);
		    console.log('Full Name: ' + responsePayload.name);
		    console.log('Given Name: ' + responsePayload.given_name);
		    console.log('Family Name: ' + responsePayload.family_name);
		    console.log("Image URL: " + responsePayload.picture);
		    console.log("Email: " + responsePayload.email);
		    
		    var fullname = responsePayload.name;
		  	var m_nick = responsePayload.sub;
		  	var m_image = responsePayload.picture;
		  	var m_id = responsePayload.email; 
		    location.href="/google_login_do?m_image="+m_image+"&m_id="+m_id;
		};
		function parseJwt (token) {
		    var base64Url = token.split('.')[1];
		    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
		    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
		        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
		    }).join(''));
		    return JSON.parse(jsonPayload);
		};
		</script>
		</form>
</body>
</html>