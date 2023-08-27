<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
/* Header_재훈(완성) */

#header{
position: relative;
width: 1920px;
height: 230px;
background: #FFFFFF;
}


#mainlogo{
position: absolute;
width: 326px;
height: 90px;
left: 391px;
top: 30px;
}

#search_tf{
box-sizing: border-box;

position: absolute;
width: 406px;
height: 50px;
left: 757px;
top: 50px;

border: 3px solid #FF6347;
border-radius: 9px;
}
#search_tf:focus {
  outline: none; /* 포커스시 나타나는 외곽선 제거 */
  box-shadow: none; /* 포커스시 나타나는 그림자 효과 제거 */
}

#search_bt{
position: absolute;
width: 58px;
height: 50px;
left: 1163px;
top: 50px;

background: #FF6347;
border-radius: 10px;
}

#search_icon{
position: absolute;
width: 50px;
height: 50px;
left: 1167px;
top: 50px;
}

#login_bt{
position: absolute;
width: 100px;
height: 50px;
left: 1333px;
top: 50px;
background: tomato;
  border-top-left-radius: 25px;
    border-bottom-left-radius: 25px;
}

#login_white_circle{
position: absolute;
width: 40px;
height: 40px;
left: 1338px;
top: 55px;

border-radius: 20px;
background: #FFFFFF;
}

#rcp_write{
box-sizing: border-box;
border-left: 1px solid white;
position: absolute;
width: 150px;
height: 50px;
left: 1433px;
top: 50px;
border-top-right-radius: 25px;
border-bottom-right-radius: 25px;
background: tomato;
color: white ;
font-weight: bold;
font-size: 12px;
padding-left: 10px;
padding-top: 18px;
}

#rcp_write_icon{
position: absolute;
width: 50px;
height: 50px;
left: 1510px;
top: 50px;

}

#login_text{
position: absolute;
width: 42px;
height: 18px;
left: 1384px;
top: 66px;

color: white ;
font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 12px;
line-height: 20px;
}

/* Group 18237 */
#menu_bar{
position: absolute;
width: 1320px;
height: 50px;
left: 300px;
top: 150px;
border-radius: 20px;
background: tomato;
}


/* 냠냠공식레시피 */
#p_rcp{
position: absolute;
width: 180px;
height: 40px;
left: 331px;
top: 155px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}


/* 냠냠’s쉐프레시피 */
#chef_rcp{
position: absolute;
width: 220px;
height: 40px;
left: 551px;
top: 155px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}


/* 랭킹 */
#rank{
position: absolute;
width: 60px;
height: 29px;
left: 839px;
top: 161px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}


/* 냉장고를열어봐 */
#open_ref{
position: absolute;
width: 200px;
height: 29px;
left: 1004px;
top: 161px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}



/* 명예의전당 */
#grade{
position: absolute;
width: 155px;
height: 29px;
left: 1246px;
top: 161px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}


/* FAQ */
#faq{
position: absolute;
width: 180px;
height: 40px;
left: 1497px;
top: 154px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

 #faq a {
    color: white; /* FAQ 원래 색상인 흰색으로 변경 */
  }

</style>
<script>
  // 다른 링크를 클릭할 때 색상을 원래대로 되돌립니다.
  function resetColor() {
    document.querySelector("#faq a").style.color = originalColor;
  }
</script>
</head>
<body>
	<form action="">
	<div id="header">
		<a href="/home.go"><img id="mainlogo" src ="/resources/images/logo.png"></a>
		<input type="text" id="search_tf" name="search_tf" value="">
		<div id="search_bt"></div>
		<img id="search_icon" src ="/resources/images/search_icon_white.png">
		<div id="login_bt"></div>
		<div id="login_white_circle"></div>
		<div id="rcp_write"><a href="/user_recipe_write.go">레시피 작성</a></div>
		<img id="rcp_write_icon" src ="/resources/images/secret_recipe_icon.png">
		<span id="login_text"><a href="/login.go">로그인</a></span>
		<div id="menu_bar"></div>
		<span id="p_rcp"><a href="/public_list.go">냠냠공식레시피</a></span>
		<span id="chef_rcp"><a href="/user_list.go">냠냠's쉐프레시피</a></span>
		<span id="rank"><a href="/ranking_recipe.go">랭킹</a></span>
		<span id="open_ref"><a href="/plz.go">냉장고를열어봐</a></span>
		<span id="grade"><a href="/award.go">명예의전당</a></span>
		<span id="faq"><a href="/faq.go">FAQ</a></span>
	</div>
	</form>	
</body>
</html>