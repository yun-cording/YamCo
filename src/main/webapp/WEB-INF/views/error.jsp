<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oops!</title>
<style type="text/css">
	#up_line{
		border-bottom: 10px solid tomato;
		margin-top: 125px;
	}
	
	#down_line{
		border-bottom: 10px solid tomato;
	}
		
	.oops_img{
		opacity: 0.5;
	}
	
	#left_img{
		width: 656px;
		height: 656px;
		float: left;
	}
	
	#right_img{
		width: 656px;
		height: 656px;
		float: right;
	}
	
	#error_con{
		font-size: 100px;
		align-items: center;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="up_line"></div>
	<div class="oops_img">
		<img src="/resources/images/icon_tomato_sad.png" id="left_img">
		<div id="error_con">
			<p>Oops!</p>
			<p>404</p>
		</div>
		<img src="/resources/images/icon_tomato_sad_mir.png" id="right_img"> 
	</div>
	<div id="down_line"></div>
</body>
</html>