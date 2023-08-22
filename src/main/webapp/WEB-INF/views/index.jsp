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
	function go_main() {
		location.href = "/go_main.do";
	}
</script>
</head>
<body>
	<h1>각자 페이지로 가는 버튼 생성 시작~</h1>
	<hr>
	<button onclick="go_home()">Home</button>
	<button onclick="go_ranking_search()">ranking_search</button>
	<button onclick="go_ranking_recipe()">ranking_recipe</button>
	<button onclick="go_plz()">plz</button>
	<button onclick="go_faq()">faq</button>
	<button onclick="go_award()">award</button>
	<button onclick="go_admin()">admin</button>
	<button onclick="go_main()">main</button>
	<hr>
</body>
</html>