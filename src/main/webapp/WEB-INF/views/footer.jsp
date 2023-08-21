<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* footer */
#footer{
position: relative;
width: 1920px;
height: 330px;
}

/* 토마토색영역 부분 */

#footer_top{
position: absolute;
width: 1920px;
height: 280px;
left: 0px;
top: 0px;

background: tomato;
}


/* Since 부분 */
#footer_botton{
position: absolute;
width: 1920px;
height: 50px;
left: 0px;
top: 280px;

background: #FFFFFF;
}



/* 냠냠아이콘 */
#yamyam_icon{
position: absolute;
width: 150px;
height: 150px;
left: 125px;
top: 20px;
}

/* 냠냠레시피 로고 */
#yamyam_logo{
position: absolute;
width: 240px;
height: 90px;
left: 80px;
top: 170px;
}

/* 총레시피수 아이콘 */
#total_icon{
position: absolute;
width: 128px;
height: 128px;
left: 446px;
top: 53px;
}


/* 총 레시피수 텍스트 */
#total_text{
position: absolute;
width: 88px;
height: 17px;
left: 466px;
top: 190px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;

/* identical to box height */
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}

/* 총 레시피 수(숫자) */
#total_text_su{
position: absolute;
width: 55px;
height: 12px;
left: 492px;
top: 218px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 쉐프아이콘 */
#chef_icon{
position: absolute;
width: 128px;
height: 128px;
left: 683px;
top: 53px;
}

/* 총 냠냠’s쉐프 텍스트 */
#chef_text{
position: absolute;
width: 114px;
height: 17px;
left: 690px;
top: 190px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
/* identical to box height */
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 총 쉐프 수(숫자) */
#chef_text_su{
position: absolute;
width: 55px;
height: 12px;
left: 739px;
top: 218px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}


/* 비밀레시피 아이콘 */
#secret_rcp_icon{
position: absolute;
width: 128px;
height: 128px;
left: 918px;
top: 53px;
}



/* 냠냠’s쉐프들의 비밀레시피 수 */
#secret_rcp_text{
position: absolute;
width: 192px;
height: 17px;
left: 896px;
top: 190px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
/* identical to box height */
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 156 */
#secret_rcp_su{
position: absolute;
width: 55px;
height: 12px;
left: 974px;
top: 217px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 총 레시피 조회수 */
#view_icon{
position: absolute;
width: 128px;
height: 128px;
left: 1155px;
top: 53px;
}

/* 총 레시피 조회수 */
#view_icon_text{
position: absolute;
width: 117px;
height: 17px;
left: 1165px;
top: 190px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
/* identical to box height */
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 21260 */
#view_icon_su{
position: absolute;
width: 55px;
height: 12px;
left: 1200px;
top: 218px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}


/* visit_icon 1 */
#visit_icon{
position: absolute;
width: 128px;
height: 128px;
left: 1390px;
top: 53px;
}

/* 월 방문자수 */
#visit_icon_text{
position: absolute;
width: 88px;
height: 17px;
left: 1417px;
top: 190px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
/* identical to box height */
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 1024 */
#visit_icon_su{
position: absolute;
width: 55px;
height: 12px;
left: 1438px;
top: 218px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 대표 : 박채림 */
#company{
position: absolute;
width: 342px;
height: 138px;
left: 1566px;
top: 38px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;
display: flex;
align-items: center;

color: #FFFFFF;
}


/* 냠냠키친 Copyright 냠냠키친 Inc. All Rights Reserved */
#copyright{
position: absolute;
width: 283px;
height: 61px;
left: 1566px;
top: 184px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 14px;
line-height: 17px;

color: #FFFFFF;
}

/* The First Steps Since 2023 */
#since{
position: absolute;
width: 350px;
height: 50px;
left: calc(50% - 350px/2);
top: 280px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 29px;
display: flex;
align-items: center;
text-align: center;

color: #FF6347;
}

</style>
</head>
<body>
	<div id="footer">
		<div id="footer_top">
			<img id="yamyam_icon" src="/resources/images/icon_tomato_white_ver2_1.png">
			<img id="yamyam_logo" src="/resources/images/logo_white_yamyam.png">
			<img id="total_icon" src="/resources/images/total_recipe_icon.png">
			<span id="total_text">총 레시피수</span>
			<span id="total_text_su">1000</span>
			<img id="chef_icon" src="/resources/images/chef_icon.png">
			<span id="chef_text">총 냠냠's쉐프 수</span>
			<span id="chef_text_su">24</span>
			<img id="secret_rcp_icon" src="/resources/images/secret_recipe_icon.png">
			<span id="secret_rcp_text">냠냠’s쉐프들의 비밀레시피 수</span>
			<span id="secret_rcp_su">156</span>
			<img id="view_icon" src="/resources/images/view_icon.png">
			<span id="view_icon_text">총 레시피 조회수</span>
			<span id="view_icon_su">21260</span>
			<img id="visit_icon" src="/resources/images/visit_icon.png">
			<span id="visit_icon_text">월 방문자수</span>
			<span id="visit_icon_su">1024</span>
			<p id="company">
						대표 : 박채림<br>
						/ E : lCT@YamYamrecipe.com<br>
						/ F : 02) xxx-xxxx<br>
						서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)<br>
						문의전화(운영시간 평일 10:00~18:00)<br>
						광고문의 : 010-9986-3642<br>
						서비스 이용문의 : xxx-xxxx-xxxx
							</p>
			<p id="copyright">냠냠키친<br>
						Copyright <br>
						냠냠키친 Inc. All Rights Reserved<br>
							</p>
			</div>
		<div id="footer_bottom">
			<span id="since">The First Steps Since 2023</span>
		</div>
	</div>
</body>
</html>