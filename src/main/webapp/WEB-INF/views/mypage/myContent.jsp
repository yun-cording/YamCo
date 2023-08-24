<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	/* Rectangle 77 */
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

#title_line{
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

#search_txf{
	width: 300px;
	height: 29px;
	
	border: 3px solid #FF6347;
	border-radius: 9px;
	
	margin-top: 53px;
	margin-left: 510px;	
}

#search_btn{
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

#icon{
	z-index: 1;
	position: relative;
	margin-left: 811px;
	margin-top: -53px;
	width: 20px;
}

#search_icon2{
	width: 35px;
	height: 35px;
	position: relative;
	margin-top: 10px;
}

#content_all{
	margin-top: 100px;
}

.content_title{
	box-sizing: border-box;
	width: 1260px;
	height: 80px; 
	margin-left: 30px;
	margin-right: 30px;
		
	border-left: 20px solid ;
	border-bottom: 3px solid ;
	border-color: tomato;
	margin-top: 30px;
}

#c_title_t{	
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.text_center{
	margin: auto;
	padding-right: 180px;

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
	background-color: white;
	float: left;
	padding: 2px;
	}
	</style>
</head>
<body>
<div id="mydiv">		
		<jsp:include page="../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
			<div id="category">
				<ul>
					<li id="info_first">내 정보</li>
					<li id="info">찜 목록</li>
					<li id="info">신고 내역</li>
					<li id="info">내가 쓴 게시글</li>
					<li id="info_end">내가 쓴 댓글</li>
				</ul>
			</div>
			<div id="title_line"></div>
			<div id="search">
				<input type="text" id="search_txf" name="search_txf">
				<button id="search_btn">
				</button>
				<div id="icon">
					<img id="search_icon2" src="/resources/images/search_icon_white.png">
				</div>
			<div class="kindOf">
				<button id="see">조회순</button>
				<button id="save">등록순</button>
				<button id="star">평점순</button>
			</div>
			</div>
			<div id="content_all">
			<div class="content_title">
				<span id="c_title_t">1. 육회덮밥</span>
			</div>
			<div class="content_title">
				<span id="c_title_t">2. 감자전</span>
				</div>
				<div class="content_title">
				<span id="c_title_t">3. 치킨</span>
		</div>
		<div class="content_title">
				<span id="c_title_t">4. 피자</span>
		</div>
			<div class="content_title">
				<span id="c_title_t">5. 김치찜</span>
		</div>
		 </div>
		 </div>
		<aside id="sidebar-right">오른</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
</body>
</html>