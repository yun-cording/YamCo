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
</style>
</head>
<body>
<div id="mydiv">
<jsp:include page="../header.jsp" />
		<div id="test">
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
					<button id="see">조회순</button>
					<button id="save">등록순</button>
					<button id="star">평점순</button>
				</div>
			</div>
			<div class="flexContainer">
				<c:forEach begin="1" end="12">
					<div class="recipe_one">
						<p>
							<img
								src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg"
								class="recipe_thumbnail">
						</p>
						<p>공공레시피명</p>
						<div class="writer">
							<img
								src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
								class="profile"> <span>작성자 이름</span>
						</div>
						<div class="like" style="text-align: right;">
							<img class="icon"
								src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg"
								alt=""> <span>4.9</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png"
								alt=""> <span>42</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"
								alt=""> <span>7만</span>
						</div>
					</div>
				</c:forEach>
			</div>
      <div class=pagecontainer>
				<ol class="paging">
					<li><a href=""> < </a></li>
					<li><a href=""> 1 </a></li>
					<li><a href=""> 2 </a></li>
					<li><a href=""> 3 </a></li>
					<li><a href=""> 4 </a></li>
					<li><a href=""> 5 </a></li>
					<li><a href=""> > </a></li>
				</ol>
			</div>
		 </div>
		<aside id="sidebar-right">
			<jsp:include page="../bestlist.jsp" />
		</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>		
<script type="text/javascript">
	$(document).ready(function() {
		var i = 0;
		$("#see").on("click", function() {
				$("#see").attr("style", "background-color : tomato; color : white;")
				$("#save").attr("style", "background-color : white; color : black;")
				$("#star").attr("style", "background-color : white; color : black;")
		})
		
		$("#save").on("click", function() {
				$("#save").attr("style", "background-color : tomato; color : white;")
				$("#see").attr("style", "background-color : white; color : black;")
				$("#star").attr("style", "background-color : white; color : black;")
		})
		
		$("#star").on("click", function() {
				$("#star").attr("style", "background-color : tomato; color : white;")
				$("#see").attr("style", "background-color : white; color : black;")
				$("#save").attr("style", "background-color : white; color : black;")
		})
		
	})		
</script>
</body>
</html>
	