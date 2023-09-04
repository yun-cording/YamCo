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
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script> -->

</head>


<!-- JavaScript 코드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // "작성" 버튼 클릭 시 이벤트 핸들러
        $("#comment_write_do").click(function (e) {
            e.preventDefault(); // 기본 폼 제출 동작 방지
            
            var mNick = '<%= session.getAttribute("m_nick") %>'; // JSP 코드로부터 m_nick 값을 가져옴
        	
            // m_nick 값이 없는 경우(alert를 띄워야 하는 경우)
            if (mNick =="null" || mNick === "null" || mNick == null || mNick === null || mNick === undefined || mNick == undefined || mNick == "" || mNick === "") {
            	console.log("아디 없다!");
                var result = confirm("로그인이 필요합니다. 계속하시겠습니까?");
                if (result) {
                    window.location.href = "/go_login.do";
                } else {
                	
                }
            }else{
            	/* alert("아이디 있고 " + mNick); */
            }

            // Form 데이터 추출
            // 세가지 다 넣어야 들어간다.
            var formData = new FormData();
            var rateValue = $("input[name='rate']:checked").val();
            var commentValue = $("#content-textarea").val();
            var imageFile = $("#imgUpload")[0].files[0];
            formData.append("rate", $("input[name='rate']:checked").val());
            formData.append("comment", $("#content-textarea").val());
            formData.append("image", $("#imgUpload")[0].files[0]); // 파일 업로드
			
            // 값 콘솔에 출력
  		    console.log("rate: " + rateValue);
            console.log("comment: " + commentValue);
            console.log("image: ", imageFile);

            // AJAX 요청
            $.ajax({
                url: "/comment_write.do", // 컨트롤러 엔드포인트 URL
                type: "POST", // POST 요청
                data: formData,
                processData: false, // 데이터를 처리하지 않음
                contentType: false, // 컨텐츠 타입 설정하지 않음
                success: function (response) {
                    // 성공적으로 처리된 경우
                    console.log("데이터 전송 성공");
                    alert("댓글 작성 성공!");
                    $("#content-textarea").val(""); // textarea 내용을 빈 문자열로 설정
                },
                error: function () {
                    // 오류 발생 시 처리
                    console.error("데이터 전송 실패");
                    alert("댓글 작성 실패!");
                    // 오류 처리 로직 추가
                },
            });
        });
    });
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    // 페이지 로드 완료 후에 실행될 코드
	
    var contentTextarea = document.getElementById("content-textarea");
    if (contentTextarea) {
        contentTextarea.addEventListener("click", function () {
            // 서버에서 session에서 m_nick 값을 가져오는 방법은 여기서 생략합니다.
            // 서버에서 가져온 m_nick 값을 변수에 할당합니다. (예시로 "m_nick"이라 가정)

           	console.log("아디 첵");
            var mNick = '<%= session.getAttribute("m_nick") %>'; // JSP 코드로부터 m_nick 값을 가져옴
	
            // m_nick 값이 없는 경우(alert를 띄워야 하는 경우)
           if (mNick =="null" || mNick === "null" || mNick == null || mNick === null || mNick === undefined || mNick == undefined || mNick == "" || mNick === "") {
            	console.log("아디 없다!");
                var result = confirm("로그인이 필요합니다. 계속하시겠습니까?");
                if (result) {
                    window.location.href = "/go_login.do";
                } else {
                	
                }
            }else{
            	/* alert("아이디 있고 " + mNick); */
            }
        });
    }
});
</script>



<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div id="upper">
			        <c:forEach var="item" items="${detail_list}">
				        <span class="category text_center" id="title_field">
							냠냠 레시피 > ${item.get("RCP_PAT2").asText()}
						</span>
					</c:forEach>
				<img src="resources/images/icon_tomato_ver2_1.png" id="little_tomato" style="height: 30px; width: 30px;">
				<span id="rcp_score" class="text_center" style="color:#929292; margin-right: 850px; font-size: 20px; float:right;">${avg_rating}</span>
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
						<!-- 이미지가 검은하트 or 빨간 하트 -->
						<c:if test="${liked_ornot == null}">
						    <img class="lower_images" src="resources/images/black_heart.png" style="margin-left: 45px;">
						</c:if>
						<c:if test="${liked_ornot == '1'}">
						    <img class="lower_images" src="resources/images/heart.png" style="margin-left: 45px;">
						</c:if>
						<img class="lower_images" src="resources/images/tableware.png" style="margin-left: 45px;">
						
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
							<img class="lower_images" src="resources/images/icon_tomato_ver2_1.png"  style="margin-left: 138px;">
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
						<span style="margin-left: 574px; font-size:32px; position: relative; top: -180px;"><strong>요리 tip</strong></span>
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
						<div class="horizontal-line_green" style="margin-top: -170px; position: relative; top: 80px; border-top: 2px solid #21730B;"></div>
					</div>
					<!-- 본문 -->
						<img src="resources/images/cooking.png" style="width:135px; height:135px; position: relative; margin-left: 565px; top:-550px; margin-top: 600px;">
						<span style="font-size:32px; position: relative; top: -500px; left-margin: -100px; left: -142px;"><strong>조리 과정</strong></span>
						<!-- 조리과정 -->
						<div style="text-align:left; position: relative; top: -350px; margin-left: 150px;">
					        <c:forEach var="item" items="${manual}" varStatus="loop">
					        	<div class="float_left" style="margin-bottom: 50px;">
					        	
						        	<c:if test="${not empty manualImg[loop.index]}">
							    		<img id="detailed_img" src="${manualImg[loop.index]}" />
							        </c:if>
							    	<p id="detail_position">${item}</p>
									<c:if test="${not empty manualImg[loop.index]}">
							            <p class="horizontal-line_gray"></p>
							        </c:if>
							    </div>
							</c:forEach>
    					<!-- 주의 문구 -->
	 					<div>
							<span id="gonggong">(* 표시되는 정보는 식약처에서 제공하는 공공데이터에 근거하며, 일부 자료의 경우 오류가 포함되어 있을 수 있습니다.)</span>
						</div>
					    <p id="body_endline" class="horizontal-line_gray"></p>
						</div>	
						
						<!-- 수정, 삭제버튼, 신고 -->				
						<div class="div_margin_width" style="height: 60px; float: left;">
							<span style="color: lightgray; font-size: 12px; float: right; position: relative; top: 50px; left: -45px;">신고하기</span>
							<img src="resources/images/alarm.png" style="width: 40px; height: 40px; float: right;">
						</div>
								</div>
							</div>
						</div>
						
				<!-- 이런 레시피는 어떠세요? 추천 -->
				<div style="width: 1320px; height: 100px; float: left; text-align: center; margin-left: 300px;">
					<span id="howabout_this"><strong>이런 레시피는 어떠세요?</strong></span>
				</div>
				
					<!-- 추천 게시물 -->
				      <div class="carousel carousel_size">
				        <img
				          src="resources/images/public_sample1.png"
				          alt=""
				        />
				        <img
				          src="resources/images/public_sample1.png"
				          alt=""
				        />
				        <img
				          src="resources/images/public_sample1.png"
				          alt=""
				        />
				        <div style="margin-top: 20px; text-align: center; height: 40px; margin-left: 540px;">
				            <button class="prev round_btn" type="button">이전</button>
					    	<button class="next round_btn" type="button">다음</button>
				    	</div>
				      </div>
				

				<div class="horizontal-line_gray" id="testline2"></div>
				<!-- 댓글 및 리뷰 글자 -->
				<div style="width: 300px; height: 150px; float: left; margin-left: 300px;">
					<span class="tomato_title" style="width: 300px; height: 150px; text-align: center;"><strong>댓글 및 리뷰</strong></span>
				</div>
					
				<form id="comment_write" enctype="multipart/form-data" style="margin-top: -20px; height: 1px;" action="/comment_write.do">
					<!-- 긁어온 별점 -->
					 <div class="rate magnify" id="rating">
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
						  <textarea id="content-textarea" placeholder="댓글을 입력하세요." style="height: 180px; required"></textarea>
							<div style="height: 60px; width: 200px; position:relative; top: -305px; left: 1200px;">
								<input class="photo_insert" type="file" id="imgUpload" onchange="previewFile()" style="font-size: 16px; display:none;"></input>
									<label class="round_btn photo_insert" for="imgUpload">사진 추가</label>
							</div>
							<button id="preview_btn">이미지 미리보기</button>
							<div style="position:relative; float:left;">
								<button class="round_btn write_cancel_btn" id="comment_write_do" name="comment_write_do">작성</button>
								<button class="round_btn write_cancel_btn" id="cancel_btn">취소</button>
							</div>
					</form>
					
					<div class="horizontal-line_gray" id="testline3"></div>
				
					<!-- 댓글 표시 -->
					<div style="float:right;">
						<button class="align_order">인기순</button>
						<button class="align_order" style="position: relative; right: -20px;">최신순</button>
					<div>
						<button class="best_comment" id="align_order2">정렬순서</button>
					</div>
					
					<!-- 쓴 댓글 표시 -->
					<c:forEach items="${comments_list_all}" var="cvo">
					    <div>
					        <p>${cvo.m_nick}</p>
					        <p><button class="best_comment" style="margin-left: -150px;">베스트 댓글</button>
					        <p>${cvo.c_time}</p>
					        <div>
					            <img class="comment_img" src="resources/images/public_sample1.png">
					            <div>
					                <span class="comment_content">${cvo.c_contents}</span>						
					            </div>
					            <button style="width: 40px; height: 10px; float:right; margin-right : 30px; background-color: #ffffff; color:#ffffff; outline: none; border: none;">
					            </button>
					            <p></p>
					            <br>
					            <br>
					            <div>
					            </div>
					            <!-- 신고버튼, 따봉 -->
					            <div style="position: relative; top: -290px; left: 15px;">
					                <!-- <input type="button" class="report-button" style="float: right; margin-right: 100px; outline:none;" onclick="alert('님 신고!')"> -->
					                <button style="float: right; border: none; background-color: #ffffff;">
					                    <p style="height: 15px; float: right;  color:#cccccc">신고하기</p>
					                </button>
					                <!-- 따봉 버튼 (좋아요) -->
					                <button style="float: right; width: 44px; height: 44px; border: none; background-color:#ffffff;">
					                    <img src="resources/images/thumbs-up.png" style="width: 44px; height: 44px; ">
					                </button>
					                <div style="width: 40px; height: 20px; float: right; margin-right: -2px; ">
					                    <p style="height: 15px; float: right; color: tomato; font-size: 20px; text-align: center; position:relative; top: 52px; right: -155px;"><strong>${cvo.c_like}</strong></p>
					                </div>
					                <div style="margin-bottom: 10px;">
					                    <button class="align_order" style="position: relative; top: 20px;" >수정</button>
					                </div>
					                <div style="position: relative; right: 30px; bottom: 30px;"></div>
					                <div style="">
					                    <button class="align_order">삭제</button>
					                </div>
					            </div>
					        </div>
					        <div class="horizontal-line_tomato""></div>
					    </div>
					</c:forEach>
					
					
					
					<!-- 댓글 더보기 -->
					<div style="margin: auto; text-align: center; margin-top: 20px;">
						<button class="report_button" style="width: 100px; height: 50px; margin-top: 20px; border:none; border-radius:5px; background-color: tomato; font-size: 24px; color:white; margin: auto;">더보기</button>
					</div>							
				</div>
			
		`
		<!-- content 끝 -->		
<<<<<<< HEAD
	
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
			</aside>
=======
			</div>
			</div>
			</div>
		</div>
<<<<<<< HEAD
		
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
		</aside>
=======
	
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
			</aside>
>>>>>>> refs/heads/master
>>>>>>> refs/heads/master
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
</body>
	
</html>