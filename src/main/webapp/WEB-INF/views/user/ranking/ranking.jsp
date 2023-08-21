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

#mydiv {
	position: relative; 
  width : 1920px;
	height: 2000px; 
  left : 0px; 
  top : 0px;
	margin: auto;
	width: 1920px; 
  height : 2000px;
	left: 0px;
	top: 0px;
}

/* Rectangle 4225 */
/* #body{
	position: absolute;
	width: 1320px;
	height: 1430px;
	left: 300px;
	top: 230px;
  text-align: center;
	background: #FFFFFF;

} */

#sidebar-right {
	background-color: yellow;
	float: right;
	width: 15.625%;
	height: 100%;
}

#sidebar-left {
	background-color: yellow;
	width: 15.625%;
	height: 100%;
	float: left;
}

#content {
	width: 68.75%;
	height: 100%;
	float: left;
	margin-top: 0px;
	background: snow;
}

#footer {
	background-color: #333;
	left: 0px;
	color: #fff;
	text-align: center;
	width: 100%;
	height: 300px;
	clear: left;
}

#test {
	width: 100%;
	height: 1500px;
}

#topline {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 1060px;
	height: 106px;
	left: calc(50% - 1060px/ 2);
	top: 348px;
	border-bottom: 3px solid #21730B;
}

#lrecipe {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 110px;
	height: 54px;
	left: 430px;
	top: 375px;
	border: 2px solid #FF6347;
}

#lsearch {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 110px;
	height: 54px;
	left: 539px;
	top: 375px;
	background: #FF6347;
	border: 2px solid #FF6347;
}

#toptext {
	position: absolute;
	width: 203px;
	height: 48px;
	left: calc(50% - 203px/ 2 + 0.5px);
	top: 370px;
	font-family: 'BM HANNA_TTF';
	font-style: normal;
	font-weight: 400;
	font-size: 48px;
	line-height: 48px;
	display: flex;
	align-items: center;
	text-align: center;
}

#today {
	box-sizing: border-box;
	position: absolute;
	width: 95px;
	height: 54px;
	left: 1206px;
	top: 474px;
	border: 2px solid #FF6347;
}

#week {
	box-sizing: border-box;
	position: absolute;
	width: 96px;
	height: 54px;
	left: 1301px;
	top: 474px;
	border: 2px solid #FF6347;
}

#month {
	box-sizing: border-box;
	position: absolute;
	width: 95px;
	height: 54px;
	left: 1397px;
	top: 474px;
	background: #FF6347;
	border: 2px solid #FF6347;
}
.todaytext{
font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
font-size: 24px;
line-height: 54px;
text-align: center;
display: block;
align-items: center;
color: #000000;
}

#searchtext{
  text-align: center;
  font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
  font-size: 24px;
line-height: 54px;
display: block;
color: #FFFFFF;
}

#recipetext{
  text-align: center;
  font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
  font-size: 24px;
  line-height: 54px;
display: block;
}

#search_rankingtext{
position: absolute;
width: 240px;
height: 48px;
left: calc(50% - 203px/2 + 0.5px);
top: 370px;
font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
font-size: 48px;
line-height: 48px;
display: flex;
align-items: center;
text-align: center;
color: #000000;
}

.keywardLineClass{
  width: 280px;
  height: 59px;
  border-bottom: 2px solid #21730B;
}

#keyward1{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 580px;
}

#keyward2{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 669px;
}

#keyward3{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 758px;
}

#keyward4{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 847px;
}

#keyward5{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 936px;
}

#keyward6{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 1025px;
}

#keyward7{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 1114px;
}

#keyward8{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 1203px;
}

#keyward9{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 1292px;
}

#keyward10{
box-sizing: border-box;
position: absolute;
left: 430px;
top: 1381px;
}

#keyward11{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 580px;
}

#keyward12{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 669px;
}

#keyward13{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 758px;
}

#keyward14{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 847px;
}

#keyward15{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 936px;
}

#keyward16{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 1025px;
}

#keyward17{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 1114px;
}

#keyward18{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 1203px;
}

#keyward19{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 1292px;
}

#keyward20{
box-sizing: border-box;
position: absolute;
left: 820px;
top: 1381px;
}

#keyward21{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 580px;
}

#keyward22{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 669px;
}

#keyward23{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 758px;
}

#keyward24{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 847px;
}

#keyward25{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 936px;
}

#keyward26{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 1025px;
}

#keyward27{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 1114px;
}

#keyward28{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 1203px;
}

#keyward29{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 1292px;
}

#keyward30{
box-sizing: border-box;
position: absolute;
left: 1212px;
top: 1381px;
}

.keywardtextclass{
  width: 260px;
  height: 20px;
  color: #000000;
  font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 20px;
color: #000000;
}

#keywardtext1{
position: absolute;
left: 430px;
top: 614px;
}

#keywardtext2{
  position: absolute;
left: 430px;
top: 703px;
}

#keywardtext3{
  position: absolute;
left: 430px;
top: 792px;
}

#keywardtext4{
  position: absolute;
left: 430px;
top: 881px;
}

#keywardtext5{
  position: absolute;
left: 430px;
top: 970px;
}

#keywardtext6{
  position: absolute;
left: 430px;
top: 1059px;
}

#keywardtext7{
  position: absolute;
left: 430px;
top: 1148px;
}

#keywardtext8{
  position: absolute;
left: 430px;
top: 1237px;
}

#keywardtext9{
  position: absolute;
left: 430px;
top: 1326px;
}

#keywardtext10{
  position: absolute;
left: 430px;
top: 1415px;
}

#keywardtext11{
  position: absolute;
left: 820px;
top: 614px;
}

#keywardtext12{
  position: absolute;
left: 820px;
top: 703px;
}

#keywardtext13{
  position: absolute;
left: 820px;
top: 792px;
}

#keywardtext14{
  position: absolute;
left: 820px;
top: 881px;
}

#keywardtext15{
  position: absolute;
left: 820px;
top: 970px;
}

#keywardtext16{
  position: absolute;
left: 820px;
top: 1059px;
}

#keywardtext17{
  position: absolute;
left: 820px;
top: 1148px;
}

#keywardtext18{
  position: absolute;
left: 820px;
top: 1237px;
}

#keywardtext19{
  position: absolute;
left: 820px;
top: 1326px;
}

#keywardtext20{
  position: absolute;
left: 820px;
top: 1415px;
}

#keywardtext21{
  position: absolute;
left: 1212px;
top: 614px;
}

#keywardtext22{
  position: absolute;
left: 1212px;
top: 703px;
}

#keywardtext23{
  position: absolute;
left: 1212px;
top: 792px;
}

#keywardtext24{
  position: absolute;
left: 1212px;
top: 881px;
}

#keywardtext25{
  position: absolute;
left: 1212px;
top: 970px;
}

#keywardtext26{
  position: absolute;
left: 1212px;
top: 1059px;
}

#keywardtext27{
  position: absolute;
left: 1212px;
top: 1148px;
}

#keywardtext28{
  position: absolute;
left: 1212px;
top: 1237px;
}

#keywardtext29{
  position: absolute;
left: 1212px;
top: 1326px;
}

#keywardtext30{
  position: absolute;
left: 1212px;
top: 1415px;
}

a{
  text-decoration: none;
}

@font-face {
    font-family: 'BM HANNA_TTF';
    src: url('../resources/fonts/BMHANNA_11yrs_ttf.ttf') format('truetype');
}

</style>
</head>
<body>
	<div id="mydiv">
    <jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">왼쪽</aside>

				<div id="lrecipe"><span id="recipetext">레시피</span></div>
				<dlv id="lsearch"><span id="searchtext">검색어</span></dlv>
				<div id="topline"></div>
        <div id="search_rankingtext">검색어랭킹</div>
				
				<div id="today"><span class="todaytext">일간</span></div>
				<div id="week"><span class="todaytext">주간</span></div>
				<div id="month"><span class="todaytext">월간</span></div>
		
		
		<c:forEach var="k" begin="1" end="30">
        <div id="keywardtext${k }" class="keywardtextclass"><a href="">${k }.</a></div>
        <div id="keyward${k }" class="keywardLineClass"></div>   
		</c:forEach>

			<aside id="sidebar-right">오른</aside>
		</div>

		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>

	</div>

</body>
</html>