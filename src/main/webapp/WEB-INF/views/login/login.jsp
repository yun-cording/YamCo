<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠로그인</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- google login -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
	
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#top_pattern {
	background: url(/resources/images/login_top.png) left bottom repeat-x;
	width: 100%;
	text-align: center;
	height: 60px;
	padding-top: 15px;
}

#top_color {
	width: 100%;
	height: 100px;
	background: tomato;
	display: flex;
	align-items: center;
	justify-content: center;
}

.center {
	margin-top: 20px;
}

.login_text {
	font-size: 64px;
	font-weight: bold;
	color: tomato;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 100px;
}

.border {
	border: 3px solid tomato;
	width: 480px;
	height: 50px;
	display: flex;
	margin: auto;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
	border-radius: 5px;
	text-indent: 5px;
}

input[type="text"]::placeholder {
	color: lightgray;
}

input[type="text"]:focus {
	outline: none;
}

a {
	cursor: pointer;
	text-decoration: none;
	color: inherit;
}

.color {
	background: tomato;
	color: white;
	border: none;
}

.login_bt {
	width: 140px;
	height: 42px;
	border-radius: 25px;
	margin: auto;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 40px;
	font-size: 18px;
	font-weight: bold;
}

#find_pw {
	font-size: 10px;
	margin: auto;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 15px;
}

.social {
	width: 560px;
	height: 50px;
	display: flex;
	margin: auto;
	margin-top: 15px;
}

.social_size {
	width: 180px;
	height: 50px;
	border-radius: 5px;
}

.margin {
	margin-left: 10px;
}

.join {
	width: 560px;
	height: 50px;
	display: flex;
	border-radius: 5px;
	margin: auto;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
	font-size: 22px;
}

.g-signin2 {
	width: 200px;
	height: 50px;
}
</style>
<script type="text/javascript">
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
</script>
</head>
<body>
	<div id="content"></div>
	<div id="top_color">
		<a><img class="center"
			src="/resources/images/logo_white_yamyam.png"></a>
	</div>
	<div id="top_pattern"></div>
	<div class="login_text">로 그 인</div>
	<div>
		<input class="border" type="text" placeholder="아이디"
			onfocus="clearPlaceholder(this)"
			onblur="restorePlaceholder(this, '아이디')">
	</div>
	<div>
		<input class="border" type="text" placeholder="비밀번호"
			onfocus="clearPlaceholder(this)"
			onblur="restorePlaceholder(this, '비밀번호')">
	</div>
	<button class="color login_bt">로그인</button>
	<a id="find_pw" href="/find_pw.go">비밀번호 찾기</a>
	<div class="social">
		<a><img class="social_size"	src="/resources/images/naver_login.png"></a> 
		<a><img	class="social_size margin" src="/resources/images/kakao_login.png"></a>
		<form style="width: 180px; height: 50px; border-radius: 5px;">
		<div id="g_id_onload" data-client_id="931730291564-rocrnk3v1pph5j9q775qtinavfktiab9.apps.googleusercontent.com" data-callback="handleCredentialResponse" >
</div>
<div class="g_id_signin" style="width: 180px; height: 50px; border-radius: 5px;"></div>
<!-- <img class="g_id_signin social_size margin"	src="/resources/images/google_login.png"> -->
		</form>
		<script type="text/javascript">
		function handleCredentialResponse(response) {
		    // decodeJwtResponse() is a custom function defined by you
		    // to decode the credential response.
		    // 자료 파싱해서 console창에 띄우는 부분
		    const responsePayload = parseJwt(response.credential);
		    console.log("ID: " + responsePayload.sub);
		    console.log('Full Name: ' + responsePayload.name);
		    console.log('Given Name: ' + responsePayload.given_name);
		    console.log('Family Name: ' + responsePayload.family_name);
		    console.log("Image URL: " + responsePayload.picture);
		    console.log("Email: " + responsePayload.email);
		    /* var vo = [responsePayload]; */
		    var fullname = responsePayload.name;
		  	var id = responsePayload.sub;
		  	var image = responsePayload.picture;
		  	var email = responsePayload.email;
		    location.href="/gglogin_go?name="+fullname+"&m_id="+id;
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
	</div>
	<div>
		<div class="color join">
			<a href="/member_join.go">회원가입</a>
		</div>
	</div>

</body>
</html>