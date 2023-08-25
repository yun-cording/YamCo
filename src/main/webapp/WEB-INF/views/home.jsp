<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

 #mydiv{
        width: 1920px;
        margin:  auto;
		
    }
    
 #sidebar-right {
	background-color: yellow;
	float: left;
	width: 15.625%;
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
	background: white;
}


#footer {
	left: 0px;
	width: 100%;
	clear: left;
}

</style>
</head>
<body>
	<div id="mydiv">
		
		<jsp:include page="header.jsp" />
		<div id="test">
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		ddddd<br>
		</div>
		<aside id="sidebar-right">오른</aside>
		</div>
		<div id="footer"><jsp:include page="footer.jsp" /></div>
	</div>

</body>
</html>