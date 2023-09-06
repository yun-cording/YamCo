<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
	<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

#mydiv{
   width: 1920px;
   margin:  auto;		
}
    
 #sidebar-right {
	background-color: white;
	float: left;
	width: 15.625%;
}

#sidebar-left {
	background-color: white;
	width: 15.625%;
	float: left;
}

#content {
	width: 68.75%;
	float: left;
	margin-top: 0px;
	background: white;
	font-family: 'Yeongdeok_TTF';
}

#footer {
	left: 0px;
	color: #fff;
	width: 100%;
	clear: left;
	padding-top: 300px;
}

#category{
	margin-top: 25px;
	font-size: 15px;
}

#category li:hover{
	background-color: #E53A1B;
}

 ul{
 	list-style: none;
	margin: auto;
	width: 625px;
 }	

#info_first{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	
	width: 125px;
	height: 50px;
	
	background: tomato;
	border-radius: 30px 0px 0px 30px;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

#info{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	
	width: 125px;
	height: 50px;
	float: left;
	
	background: tomato;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

#info_end{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	
	width: 125px;
	height: 50px;
	
	background: tomato;
	border-radius: 0px 30px 30px 0px;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

.title_line{
	width: 1320px;
	border: 2px solid tomato;
	height: 1px;
	margin-top: 100px;
}

button{
	 font-family: 'Yeongdeok_TTF';
	 font-size: 16px;
	 width: 80px;
	 height: 30px;
	 background-color: white;
	 border: 2px solid tomato;
	 box-sizing: border-box;
}

.search_txf{
	width: 300px;
	height: 29px;
	
	border: 3px solid #FF6347;
	border-radius: 9px;
	
	margin-top: 53px;
	margin-left: 510px;	
}

.search_item input:focus{
    border-color:tomato;
    outline: none;
}

.search_btn{
	width: 40px;
	height: 32px;
	border: none;
	background: #FF6347;
	border-radius: 10px;
	
	margin-left: -5px;
	margin-bottom: 20px;
	position: relative;
	top: 11px;
}

.icon_search{
	z-index : 1;
	position: relative;
	margin-left: 811px;
	margin-top: -53px;
	width: 20px;
}

.search_icon2{
	width: 35px;
	height: 35px;
	position: relative;
	margin-top: 10px;
}

.kindOf{ 
	z-index: 2;
	float: left;
	margin-left: 1030px;
	margin-top: -37px;
}

.kindOf button:hover{ 
	background-color: tomato;
	color: white;
}

#see{	
	float: left;
	padding: 2px;
}

#save{
	float: left;
	padding: 2px;
}

#star{
	float: left;
	padding: 2px;
	}

.recipe_thumbnail {
	width: 250px;
	height: 250px;
}

.recipe_one {
	margin: 60px 20px;
	width: 250px;
	display: inline-block;
}

.like img {
	vertical-align: middle;
	width: 16px;
	height: 16px;
}

.like span {
	height: 16px;
	font-size: 12px;
}

.profile {
	vertical-align: middle;
	width: 30px;
}

.writer {
	height: 30px;
}

.writer span {
	font-size: 16px;
	line-height: 30px;
}

.flexContainer {
	width: 1320px;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-evenly;
}

ol.paging {
	text-align:center;
	list-style: none;
	height: 50px;
}

ol.paging li {
	display: inline;
}

ol.paging li a {
	display: inline-block;
	width: 40px;
	text-decoration: none;
	padding: 5px 5px;
	color:	tomato;
	font-weight: bold;
}

ol.paging li a:hover {
	background: tomato;
	color: white;
	font-weight: bold;
}

.pagecontainer{
	display: block; 
	margin: auto;
}
button:hover {
	cursor:pointer; 
}

#append_field{
	text-align: center;
}
</style>
</head>
<body>
<div id="mydiv">
<jsp:include page="../header.jsp" />
	<aside id="sidebar-left">
		<jsp:include page="../recentlist.jsp" />
	</aside>
	<div id="content">
		<div id="category">
			<ul>
				<a href="/myinfo.go"><li id="info_first">내 정보</li></a>
				<a href="/mywishlist.go"><li id="info">찜 목록</li></a>
				<a href="/reportcontent.go"><li id="info">신고 내역</li></a>
				<a href="/mycontent.go"><li id="info">내가 쓴 게시글</li></a>
				<a href="/mycomment.go"><li id="info_end">내가 쓴 댓글</li></a>
			</ul>
		</div>
		<div class="title_line"></div>			
		<div class="search_item">
			<input type="text" class="search_txf" name="search_txf">
			<button class="search_btn">
			</button>
			<div class="icon_search">
				<img class="search_icon2" src="/resources/images/search_icon_white.png">
			</div>
			<div class="kindOf">
				<button type="button" id="see" onclick=" wish_sort_hit_go()" style="background-color: tomato; color: white;">조회순</button>
				<button type="button" id="star" onclick="wish_sort_grade_go()">평점순</button>
			</div>
		</div>
		<div class="flexContainer">
			<c:forEach items="${wishList }" var="k">
				<div class="recipe_one" style="display: none">
					<a href="/사용자레시피?rcp_seq=${k.rcp_idx}">
						<p><img src="${k.u_rcp_img }" class="recipe_thumbnail"></p>
						<p>${k.u_rcp_title }</p>
						<div class="writer">
							<img src="${k.m_image }" class="profile"><span>${k.m_nick }</span>
						</div>
					</a>
					<div class="like" style="text-align: right;">
						<img class="icon" src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg" alt="">
						<span>${empty k.avg_grade ? 0 : k.avg_grade }</span>
						<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
						<span>${empty k.c_count ? 0 : k.c_count}</span>
						<img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"	alt="">
						<span>${empty k.u_rcp_hit ? 0 : k.u_rcp_hit}</span>
					</div>	
				</div>
			</c:forEach>
		</div>
		<c:if test="${wishList.size()>2 }">
			<div class="d-flex justify-content-center my-5" id="append_field">
				<button type="button" class="btn btn-lg text-white"
				 style="background-color: tomato; color: white;" id="btn_append">더보기
				 </button>
			</div>
		</c:if>
	</div>
	<aside id="sidebar-right">
		<jsp:include page="../bestlist.jsp" />
	</aside>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>		
<script type="text/javascript">
$(function () {
	var idx = 2;
	var order = '${order}';
	if(order==1){
		$("#see").css("background-color","white")
		$("#see").css("color","black")
		
		$("#star").css("background-color","tomato")
		$("#star").css("color","white")
	}
	$(".recipe_one").slice(0,idx).show();
	if(order==1){
		$("#u_order_hit").attr("class","col-1 tab-off")
		$("#u_order_grade").attr("class","col-1 tab-on")
	}
	$("#btn_append").on("click", function() {
        $(".recipe_one:hidden").slice(0, idx).show();
        if ($(".recipe_one:hidden").length === 0) {
            $("#btn_append").hide(); // 모든 항목이 표시되었을 때 버튼 숨기기
        }
	});
});
	function wish_sort_grade_go() {
		location.href="/mywishlist.go?order=1"
	}
	function wish_sort_hit_go() {
		location.href="/mywishlist.go?order=0"
	}
</script>
</body>
</html>
	