<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oops!</title>
<style type="text/css">
	.line{
	width: 100%;
		border: 5px solid tomato;
	}
	
	.up{
		margin-top: 100px;		
	}
	
	.down{
		float: left;
	}
		
	.oops_img{
		opacity: 0.5;
		display: flex;
		align-items: center;
		justify-content : center;
		
	}
	
	.img{
		width: 656px;
		height: 656px;
	}
	
	.left{width: 40%;
		float: left;
	}
	
	.right{width: 40%;
		float: right;
	}
	
	#error_con{
	width: 20%;
		font-size: 100px;
		text-align: center;
		float: left;
	}
</style>
</head>
<body>
	<div class="up line"></div>
	<div class="oops_img">
		<div class="left"><img src="/resources/images/icon_tomato_sad.png" class="img"></div>
		<div id="error_con">
			<span>Oops!</span>
			<span>500</span>
		</div>
		<div class="right"><img src="/resources/images/icon_tomato_sad_mir.png" class="img" style="float: right;"></div> 
	</div>
	<div class="down line"></div>
</body>
</html>