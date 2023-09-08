<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
=======
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
		location.href = "/public_list.go";
	}
	function go_user_list(){
		location.href = "/user_list.go";
	}
	function go_main() {
		location.href = "/go_main.do";
	}
	function go_error404() {
		location.href = "/go_error404.do";
	}
	function go_error500() {
		location.href = "/go_error500.do";
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
	function go_search() {
		location.href = "/go_search.do";
	}
	
	// 상우 사용자, 공공 상세페이지, 글쓰기, 수정하기, 관리자 ▼
	function user_recipe_det() {
		location.href = "/go_userDet.do";
	}
	function user_recipe_write() {
		location.href = "/go_userWrite.do";
	}
	function user_recipe_update() {
		location.href = "/go_userUpdate.do";
	}
	function go_admin_ppl() {
		location.href = "/go_admin_ppl.do";
	}
	
</script>

<script type="text/javascript">
function go_admin_report() {
	location.href = "/admin_report_recipe.do";
}
function go_admin_dashboard() {
		location.href = "/go_admin_dashboard.do";
}
function go_admin_memberchk() {
		location.href = "/go_admin_memberchk.do";
}
function go_admin_notice() {
		location.href = "/go_admin_notice.do";
}
function go_admin_faq() {
		location.href = "/go_admin_faq.do";
}
function go_admin_contentchk() {
		location.href = "/go_admin_contentchk.do";
}
function go_tableExam() {
		location.href = "/go_tableExam.do";
}
function go_drag() {
		location.href = "/go_drag.do";
}
function go_admin_register() {
		location.href = "/go_admin_register.do";
}


</script>
>>>>>>> refs/heads/master
</head>
<body>
<<<<<<< HEAD
	<jsp:forward page="/main.go" />
=======
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
	<button onclick="go_error404()">go_error404</button>
	<button onclick="go_error500()">go_error500</button>
	<!-- 상우  사용자, 공공 상세페이지, 글쓰기, 수정하기 ▼, 관리자 -->
	<button onclick="user_recipe_det()">user_recipe_det</button>
	<button onclick="public_recipe_det()">public_recipe_det</button>
	<button onclick="user_recipe_write()">user_recipe_write</button>
	<button onclick="user_recipe_update()">user_recipe_update</button>
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
	<hr>
	<h4>관리자 페이지</h4>
	<button onclick="go_admin_report()">go_admin_report</button>
	<button onclick="go_admin_dashboard()">go_admin_dashboard</button>
	<button onclick="go_admin_memberchk()">go_admin_memberchk</button>
	<button onclick="go_admin_notice()">go_admin_notice</button>
	<button onclick="go_admin_faq()">go_admin_faq</button>
	<button onclick="go_admin_contentchk()">go_admin_contentchk</button>
	<button onclick="go_admin_ppl()">go_admin_ppl</button>
	<button onclick="go_admin_register()">go_admin_register</button>
	
  <button onclick="go_tableExam()">go_tableExam</button>
	<button onclick="location.href='/simbatest'">심바테스트중</button>	
	<button onclick="go_drag()">드레그앤드랍테스트</button>
	
>>>>>>> refs/heads/master
</body>
</html>