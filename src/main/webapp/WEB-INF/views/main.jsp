<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

 #main{
        width: 1920px;
        margin:  auto;
		
    }
    


#sidebar-left {
	background-color: yellow;
	width: 15.625%;
	float: left;
	
}

#content {
	width: 68.75%;
	float: left;
	margin-top: 0px;
	background: snow;
}

 #sidebar-right {
	background-color: yellow;
	float: left;
	width: 15.625%;
	height: 100%;
}


#footer {
	left: 0px;
	width: 100%;
	clear: left;
}

#notice{
	padding-left: 30px;
	padding-top: 30px;
}

#notice_img{
 
	width: 900px;
	height: 300px;
	float: left;
	
}

#Recommen{
	width: 200px;
	height: 25px;
	margin-left: 70px;
	float: left;
}


#ingredient{
	padding-left: 50px;
	float: left;
}

#ingredient_img{
	width: 300px;
	height: 275px;
	float: left;
}

#new_yamyam {
	width: 1260px;
	height: 480px;
	margin-left:30px;
	margin-top: 60px;
	float: left;
	border-bottom: 2px solid #21730B;
}

#new_yamyam_title{
	
}

.flexContainer {
    width: 1320px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
} 


</style>
</head>
<body>
<div id="main">
		
		<jsp:include page="header.jsp" />
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
			<div id="notice">
			<img id="notice_img" src="/resources/images/logo.png">
			</div>
				<div id="Recommen"><span style="font-size: 22px;">오늘의 추천 재료</span></div>
				<div id="ingredient">
			<img id="ingredient_img" src="/resources/images/potatoes.png">
			</div>
			
			<div id="new_yamyam">
				<div id="new_yamyam_title"><span style="font-size: 40px;">최신 냠냠레시피</span></div>
			</div>
		</div>
		<aside id="sidebar-right">오른</aside>
		<div id="footer"><jsp:include page="footer.jsp" /></div>
		</div>
</body>
</html>