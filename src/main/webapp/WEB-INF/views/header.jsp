<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
/* Header_재훈(완성) */
 * {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	
}

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

  #header{
  width: 1920px;
  height: 230px;
  background: #FFFFFF;
  font-family: 'Yeongdeok_TTF';
  }
  .onediv{
    width: 717px;
    height: 150px;
    float: left;
  }
  .twodiv{
    width: 446px;
    height: 150px;
    float: left;
  }
  .threediv{
    width: 58px;
    height: 150px;
    float: left;
  }
  .login{
    width: 212px;
    height: 150px;
    float: left;
  }
.rcp_write{
    width: 487px;
    height: 150px;
    float: left;
}
.menu_bar{
    width: 1920px;
    height: 80px;
    float: left;
    
}

.menu{
    width: 220px;
    height: 50px;
    background-color: tomato;
    float: left;
    color: #FFFFFF;
    font-size: 20px;  
    font-weight: bold;
    text-align: center;
    /*  부모 요소의 높이를 맞추게 되면 글자가 가운데로 감(line-height) */
    line-height: 50px;
    cursor: pointer;

}
.menu.active {
    background-color: #21730B; /* 선택된 탭의 배경색을 변경  재훈그린*/
}
.tab1{
  margin-left: 300px;
  border-top-left-radius: 25px;
  border-bottom-left-radius: 25px;
}
.tab6{
  border-top-right-radius: 25px;
  border-bottom-right-radius: 25px;
}

.mainlogo{
    width: 326px;
    height: 90px;
    margin-top: 30px;
    float: right;
}
.search_tf{
    width: 406px;
    height: 50px;
    border: 3px solid tomato;
    margin-top: 50px;
    float: right;
    border-radius: 10px;
    font-size: 16px;
  
}
.search_tf:focus{ outline: none;}
.search_bt{
  width: 58px;
  height: 50px;
  margin-top: 50px;
  background-color: tomato;
  border: none;
  border-radius: 10px;
  cursor: pointer;
}
.search_icon{
  width: 50px;
  height: 50px;
  position: relative;
  top: -53.5px;
  left: 4px;
}
.login_bt{
  width: 150px;
  height: 50px;
  background-color: tomato;
  border-top-left-radius: 25px;
  border-bottom-left-radius: 25px;
  margin-top: 50px;
  float: right;
  color: #FFFFFF; !important;
  font-size: 12px;
  font-weight: bold;
  position: relative;
}
.login_thumbnail{
  width: 40px;
  height: 40px;
  border-radius: 100%;
  background-color: white;
  margin-top: 5px;
  margin-left: 5px;
  float: left;
}
.login_text{
  float: left;
   color: #FFFFFF; !important;
  line-height: 50px;
  margin-left: 20%;
  
}
.rcp_write_bt{
  width: 150px;
  height: 50px;
  background-color: tomato;
  margin-top: 50px;
  border-left: 1px solid white;
  border-bottom-right-radius: 25px;
  border-top-right-radius: 25px;
}
.rcp_write_text{
  color: white;
  font-size: 12px;
  font-weight: bold;
  float: left;
  margin-left: 7px;
  line-height: 50px;
}
.rcp_write_icon{
  width: 50px;
  height: 50px;
  margin-left: 5px;
  float: left;
}
.clear{
  clear: both;
}
#user_Id{
    display: none; 
  position: absolute;
  top: 18px;
  color: white;
  left: 60px;
  width: 80px;
}
#user_thumbnail{
	width: 40px;
	height: 40px;
	border-radius: 20px;
}
a{
  cursor: pointer;
  text-decoration: none;
  color: inherit;
} 
.popup{
  width: 150px;
  height: 46px;
  border-radius: 8px;
  background-color:  #21730B;
  position: absolute;
  top: 52px;
  
}
#popup{
  display: none;
}
.pop_bt{
  width: 71px;
  height: 40px;
  border: none;
  float: left;
  margin-top: 3px;
  background-color: #FFFFFF;
  color: #21730B ;
  
}
.myPage{
  margin-left: 3px;
  border-top-left-radius: 8px ;
  border-bottom-left-radius: 8px ;
}
.logout{
  margin-left: 3px;
  border-top-right-radius: 8px ;
  border-bottom-right-radius:  8px;
}
</style>

</head>
<body>
	<form action="/search.go">
	<div id="header" class="clear">
		<div class="onediv">
           <a href="/main.go"><img class="mainlogo" src ="/resources/images/logo.png"></a>
        </div>
		<div class="twodiv">
           <input type="text" class="search_tf" name="search_text" value="" />
        </div>
        <div class="threediv">
            <button type="submit" class="search_bt"></button>
            <img class="search_icon" src ="/resources/images/search_icon_white.png">
        </div>
        </form>
        <div class="login">
                <div class="login_bt" onclick="togglePop()">
                  <a id="login_link" href="/login.go">
                <div class="login_thumbnail"><img id="user_thumbnail" src=""></div>
                <span id="login_text" class="login_text">로 그 인</span></a>
                <div><span id="user_Id" class="user_Id">누구누구</span></div>
                <div class="popup" id="popup">
                  <button class="pop_bt myPage" onclick="myPage_go(this.form)">마이페이지</button>
                  <button class="pop_bt logout" onclick="logOut_go(this.form)">로그아웃</button>
                </div>
                </div>
              </div>
        <div class="rcp_write">
                <div class="rcp_write_bt">
                  <a href="/user_recipe_write.go"><span class="rcp_write_text">레시피 작성</span>
                <img class="rcp_write_icon" src ="/resources/images/secret_recipe_icon.png"></a>
                </div>
            </div>
        
        <div class="menu_bar">
                <a href="/public_list.go"><div class="menu tab1"><span id="p_rcp">냠냠공식레시피</span></div></a>
                <a href="/user_list.go"><div class="menu tab2"><span id="chef_rcp">냠냠's쉐프레시피</span></div></a>
                <a href="/ranking_recipe.go"><div class="menu tab3"><span id="rank">랭킹</span></div></a>
                <a href="/plz.go"><div class="menu tab4"><span id="open_ref">냉장고를열어봐</span></div></a>
                <a href="/award.go"><div class="menu tab5"><span id="grade">명예의전당</span></div></a>
                <a href="/faq.go"><div class="menu tab6"><span id="faq">FAQ</span></div></a>
              </div>
        </div>
        <script type="text/javascript">
        function myPage_go(f) {
    		f.action="/myinfo.go";
    		f.submit();
    	}
        function logOut_go(f) {
    		f.action="/logOut_go";
    		f.submit();
    	}
        </script>
	<script type="text/javascript">
          // 로그인 확인 여부

          var loginChk = '${loginChk}' ; 
          if(loginChk){
            var userId = '${m_nick }';
            var userThumbnail = '${m_image}';

            document.getElementById("login_text").style.display = "none"; // 로그인 글자를 숨기기
            document.getElementById("user_Id").textContent  = userId; // 유저 아이디 띄우기
            document.getElementById("user_Id").style.display = "block"; // 아이디 보이게 하기
            document.getElementById("login_link").setAttribute("href", "#"); // 로그인 링크를 비활성화
            document.getElementById("user_thumbnail").src = userThumbnail; // 사용자의 썸네일을 적용
            // 레시피 작성도 평소엔 로그인 페이지로 이동하게 하고 로그인 되었다면 작성페이지로 이동하게 만들어주기

            // 로그인시 로그인쪽 클릭하면 로그아웃, 파이페이지 팝업 띄우기 
            var popupOpen = false;
            function togglePop() {
              if(!popupOpen){
                document.getElementById("popup").style.display = "flex";
              }else{
                 // 팝업 닫기
                document.getElementById("popup").style.display = "none";
              }
              popupOpen = !popupOpen;
              }
            
              
          
          }else{
        	  document.getElementById("user_thumbnail").style.display = 'none';
          }
          // tab클릭시 색상 변경
          var tabs = document.querySelectorAll('.menu');
          
          tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                  // 다른 링크를 클릭할 때 색상을 원래대로 되돌리기
                    tabs.forEach(t => t.classList.remove('active'));
                    tab.classList.add('active');
                });
          });
          </script>
</body>
</html>