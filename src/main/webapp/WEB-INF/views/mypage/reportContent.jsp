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

.title{
	color: #606060;
	text-align: center;
	margin-top: 60px;
	font-size: 24px;
}

button{
	 font-family: 'Yeongdeok_TTF';
	 font-size: 16px;
	 width: 80px;
	 height: 30px;
	 background-color: white;
	 border: 2px solid tomato;
	 float: left;	 
}

.btn button:first-child{
	background-color: tomato;
	color: white;
}

.btn button:last-child:hover{
	background-color: tomato;
	color: white;
	cursor: pointer;
}

.btn{
	float: right;
	margin-top: -50px;
}

.r_title{
	box-sizing: border-box;
	width: 1260px;
	height: 80px; 
	margin-left: 30px;
	margin-right: 30px;
		
	border-left: 20px solid ;
	border-bottom: 3px solid ;
	border-color: tomato;
	margin-top: 40px;
}

.arrow{
	float: right;
	padding-bottom: 20px;
	margin-right: 30px;
}

.arrow:hover {
	cursor: pointer;
}

#r_title_t{	
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.answer{
	font-size: 30px;
	text-align: center;
	display: none;  
	 	
	box-sizing: border-box;
	
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 50px;
	padding-top: 17px;
	width: 1260px;
	height: 300px;
	
	font-weight: 400;
	line-height: 40px;
	
	color: tomato;
	
	border-bottom: 3px solid tomato;
	align-items: center;
	justify-content: center;
}

.r_type{
	margin: auto;
	float: right;
	margin-top: 25px;
}

.row_append {
	margin: 10px auto;
	padding: 10px;
	width: calc(30% - 20px);
	border: 3px solid tomato;
	border-radius: 30px;
	text-align: center;
	color: tomato;
	cursor: pointer;
}

.rqa {
	display: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var arrowDown = "/resources/images/arrow_down.png"; //아래 화살표 이미지
		var arrowUp = "/resources/images/arrow_up.png"; //위 화살표 이미지
		var loop = 0; //반복 단위 step
		
		/* 화살표 버튼을 누르면 실행됨 */
		$(".arrow").on("click", function() {
			var answer = $(this).closest(".r_title").next();
			if ($(this).attr("src") === arrowUp) {
				//지금 위 화살표이면 answer 내용 숨기고 아래 화살표로 바꿈
				answer.fadeOut(400);
				$(this).attr("src", arrowDown);
			} else {
				//지금 아래 화살표이면 answer 내용 나타내고 위 화살표로 바꿈
				answer.fadeIn({
					direction : "top"
				});
				answer.attr("style", "display : flex;");
				$(this).attr("src", arrowUp);
			}
		});

		//페이지가 처음 로딩되었을 때 rqa div를 loop +  1개 노출시킴
		if ($(".rqa:hidden").length > loop) {
			$(".rqa:hidden").slice(0, loop + 1).show();
			if ($(".rqa:hidden").length < 1) { //숨겨져있는 qa div가 없으면 더보기 버튼 숨김
				$(".row_append").hide();
			}
		} else { //loop + 1개 보다 qa div 개수가 적으면 모두 노출시키고 더보기 버튼 숨김
			$(".rqa:hidden").show();
			$(".row_append").hide();
		}

		//더보기 버튼 클릭할 때마다 rqa div를 loop + 1개 노출시킴
		$(".row_append").on("click", function() {
			if ($(".rqa:hidden").length > loop) {
				$(".rqa:hidden").slice(0, loop + 1).show();
				if ($(".rqa:hidden").length < 1) {
					$(".row_append").hide();
				}
			} else {
				$(".rqa:hidden").show();
				$(".row_append").hide();
			}
		});
		
		/* 
		var i=0;
		$("#a_1").on("click", function() {
			if(i++%2 == 0){
				$("#a1").fadeOut(400);					
				$("#a_1").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a1").fadeIn({direction : "top"});
				$('#a1').attr("style", "display : flex;");
				$("#a_1").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_2").on("click", function() {
			if(i++%2 == 0){
				$("#a2").fadeOut(400);			
				$("#a_2").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a2").fadeIn({direction : "top"});	
				$('#a2').attr("style", "display : flex;");
				$("#a_2").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_3").on("click", function() {
			if(i++%2 == 0){
				$("#a3").fadeOut(400);					
				$("#a_3").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a3").fadeIn({direction : "top"});	
				$('#a3').attr("style", "display : flex;");
				$("#a_3").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_4").on("click", function() {
			if(i++%2 == 0){
				$("#a4").fadeOut(400);					
				$("#a_4").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a4").fadeIn({direction : "top"});	
				$('#a4').attr("style", "display : flex;");
				$("#a_4").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_5").on("click", function() {
			if(i++%2 == 0){
				$("#a5").fadeOut(400);				
				$("#a_5").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a5").fadeIn({direction : "top"});	
				$('#a5').attr("style", "display : flex;");
				$("#a_5").attr("src","/resources/images/arrow_up.png");
			}			
		});
		*/
		
	$("#write_com").on("click", function() {
			$("#write_com").attr("style", "background-color : tomato; color : white;");
			$("#write_con").attr("style", "background-color : white; color : black;");
			location.href = "/reportcomment.do";
	});
	});
</script>
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
					<a href="/myinfo.do"><li id="info_first">내 정보</li></a>
					<a href="/mywishlist.do"><li id="info">찜 목록</li></a>
					<a href="/reportcontent.do"><li id="info">신고 내역</li></a>
					<a href="/mycontent.do"><li id="info">내가 쓴 게시글</li></a>
					<a href="/mycomment.do"><li id="info_end">내가 쓴 댓글</li></a>
				</ul>
			</div>
			<div class="title_line"></div>			
			<div class="title">
				<h2>게시글 신고 내역</h2>
			</div>
			<div class="btn">
				<button id="write_con">게시글</button>
				<button id="write_com">댓글</button>
			</div>
				<c:choose>
					<c:when test="${not empty reportList}">
						<c:forEach items="${reportList}" var="k" varStatus="vs">
							<div class="rqa">
								<div class="r_title">
									<span id="r_title_t">${k.u_rcp_title }</span>
									<div>
										<img class="arrow"
											src="/resources/images/arrow_down.png">
									</div>
									<div class="r_type">
										<span>${k.r_type }</span>
									</div>
								</div>
								<div class="answer" >
									<c:choose>
										<c:when test="${k.u_rcp_status == 3 }"> <%-- 신고된 게시글이 블라인드된 경우 --%>
											<p>현재 블라인드 처리된 게시물입니다. 이용에 불편을 드려 죄송합니다.</p>
										</c:when>
										<c:when test="${k.u_rcp_status == 1 }"> <%-- 신고된 게시글이 삭제된 경우 --%>
											<p>현재 삭제된 게시물입니다. 이용에 불편을 드려 죄송합니다.</p>
										</c:when>
										<c:when test="${k.r_answer != null}"> <%-- 답변내용이 있는 경우 --%>
										<p>${k.r_answer}</p>
										</c:when>
										<c:when test="${k.r_status == 1 }"> <%-- 신고내역 확인 후 답변하지 않은 경우 --%>
											 <p>신고 내역 확인중 입니다. 이용에 불편을 드려 죄송합니다.</p>
										</c:when>
										<c:otherwise> <%-- 신고내역 확인하지 않은 경우 --%>
											 <p>신고 내역 확인 후 답변드리겠습니다. 이용에 불편을 드려 죄송합니다.</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2>신고내역이 존재하지 않습니다.</h2>
					</c:otherwise>
				</c:choose>
				<%-- 1 대신 step 단위 입력할 것 --%>
				<c:if test="${reportList.size() > 1 }">
					<div class="row_append">
						<h2 class="r_title_t">더보기</h2>
					</div>
				</c:if>
		 </div>
		<aside id="sidebar-right">
			<jsp:include page="../bestlist.jsp" />
		</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
</body>
</html>
	