<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="resources/css/header.css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
function recipeChk() {
//$("#recipeChk").on('click', function() {
$.ajax({
	type: 'get',
	url : '/limit_recipe_chk.do',
	async : true ,
	dataType : 'text' ,
	success : function(result) {
		var result = result;
		
		console.log(result);
		if(result=="yes"){
		if(confirm("작성중인 게시글이 있습니다.\n이어서 작성하시겠습니까?\n취소클릭시 기존글은 삭제되고 새글 작성페이지로 넘어갑니다.") == true){
		location.href="/user_recipe_write.go?result="+result;
		}else{
			result = "cancelandgo";
			location.href="/user_recipe_write.go?result="+result;			
		}		
		}else {
			location.href="/user_recipe_write.go";
		}
	}
}); /* ajax 끝 */
//}); /* recipeChk 클릭 끝 */	
}

</script>
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
            <button type="submit" class="search_bt">
            <img class="search_icon" src ="/resources/images/search_icon_white.png"></button>
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
                  <a onclick="recipeChk()"><span class="rcp_write_text">레시피 작성</span><!-- href="/user_recipe_write.go"  id="recipeChk"-->
                <img class="rcp_write_icon" src ="/resources/images/secret_recipe_icon.png"></a>
                </div>
            </div>
        
        <div class="menu_bar">
                <a href="/go_public_list.do"><div class="menu tab1"><span id="p_rcp">냠냠공식레시피</span></div></a>
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
            document.getElementById("login_link").removeAttribute("href"); // 로그인 링크를 비활성화
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