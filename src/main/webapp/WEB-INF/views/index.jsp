<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go_home() {
		location.href = "/go_home.do";
	}
	function go_ranking_search() {
		location.href = "/go_ranking_search.do";
	}
	function go_ranking_recipe() {
		location.href = "/go_ranking_recipe.do";
	}
	function go_plz() {
		location.href = "/go_plz.do";
	}
	function go_faq() {
		location.href = "/go_faq.do";
	}
	function go_award() {
		location.href = "/go_award.do";
	}
	function go_admin() {
		location.href = "/go_admin.do";
	}
	function go_public_list(){
		location.href = "/go_public_list.do";
	}
	function go_user_list(){
		location.href = "/go_user_list.do";
	}
	function go_main() {
		location.href = "/go_main.do";
	}
	function go_error() {
		location.href = "/go_error.do";
	}
	function go_find_pw() {
		location.href = "/go_find_pw.do";
	}
	function go_login() {
		location.href = "/go_login.do";
		
	}function go_member_join() {
		location.href = "/go_member_join.do";
	}
	function go_new_pw() {
		location.href = "/go_new_pw.do";
	}
	function go_social_join() {
		location.href = "/go_social_join.do";
	}
	function go_changeMyinfo() {
		location.href = "/go_changeMyinfo.do";
	}
	function go_changeMypw() {
		location.href = "/go_changeMypw.do";
	}
	function go_myComment() {
		location.href = "/go_myComment.do";
	}
	function go_myContent() {
		location.href = "/go_myContent.do";
	}
	function go_myinfo() {
		location.href = "/go_myinfo.do";
	}function go_myWishList() {
		location.href = "/go_myWishList.do";
	}
	function go_reportComment() {
		location.href = "/go_reportComment.do";
	}
	function go_reportContent() {
		location.href = "/go_reportContent.do";
	}
	function go_leaveMember() {
		location.href = "/go_leaveMember.do";
	}
	function go_leaveMember() {
		location.href = "/go_user_list.do";
	}
	function go_search() {
		location.href = "/go_search.do";
	}
	
</script>
</head>
<body>
	<h1>각자 페이지로 가는 버튼 생성 시작</h1>
	<hr>
	<h4>user사용화면</h4>
	<button onclick="go_home()">Home</button>
	<button onclick="go_search()">검색결과</button>
	<button onclick="go_public_list()">공공레시피</button>
	<button onclick="go_user_list()">사용자레시피</button>
	<button onclick="go_ranking_search()">ranking_search</button>
	<button onclick="go_ranking_recipe()">ranking_recipe</button>
	<button onclick="go_plz()">plz</button>
	<button onclick="go_faq()">faq</button>
	<button onclick="go_award()">award</button>
	<button onclick="go_admin()">admin</button>
	<button onclick="go_main()">main</button>
	<button onclick="go_error()">go_error</button>
	<hr>
	<h4>login관련</h4>
	<button onclick="go_find_pw()">go_find_pw</button>
	<button onclick="go_login()">go_login</button>
	<button onclick="go_member_join()">go_member_join</button>
	<button onclick="go_new_pw()">go_new_pw</button>
	<button onclick="go_social_join()">go_social_join</button>
	<hr>
	<h4>myPage관련</h4>
	<button onclick="go_changeMyinfo()">go_changeMyinfo</button>
	<button onclick="go_changeMypw()">go_changeMypw</button>
	<button onclick="go_myComment()">go_myComment</button>
	<button onclick="go_myContent()">go_myContent</button>
	<button onclick="go_myinfo()">go_myinfo</button>
	<button onclick="go_myWishList()">go_myWishList</button>
	<button onclick="go_reportComment()">go_reportComment</button>
	<button onclick="go_reportContent()">go_reportContent</button>
	<button onclick="go_leaveMember()">go_leaveMember</button>
	
	
</body>
</html>