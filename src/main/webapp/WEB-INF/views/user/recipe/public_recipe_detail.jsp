<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공공레시피 상세페이지</title>
<link rel="stylesheet" href="resources/css/user/recipe/public_recipe_detail.css?after" />
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
			<div id="upper">
			        <c:forEach var="item" items="${detail_list}">
				        <span class="category" class="text_center" style="color:#929292; 
						margin-left: 158px; 
						margin-top: 530px; 
						font-size: 20px;
						position:relative; top: 25px;">
							냠냠 레시피 > ${item.get("RCP_PAT2").asText()}
						</span>
					</c:forEach>
				<img src="resources/images/icon_tomato_ver2_1.png" style="width:30px; height:30px; margin-right:760px; position: relative; top: 35px; left: 30px;">
				<span id="rcp_score" class="text_center" style="color:#929292; margin-right: 850px; font-size: 20px; float:right;">${rcp_score}4.9</span>
				<br>
					<c:forEach var="item" items="${detail_list}">
						<img id="main_img" src="${item.get("ATT_FILE_NO_MAIN").asText()}" >
					</c:forEach>
					
				<img src="resources/images/ingredient.png" style="width:135px; height:135px; position: absolute; margin-left: 80px; top: 425px;">
				<span style="margin-left: 115px; font-size:32px; position: relative; top: -80px;"><strong>재료</strong></span>
				<div id="ingredients" style=" margin-left: 785px; margin-bottom: 60px; width: 400px; height: 250px;">
					<c:forEach var="item" items="${detail_list}">
				        <p id="ing_dets">
							${item.get("RCP_PARTS_DTLS").asText()}
						</p>
					</c:forEach>
				</div>
				<div class="horizontal-line"></div>
			</div>
				
				<div id="upper2">
					<c:forEach var="item" items="${detail_list}">
				        <div id="title">
							${item.get("RCP_NM").asText()}
						</div>
					</c:forEach>
					<div id="lower_images">
						<img class="lower_images" src="resources/images/hashtag.png" style="margin-left: 138px;">
						<img class="lower_images" src="resources/images/heart.png" style="margin-left: 45px;">
						<img class="lower_images" src="resources/images/black_heart.png" style="margin-left: 45px; display:none;">
						<img class="lower_images" src="resources/images/tableware.png" style="margin-left: 45px;">
						<!-- 이미지가 검은하트 or 빨간 하트 -->
						
							<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
								<!-- span은 쓰레기다 -->
								<c:forEach var="item" items="${detail_list}">
							        <p id="ing_dets">
										<p class="lower_text" style="margin-left: 107px; width: 100px; height: 40px; text-align: center;"># ${item.get("HASH_TAG").asText()}
									</p>
								</c:forEach>
								
								<!-- <textarea rows="2" cols="10" style="margin-left: 154px;">asdasdaksdhakjsdhkjshfkjshfkjashdkjhaskd</textarea> -->
							</div>
							<%-- ${wvo.likeornot} --%>
							<div style="height: 1px;">
								<span class="lower_text" style="margin-left: 267px; position: relative; top: -40px;">찜리스트에 추가</span>
									<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
										<!-- span은 쓰레기다 (p 대신 쓰면 글자가 첫줄에서 왼쪽 뻥 띄우고 시작함) -->
										<c:forEach var="item" items="${detail_list}">
											<p id="howto_cook" class="lower_text">${item.get("RCP_PAT2").asText()}</p>
										</c:forEach>
									</div>
							</div>
				
						<p style="margin-top: 20px;">
							<img class="lower_images" src="resources/images/icon_tomato_white_ver2_1.png"  style="margin-left: 138px;">
							<img class="lower_images" src="resources/images/steam.png"  style="margin-left: 45px;">
						</p>
						<p style="margin-top: 10px;">
						<div style="width: 100px; height: 40px; margin-left: -30px; text-align: center; margin-top: 10px;">
							<p id="writer_nick" class="lower_text">냠냠레시피</p>
						</div>
						<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
							<c:forEach var="item" items="${detail_list}">
								<p id="cook_category" class="lower_text">${item.get("RCP_WAY2").asText()}</p>
							</c:forEach>
						</div>
					</div>
					<div id="tip">
						<img src="resources/images/light-bulb.png" style="width:135px; height:135px; position: absolute; margin-left: 565px; top: 825px;">
						<span style="margin-left: 574px; font-size:32px; position: relative; top: -200px;"><strong>요리 tip</strong></span>
						<div id="rcp_tip">
							<c:forEach var="item" items="${detail_list}">
								<p id="recipe_tip" class="font_size_24">
									${item.get("RCP_NA_TIP").asText()}
								</p>
							</c:forEach>
						</div>
					</div>
					<div class="horizontal-line" style="margin-top: -20px;"></div>
				</div>
				
				<!-- 공공데이터 본문 -->
				<div>
					<!-- 영양정보 -->
					<div id="nutrition" style="margin-top: 430px;">
						<img src="resources/images/nutrition.png" style="width:135px; height:135px; position: relative; margin-left: 565px; top: -300px;">
						<span style="font-size:32px; position: relative; top: -220px; left-margin: -100px; left: -142px;"><strong>영양정보</strong></span>
						<div style="width: 400px; height: 230px; text-align: center; margin-left: 780px; margin-top: -280px; position: relative; top : -170px;">
							<c:forEach var="item" items="${detail_list}">
									<p style="font-size: 32px;"><strong>총 열량 : ${item.get("INFO_ENG").asText()}kcal</strong></p>
									<p style="font-size: 32px;"><strong>나트륨 : ${item.get("INFO_NA").asText()}mg</strong></p>
									<p style="font-size: 32px;"><strong>탄수화물 : ${item.get("INFO_CAR").asText()}g</strong></p>
									<p style="font-size: 32px;"><strong>단백질 : ${item.get("INFO_PRO").asText()}g</strong></p>
									<p style="font-size: 32px;"><strong>지방 : ${item.get("INFO_FAT").asText()}g</strong></p>
							</c:forEach>
						</div>
						<div class="horizontal-line_gray" style="margin-top: -170px; position: relative; top: 80px; border-top: 2px solid #21730B;"></div>
					</div>
					<!-- 본문 -->
					<div style="margin-top: 0px; margin-bottom: 100px;">
						<img src="resources/images/cooking.png" style="width:135px; height:135px; position: relative; margin-left: 565px; top:-550px; margin-top: 600px;">
						<span style="font-size:32px; position: relative; top: -500px; left-margin: -100px; left: -142px;"><strong>조리 과정</strong></span>
						<div style="text-align:center; margin-top: 500px;">
							<%-- <c:forEach var="k" begin="1" end="5">
								<div style="margin-top: -100px; position:relative; left: -500px;">
									<img id="cook_det_img" src="MANUAL_IMG0${k}">
									<!-- 조리방법 -->
									<div style="margin-left: 1100px; position: relative; top: -400px; width: 470px; height: 200px;">
									<c:forEach var="item" items="${detail_list}" varStatus="loop">
									        <c:if test="${not empty item['MANUAL' + (loop.index < 10 ? '0' + loop.index : loop.index)]}">
									            <p style="font-size: 14px;">${item.get('MANUAL0' + String.valueOf(k)).asText()}</p>
										    </c:if>
									</c:forEach>
									
										<c:if test="${k == 3}">
										
										</c:if>
										<div class="horizontal-line_gray" style="position: relative; top: 380px;"></div>
									</div>
										
									</c:forEach>
									
										<c:if test="${k == 3}">
										
										</c:if> --%>
										<%-- <img id="cook_det_img" src="MANUAL_IMG0${k}"> --%>
										
								<div id="detailed_info">
									<div style="margin-left: 1300px; margin-bottom: 200px; position: relative; top: -600px; width: 470px; height: 200px; left: -1500px; ">
										<div style="font-size: 14px;"><img id="cook_det_img" src="${pDetailVO.manualImg01}" /></div>
										<div style="font-size: 14px; position: relative; top: -400px; left:800px;">${pDetailVO.manual01}</p>
									</div>
									<div style="margin-left: 1100px; margin-bottom: 200px; position: relative; top: 100px; width: 470px; height: 200px; left: -1100px; ">
										<div style="font-size: 14px;"><img id="cook_det_img" src="${pDetailVO.manualImg02}" /></p>
										<div style="font-size: 14px; position: relative; top: -400px; left:900px; text-align:center;">${pDetailVO.manual02}</p>
									</div>
									<div style="margin-left: 1100px; position: relative; top: 50px; left: -900px; width: 470px; height: 200px;">
										<p style="font-size: 14px;"><img id="cook_det_img" src="${pDetailVO.manualImg03}" /></p>
										<p style="font-size: 14px; position: relative; top: -400px; left:900px; ">${pDetailVO.manual03}</p>
									<div style="margin-left: 1100px; position: relative; top: -400px; width: 470px; height: 200px;">
										<p style="font-size: 14px;"><img id="cook_det_img" src="${pDetailVO.manualImg04}" /></p>
										<p style="font-size: 14px;">${pDetailVO.manual04}</p>
									<div style="margin-left: 1100px; position: relative; top: -400px; width: 470px; height: 200px;">
										<p style="font-size: 14px;"><img id="cook_det_img" src="${pDetailVO.manualImg05}" /></p>
										<p style="font-size: 14px;">${pDetailVO.manual05}</p>
									</div>
										
										<div class="horizontal-line_gray" style="position: relative; top: 380px;"></div>
									</div>
								</div>
							</div>
							<%-- </c:forEach> --%>
							
														
						</div> 
					</div>
					<!-- 주의 문구 -->
					<div style="margin-left: 400px; margin-bottom: 50px; color:gray; position: relative; top: -490px; margin: auto; text-align: center;">
						<span style="text-align: center; margin-bottom: 50px;">(* 표시되는 정보는 식약처에서 제공하는 공공데이터에 근거하며, 일부 자료의 경우 오류가 포함되어 있을 수 있습니다.)</span>
					</div>
				</div>
					
				<!-- 수정, 삭제버튼, 신고 -->				
				<div id="revise_delete_btn" style="margin: auto; text-align: center;">
					<div class="horizontal-line_gray" style="margin-top: -560px; margin-bottom: 20px; position: relative; top: 80px; bottom: -50px;"></div>
					<!-- 신고하기 -->
					<p></p>
				</div>
				
				<!-- 이런 레시피는 어떠세요? 추천 -->
				<div style="text-align: center; margin-top: 125px; margin-bottom: 30px;">
					<!-- <button class="round_btn" id="howabout" style="background-color: tomato; color:white; width: 600px; height: 100px; font-size: 32px; border-radius: 15px;"></button> -->
					<span style="color: tomato; font-size: 40px; margin-top: 30px; margin-bottom: 20px;"><strong>이런 레시피는 어떠세요?</strong></span>
				</div>
				
				<!-- 추천 게시물 -->
				<img class="left_arrow" style="margin-top: -200px; margin-left: 30px; position: relative; top: -130px;" src="resources/images/arrow_down.png">
				<img class="how_about_imgs" src="resources/images/public_sample2.png">
				<img class="how_about_imgs" src="resources/images/public_sample2.png">
				<img class="how_about_imgs" src="resources/images/public_sample2.png">
				<img class="right_arrow" style="margin-top: -200px; position: relative; top: -150px; margin-left: 1225px;" src="resources/images/arrow_down.png">
				<p>
				<div style="margin-left:120px; width: 310px; height: 80px; text-align: center; float: left; font-size: 24px;"><strong>요리이름1</strong></div>
				<div style="margin-left:75px; width: 310px; height: 80px; text-align: center; float: left; font-size: 24px;"><strong>요리이름1</strong></div>
				<div style="margin-left:75px; width: 310px; height: 80px; text-align: center;  float: left; font-size: 24px;"><strong>요리이름1</strong></div>
				</p>

				<div class="horizontal-line_gray" style="margin-top: 10px; position: relative; top: 70px;"></div>
				<!-- 댓글 및 리뷰 글자 -->
				<div style="width: 300px; height: 150px; ">
					<!-- <button class="round_btn"  id="content_review_btn" style="background-color: tomato; margin-left: 30px; margin-top: 130px; color:white; width: 290px; height: 85px; font-size: 32px; border-radius: 15px;"></button> -->
					<span style="width: 300px; height: 150px; font-size: 32px; color: tomato; position:relative; margin-left: 80px; top: 70px;"><strong>댓글 및 리뷰</strong></span>
				</div>
					
				<!-- 긁어온 별점 -->
				 <div class="rate magnify" id="magnify" style="margin-top: 70px; margin-left: 80px;">
				    <input type="radio" id="star5" name="rate" value="5" />
				    <label for="star5" title="text">5 stars</label>
				    <input type="radio" id="star4" name="rate" value="4" />
				    <label for="star4" title="text">4 stars</label>
				    <input type="radio" id="star3" name="rate" value="3" />
				    <label for="star3" title="text">3 stars</label>
				    <input type="radio" id="star2" name="rate" value="2" />
				    <label for="star2" title="text">2 stars</label>
				    <input type="radio" id="star1" name="rate" value="1" />
				    <label for="star1" title="text">1 star</label>
				  </div>
				
				
				<!-- 댓글 입력 -->
				<div>
					<form style="margin-top: -20px;" action="/action_page.php">
					  <textarea id="content-textarea" placeholder="댓글을 입력하세요." style="height: 180px;"></textarea>
						<button class="round_btn" style="background-color: tomato; color:white; width: 120px; height: 50px; font-size: 24px; margih-left: 1260px; position: relative; top: -270px;">사진추가</button>
						<p></p>
						<button style="background-color: lightgray; width: 120px; height: 120px; font-size: 16px; margin-left: 1175px; position:relative; top: -260px; border:none; border-radius: 5px;">이미지 미리보기</button>
						<p></p>
						<button class="round_btn" style="background-color: tomato; color:white; width: 80px; height: 50px; font-size: 24px; margin-left: 980px; position:relative; top: -250px;">작성</button>
						<p></p>
						<button class="round_btn" style="background-color: lightgray; color:white; width: 80px; height: 50px; font-size: 24px; margin-left: 1070px; position: relative; top: -300px;">취소</button>
					  <br>
					  <!-- <input type="submit" value="Submit" style="top: -50px;"> -->
					</form>
				</div>
				
				<!-- 댓글 표시 -->
				<div style="margin-top: -200px;">
						<button class="align_order">인기순</button>
						<button class="align_order" style="position: relative; right: -20px;">최신순</button>
					<div style="margin-bottom: 10px;">
					</div>
					<br>
					<button class="best_comment" style="disable: enabled; margin-bottom: 50px; margin-top: 10px; margin-left: 1165px;">정렬순서</button>
					<div class="horizontal-line_tomato" style="margin-top: -20px; margin-bottom: 20px;"></div>
					<c:forEach begin="1" end="10">
					<div>
						<p style="margin-left: 80px; font-size: 28px; margin-bottom: 45px; width: 200px; height: 75px; text-align: center;">${urvo.m_nick}이한주 이두주 이세주 이네주 님</p>
						<p><button class="best_comment" style="margin-left: 115px;">베스트 댓글</button>
						<p style="width: 200px; height: 50px; text-align: center; font-size: 24px; margin-left: 80px; margin-top: 30px;">${cvo.c_time}23/08/22 13:22</p>
						<div>
							<img class="comment_img" src="resources/images/public_sample1.png">
							<div style="float:left; margin-left: 600px; width: 600px; height: 250px; margin-top : -430px; text-align: left;">
								<span class="comment_content" style="font-size: 16px; text-align: left;">${cvo.c_contents}텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당텍스트당</span>						
							</div>
							<button style="margin-top: -450px; width: 40px; height: 10px; float:right; margin-right : 30px; background-color: #ffffff; color:#ffffff; outline: none; border: none;">
								<!-- <img src="resources/images/three_dots.png" style="width: 40px; height: 10px;"> -->
							</button>
							<p></p>
							<br>
							<br>
							<div>
							</div>
							<!-- 신고버튼, 따봉 -->
							<div style="position: relative; top: -290px; left: 15px;">
								<!-- <input type="button" class="report-button" style="float: right; margin-right: 100px; outline:none;" onclick="alert('님 신고!')"> -->
								<button style="float: right; position:relative; top: -200px; left: -43px; border: none; background-color: #ffffff;">
									<p style="height: 15px; float: right;  color:#cccccc">신고하기</p>
								</button>
								<!-- 따봉 버튼 (좋아요) -->
								<button style="float: right; width: 44px; height: 44px; border: none; background-color:#ffffff; margin-left: 170px; position: relative; left: -50px;">
									<img src="resources/images/thumbs-up.png" style="width: 44px; height: 44px; ">
								</button>
								<div style="width: 40px; height: 20px; float: right; margin-right: -2px; ">
									<p style="height: 15px; float: right; color: tomato; font-size: 20px; text-align: center; position:relative; top: 52px; right: -155px;"><strong>${cvo.c_like}553</strong></p>
								</div>
								<div style="margin-bottom: 10px; position:relative; left: 288px;">
									<button class="align_order" style="position: relative; top: 20px;" >수정</button>
								</div>
								<div style="position: relative; right: 30px; bottom: 30px;"></div>
								<div style="margin-bottom: 10px; position:relative;  right: -368px; bottom: -50px;">
									<button class="align_order">삭제</button>
								</div>
							</div>
						</div>
						<div class="horizontal-line_tomato" style="margin-top : -200px; margin-bottom: 20px;"></div>
					</div>
					</c:forEach>
					<!-- 댓글 더보기 -->
					<div style="margin: auto; text-align: center; margin-top: 20px;">
						<button class="report_button" style="width: 100px; height: 50px; margin-top: 20px; border:none; border-radius:5px; background-color: tomato; font-size: 24px; color:white; margin: auto;">더보기</button>
					</div>							
				</div>
			
		
		<!-- content 끝 -->		
		</div>
		
		<aside id="sidebar-right">오른</aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
		</div>
	</div>
</body>
	
</html>