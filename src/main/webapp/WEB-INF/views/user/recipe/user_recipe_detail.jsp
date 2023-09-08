<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저레시피 상세페이지</title>
<link rel="icon" type="image/x-icon" href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/recipe/user_recipe_detail.css?after" />
<style type="text/css">

</style>

	

</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div id="upper">
				        <span class="category text_center" id="title_field">
							냠냠 레시피 > ${uvo.u_rcp_category}
						</span>
				<img src="resources/images/icon_tomato_ver2_1.png" id="little_tomato" style="height: 30px; width: 30px;">
				<span id="rcp_score" class="text_center" style="color:#929292; margin-right: 850px; font-size: 20px; float:right;">${uvo.avg_grade}</span>
				<br>
					<img id="main_img" src="${uvo.u_rcp_img}" >
					
				<img src="resources/images/ingredient.png" style="width:135px; height:135px; position: absolute; margin-left: 80px; top: 425px;">
				<span style="margin-left: 115px; font-size:32px; position: relative; top: -100px;"><strong>재료</strong></span>
				<div id="ingredients" style=" margin-left: 785px; margin-bottom: 60px; width: 400px; height: 250px;">
				        <p id="ing_dets">
							${uvo.u_rcp_ing}
						</p>
				</div>
				<div class="horizontal-line"></div>
			<!-- upper 끝 -->	
			</div>
				
			<div id="upper2">
			        <div id="title">
						${uvo.u_rcp_title}
					</div>
				<div id="lower_images">
					<img class="lower_images" src="resources/images/hashtag.png" style="margin-left: 138px;">
					<!-- 이미지가 검은하트 or 빨간 하트 -->
					<button class="lower_images" id="like_btn_id"></button>
						<c:if test="${liked_ornot == null}">
						    <img class="lower_images" src="resources/images/black_heart.png" style="margin-left: 45px; position:relative; left: -93px;">
						</c:if>
						<c:if test="${liked_ornot != null}">
						    <img class="lower_images" src="resources/images/heart.png" style="margin-left: 45px; position:relative; left: -93px;">
						</c:if>
					<img class="lower_images" src="resources/images/tableware.png" style="margin-left: 45px; position:relative; left: -95px;">
						<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
						        <p id="ing_dets">
									<p class="lower_text" style="margin-left: 107px; width: 100px; height: 40px; text-align: center;"># ${uvo.u_rcp_keyword}
								</p>
						</div>
						<div style="height: 1px;">
							<!-- <span class="lower_text" style="margin-left: 267px; position: relative; top: -40px;">찜리스트에 추가</span> -->
							<span class="lower_text" style="margin-left: 267px; position: relative; top: -40px;">찜리스트에 추가</span>
								<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
									<!-- span은 쓰레기다 (p 대신 쓰면 글자가 첫줄에서 왼쪽 뻥 띄우고 시작함) -->
										<p id="howto_cook" class="lower_text">${uvo.u_rcp_category}</p>
								</div>
						</div>
			
					<p style="margin-top: 20px;">
						<img class="lower_images" src="resources/images/icon_tomato_ver2_1.png"  style="margin-left: 138px;">
							<c:choose>
						        <c:when test="${uvo.u_rcp_ctype} eq '기타'}">
							        <img class="lower_images" src="resources/images/more.png"  style="margin-left: 45px;">
							    </c:when>
						        <c:when test="${uvo.u_rcp_ctype} eq '볶기'}">
							        <img class="lower_images" src="resources/images/stirfry.png"  style="margin-left: 45px;">
							    </c:when>
						        <c:when test="${uvo.u_rcp_ctype} eq '찌기'}">
							        <img class="lower_images" src="resources/images/steam.png"  style="margin-left: 45px;">
							    </c:when>
						        <c:when test="${uvo.u_rcp_ctype} eq '끓이기'}">
							        <img class="lower_images" src="resources/images/boiling.png"  style="margin-left: 45px;">
							    </c:when>
						        <c:when test="${uvo.u_rcp_ctype} eq '튀기기'}">
							        <img class="lower_images" src="resources/images/frying-pan.png"  style="margin-left: 45px;">
							    </c:when>
						        <c:when test="${uvo.u_rcp_ctype} eq '굽기'}">
							        <img class="lower_images" src="resources/images/grill.png"  style="margin-left: 45px;">
							    </c:when>
							    <c:otherwise>
							        <img class="lower_images"  src="resources/images/steam.png" alt="Default Recipe Image"  style="margin-left: 45px;">
							    </c:otherwise>
							</c:choose>
						
						
					</p>
					<p style="margin-top: 10px;">
					<div style="width: 100px; height: 40px; margin-left: -30px; text-align: center; margin-top: 10px;">
							<p id="writer_nick" style="width: 90px;" class="lower_text">${uvo.m_nick}</p>
					</div>
					<div style="width: 100px; height: 40px; margin-left: 26px; text-align: center; margin-top: 10px;">
							<p id="cook_category" class="lower_text">${uvo.u_rcp_ctype}</p>
					</div>
					
				<!-- lower_images 끝 -->
				</div>
				<div id="tip">
					<img src="resources/images/light-bulb.png" style="width:135px; height:135px; position: absolute; margin-left: 565px; top: 825px;">
					<span style="margin-left: 574px; font-size:32px; position: relative; top: -180px;"><strong>요리 tip</strong></span>
					<div id="rcp_tip">
							<p id="recipe_tip" class="font_size_24">
								<%-- ${uvo.u_rcp_tip} --%> 팁을 제공하지 않는 레시피입니다.
							</p>
					</div>
				</div>
				<div class="horizontal-line" style="margin-top: -20px;"></div>
			<!-- upper2 끝 -->
			</div>
				
				<!-- 재훈 헌정 코드 : 전체를 감싼 div를 center로 보내고, div의 margin이 아니라, height, width로 공간의 끝을 조절한다. -->
				
				<!-- 난이도 : 초보 냠냠이 -->
				<div id="inner_content" style="margin-top: 100px;">
					<span style="margin-left: 158px; position:relative; font-size: 32px;">
					 <strong>${u_rcp_level}난이도</strong></span>
					<span id="u_rcp_level" style="margin-left: 45px; position:relative; font-size: 32px; color: tomato;">
					 <strong>${u_rcp_level}초보 냠냠이</strong></span>
					 <div class="horizontal-line2" style="margin-top: 20px; margin-bottom: 30px;"></div>
					<span id="u_rcp_level" style="margin-left: 158px; margin-top: 30px; margin-bottom: 30px; position:relative; font-size: 32px;">
					 <strong>조리법</strong></span>
					 <div class="horizontal-line2" style="margin-top: 60px; margin-bottom: 30px; position: relative; top: -30px;"></div>
				</div>
		
				<div id="sum_content">
					<h1 style="text-align: center; margin-top: 100px; margin-bottom: 100px;">${uvo.u_rcp_main}
				</div>
				
				
				<!-- 서머노트 이후 -->
				
					<!-- 수정, 삭제버튼, 신고 -->				
				<div class="div_margin_width" style="height: 60px; float: left;">
					<span style="color: lightgray; font-size: 12px; float: right; position: relative; top: 50px; left: -45px;">신고하기</span>
					<img id="report_btn" src="resources/images/alarm.png" style="width: 40px; height: 40px; float: right;">
				</div>
													
				<!-- 이런 레시피는 어떠세요? 추천 -->
				<div style="width: 1320px; height: 100px; float: left; text-align: center;">
					<span id="howabout_this"><strong>이런 레시피는 어떠세요?</strong></span>
				</div>
				
					<!-- 추천 게시물 -->
				     <div class="carousel carousel_size">
				     
				       <c:forEach var="item" items="${random_list}" varStatus="loop">
						    <c:if test="${loop.index < 3}">
	    						<a href="/user_recipe_detail.do?rcp_idx=${item.rcp_idx}">
							        <img id="carousel_img" src="${item.u_rcp_img}" alt="">
						       </a>
						    </c:if>
						</c:forEach>
	     	
				     <!--    <img
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
				        /> -->
					        <!-- ★ 캐러셀 이전 다음 -->
<!-- 				        <div style="margin-top: 20px; text-align: center; height: 40px; margin-left: 540px;">
				            <button class="prev round_btn" type="button">이전</button>
					    	<button class="next round_btn" type="button">다음</button>
				    	</div> -->
				      </div> 
				      
				   <%--  <div class="carousel carousel_size">
					    <div id="imageCarousel" class="carousel-inner">
					        <c:forEach var="item" items="${img_list}">
					            <div class="carousel-item">
					                <img id="carousel_img" src="resources/images/public_sample1.png" alt="안녕 대체이미지"/>
					            </div>
					        </c:forEach>
					    </div>
					    <div style="margin-top: 20px; text-align: center; height: 40px; margin-left: 540px;">
					        <button class="prev round_btn" type="button" id="prevBtn">이전</button>
					        <button class="next round_btn" type="button" id="nextBtn">다음</button>
					    </div>
					</div>
 --%>
				      
				

				<!-- <div class="horizontal-line_gray" id="testline2"></div> -->
				<!-- 댓글 및 리뷰 글자 -->
				<div id="comment_write_div" class="width_1320">
					<div id="review_star" style="width: 300px; height: 150px; float: left; margin-left: 100px;">
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
							</div>
							<div id="btns_photo" style="width: 120px; height: 172px; float: right; margin-top: -15px;">
								<label class="round_btn_right photo_insert" id="add_photo" for="imgUpload">사진 추가</label>
								<!-- ＃ 한주 헌정 수정 코드 (지분 100%) -->
								<!-- src="#" 현재페이지 한번더 불러옴!! -->
								<img id="preview_btn" alt="이미지 미리보기" style="max-width: 120px; max-height: 120px;">
							</div>
							<div id="cancel_write_btn">
								<button class="round_btn_right" id="comment_write_do" name="comment_write_do">작성</button>
								<button class="round_btn_right" id="cancel_btn" style="position: relative; top: -32px;">취소</button>
							</div>
					</form>
				
					
					
					
				</div>
					
					
					<div class="spcaing_div">
					</div>
					
											
						
					<!-- 쓴 댓글 표시 -->
					<div id="comments_show">
						<c:forEach items="${comments_list_all}" var="cvo" varStatus="loop">
							<div id="writer_time">
							<c:choose>
						        <c:when test="${loop.index == 0}">
							        <p class="left_float" id="comment_writer_best" style="margin-bottom: 50px; color: tomato; font-size: 32px;
							        width: 300px;
									height: 50px;
									padding: 30px;
									position: relative;
									text-align: center;
									font-size: 32px;
									color: tomato;
									"><strong>${cvo.m_nick}</strong></p>
							    </c:when>
							    <c:otherwise>
									<p class="left_float" id="comment_writer" style="margin-bottom: 50px;">${cvo.m_nick}</p>						    
							    </c:otherwise>
						    </c:choose>
						        <div id="best_comment_div">
							        <!-- 베스트인 경우만 출력, 아닌 경우에는 흰색으로 칠하자 -->
							        <c:if test="${loop.index == 0}">
						        		<button class="best_comment left_float" id="comment_best">베스트 댓글</button>
						        	</c:if>
						        	<!-- <button class="best_comment left_float" id="comment_best" style="display:none;"> </button> -->
						        </div>
						        <div class="left_float" id="comment_time"><p id="ctime_id">${cvo.c_time}</p></div>
						    </div>
						    	
						    	<!-- 댓글 컨텐츠 이미지 -->
						    	<img class="comment_img" id="commentImage" src="${cvo.c_img}" alt="">
						    	<script type="text/javascript">
									var elements = document.getElementsByClassName("comment_img");
									
									for (var i = 0; i < elements.length; i++) {
									    elements[i].addEventListener('error', function() {
									        // 이미지 로드에 실패한 경우, default 이미지 경로로 교체
									        this.src = 'resources/images/comment/sample_white.png'; // default 이미지 경로를 여기에 넣어주세요
									    });
									}
								</script>
						    	
						    	<div id="comment_content">
						    		
						    		<div id="rev_del_report_div">
								    	<!-- 내 글이 아닌 경우 신고하기 -->
								    	<!-- <a href="</comment_report.do"><span>신고하기</span></a> -->
								    	<!-- <a href="/"><span id="comment_report">신고하기</span></a> -->
								    	<!-- 내 글인 경우 수정 삭제 -->
								    	<%-- <p class="content_size" id="content_size${loop.index}">${cvo.c_contents}</p> --%>
								    	<textarea class="content_size hidden" readonly style="height: 220px;  margin-bottom: 10px; border: 2px solid tomato;" id="content_textarea${loop.index}">${cvo.c_contents}</textarea>
								    	
								    		<button class="round_btn revision_delete_btn comment_revision" id="comment_revision_btn${loop.index}" data-revision_btn="comment_like_btn_img${loop.index}">수정</button>
									    	<button class="round_btn revision_delete_btn comment_delete_btn" id="comment_delete${loop.index}" data-delete_btn="comment_like_btn_img${loop.index}">삭제</button>
								    	
								        
								        <img class="like_btn" id="comment_like_btn_img${loop.index}" src="resources/images/thumbs-up.png" alt="좋아요 버튼"
											    data-button-id="comment_like_btn_img${loop.index}">
								    	<p class="like_number" style="	height: 15px; float: right; color: tomato; font-size: 20px; text-align: center;
	text-align: center;
	position:relative; top: -35px; margin-bottom: 10px;" id="like_number${loop.index}" data-likeNum_id="comment_like_btn_img${loop.index}"><strong>${cvo.c_like}</strong></p>
								       
								        
								        <div id="comment_downline"></div>
							        </div>
						    	</div>
						    	
							    
							    
						</c:forEach>
					</div> 
					
					<div class="spcaing_div">
					</div>
					
				<c:forEach var="item" items="${detail_list}" varStatus="loop">
				    <div class="rcpseq" data-rcpSeq="${item.get("RCP_SEQ").asText()}">
				        <%-- ${item.get("RCP_SEQ").asText()} --%>
				    </div>
				</c:forEach>

					
				
				</div>	<!-- content 끝 -->
				
			</div> <!-- test 끝 -->
			
		</div> <!-- mydiv 끝 -->
	
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
			</aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div> 
<!-- script 위치 -->		
<!-- JavaScript 코드 -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script type="text/javascript">
	const prevButton = document.querySelector('.prev');
	const nextButton = document.querySelector('.next');
	const carousel = document.querySelector('.carousel');

	let index = 0;

	prevButton.addEventListener('click', () => {
	   if (index === 0) return;
	   index -= 1;
	});

	nextButton.addEventListener('click', () => {
	   if (index === 2) return;
	   index += 1;
	});
	
</script> -->



<script type="text/javascript">
    $(document).ready(function () {
        var mNick = '<%= session.getAttribute("m_nick") %>'; // JSP 코드로부터 m_nick 값을 가져옴
		
       // 댓글 좋아요
       $(".like_btn").click(function () {
    	   if (mNick == "null" || mNick === "null" || mNick == null || mNick === null || mNick === undefined || mNick == undefined || mNick == "" || mNick === "") {
               var result = confirm("로그인이 필요합니다. 계속하시겠습니까?");
               if (result) {
                   window.location.href = "/go_login.do";
               } else {
                   // 사용자가 로그인을 취소하면 아무 작업도 하지 않습니다.
               }
            }else {
            	// 다 안걸리면 작업 하자
        	    var buttonId = $(this).data("buttonId");
            	var likeCnt = $(this).next().children('strong');
        	    // 자료형 확인
        	    console.log(typeof buttonId);


            	  // Ajax 요청 보내기
                $.ajax({
                    type: "GET",
                    url: "/comment_like.do",
                    data: { buttonId: buttonId },
                    success: function (response) {
                        // Ajax 요청 성공 시 실행되는 코드
                        if (response.success) {
                            // 좋아요 카운트 업데이트
							var cHitValue = response.cHitValue; 
                            // alert("총 좋아요 수 : " + cHitValue);
                            var resultValue = response.resultValue;
                            // 희준 헌정 코드 (부분수정)
                            likeCnt.text(cHitValue);
                            switch (resultValue) {
                            case true:
                                // 좋아요가 되어있는 경우
                                  alert("댓글 좋아요 취소");
                                break;
                            case false:
                                // 좋아요가 안 되어있는 경우
                                	alert("댓글 좋아요 완료!");
                                break;
                            default:
                            		alert("댓글 좋아요 체크 실패...(시무룩)");
                                break;
                        }
                            
						    // p 요소의 data-likeNum_id 값을 가져옵니다.
						    var likeNumId = $("#" + buttonId).data("likeNum-id");
						    
						    // likeNumId를 사용하여 해당 p 요소 내용을 업데이트합니다.
						    $("#" + likeNumId).html("<strong>" + cHitValue + "</strong>");

                            // 댓글란 새로고침
                            // updateCommentSection();
                        } else {
                            alert("댓글 좋아요를 완료!");
                            console.error();
                        }
                    },
                    error: function (error) {
                        // Ajax 요청 실패 시 실행되는 코드
                        console.error("Ajax 요청 실패" + error);
                        alert(error);
                    }
                });
            	
            }
        });
        
        
        

       
       // 댓글 삭제
   	/* <button class="round_btn revision_delete_btn" id="comment_delete${loop.index}">삭제</button> */
   	  /* delete_btn */
        
       // 댓글 수정
     /*   $(".comment_revision").click(function () {
    	   if (mNick == "null" || mNick === "null" || mNick == null || mNick === null || mNick === undefined || mNick == undefined || mNick == "" || mNick === "") {
               var result = confirm("로그인이 필요합니다. 계속하시겠습니까?");
               if (result) {
                   window.location.href = "/go_login.do";
               } else {
                   // 사용자가 로그인을 취소하면 아무 작업도 하지 않습니다.
               }
            }else {
            	// 다 안걸리면 작업 하자
            	
        	    var revision_id = $(this).data("revision_btn");
        	    // 자료형 확인
        	    alert.log("자료형은 : " + typeof revision_id);

            	// Ajax 요청 보내기
                $.ajax({
                    type: "GET",
                    url: "/comment_like.do",
                    data: { buttonId: buttonId },
                    success: function (response) {
                        // Ajax 요청 성공 시 실행되는 코드
                        if (response.success) {
                            // 좋아요 카운트 업데이트
							var cHitValue = response.cHitValue; 
                            // alert("총 좋아요 수 : " + cHitValue);
                            
						    // p 요소의 data-likeNum_id 값을 가져옵니다.
						    var likeNumId = $("#" + buttonId).data("likeNum-id");
						    
						    // likeNumId를 사용하여 해당 p 요소 내용을 업데이트합니다.
						    $("#" + likeNumId).html("<strong>" + cHitValue + "</strong>");

                            // 다른 필요한 업데이트를 수행할 수도 있습니다.

                            alert("댓글 좋아요 완료!");
                            updateCommentSection();
                        } else {
                            alert("댓글 좋아요를 완료!");
                            console.error();
                        }
                    },
                    error: function (error) {
                        // Ajax 요청 실패 시 실행되는 코드
                        console.error("Ajax 요청 실패" + error);
                        alert(error);
                    }
                });
            	
            }
        }); */
        
        
        // 댓글 수정
        $(".comment_revision").click(function() {
        	// prev => 바로 이전에 있는 textarea 선택!!
            var $textarea = $(this).prev('textarea');
        	var $button = $(this);
        	
            var revisionBtnId = $button.data('revision_btn'); // data 속성을 통해 commentId를 가져옵니다.


            $textarea.prop('readonly', false); // textarea를 수정 가능한 상태로 변경
            // focus를 맨 뒤에 가도록 하기 위함.
            var textareaValue = $textarea.val(); // 현재 textarea의 내용을 가져옵니다.
            $textarea.val(''); // textarea 내용을 지웁니다.
            $textarea.val(textareaValue); // textarea 내용을 다시 설정하여 커서를 내용 가장 마지막으로 이동시킵니다.
            $textarea.prop('readonly', false); // textarea를 수정 가능한 상태로 변경
            $textarea.focus(); // textarea에 포커스 주기
            

            // 수정 버튼을 "완료" 버튼으로 변경
            $(this).text("완료");

            // 완료 버튼 클릭 이벤트 핸들러
            $(this).one("click", function() {
              var newText = $textarea.val(); // 수정된 내용을 가져오기

              // Ajax를 사용하여 서버에 업데이트된 내용 전송
              $.ajax({
                url: '/comment_revise.do', // 서버 URL 설정
                method: 'POST', // 또는 'PUT' 등 적절한 HTTP 메소드 설정
                data: { text: newText, revisionBtnId: revisionBtnId }, // 수정된 내용을 서버로 전송 (newText를 text로)
                success: function(response) {
                  // 성공적으로 서버에 업데이트된 경우
                  alert("수정이 완료되었습니다.");
                  // 수정 완료 후 다시 읽기 전용으로 변경
                  $textarea.prop('readonly', true);

                  // 완료 버튼을 다시 "수정" 버튼으로 변경
                  $(this).text("수정");
                  $textarea.prop('readonly', true); // textarea를 수정 가능한 상태로 변경

                  // 여기에서 필요한 경우 자동 새로고침을 수행할 수 있습니다.
                  location.reload(); // 페이지 새로고침
                },
                error: function(error) {
                  // 서버 업데이트 중 오류 발생 시 처리
                  alert("오류가 발생했습니다.");
                  console.error(error);
                }
              });
            });
          });
        
        
        
        // 댓글 삭제
        $(".comment_delete_btn").click(function() {
        	 var result = confirm("댓글을 삭제하시겠습니까?");

             if (result) {
            	 $button = $(this);  
                 var deleteBtnId = $button.data('delete_btn'); // data 속성을 통해 삭제버튼 id 가져오기
                 
                 $.ajax({
                     url: '/comment_delete.do', // 서버 URL 설정
                     method: 'POST', // 또는 'PUT' 등 적절한 HTTP 메소드 설정
                     data: { deleteBtnId: deleteBtnId }, // 수정된 내용을 서버로 전송 (newText를 text로)
                     success: function(response) {
                       // 성공적으로 서버에 업데이트된 경우
                       alert("삭제가 완료되었습니다.");

                       location.reload(); // 페이지 새로고침
                     },
                     error: function(error) {
                       // 서버 업데이트 중 오류 발생 시 처리
                       alert("오류가 발생했습니다.");
                       console.error(error);
                     }
                   });
                 

             }else{
            	 // 아무것도 안함
             }
        });
        	
        	

            
        
        
        
       // 댓글 좋아요 후 재요청
      /*  function updateCommentSection() {
    	    // 댓글 목록을 가져오는 Ajax 요청을 보냅니다.
    	    $.ajax({
    	        type: "GET",
    	        url: "/get_comment_list.do", 
    	        success: function (commentList) {
    	            // 댓글 목록을 받아온 후, 이를 화면에 업데이트합니다.
    	            var commentContainer = $("#comment_container"); // 댓글을 표시할 컨테이너

    	            // 이전에 표시된 댓글을 모두 삭제합니다.
    	            commentContainer.empty();

    	            // 댓글 목록을 순회하며 각 댓글을 화면에 추가합니다.
    	            for (var i = 0; i < commentList.length; i++) {
    	                var comment = commentList[i];
    	                var commentHtml = `
    	                    <div class="comment">
    	                        <p>${comment.text}</p>
    	                        <img class="like_btn" id="comment_like_btn_img${i}" src="resources/images/thumbs-up.png" alt="좋아요 버튼"
    	                            data-button-id="comment_like_btn_img${i}">
    	                        <p class="like_number" style="height: 15px; float: right; color: tomato; font-size: 20px; text-align: center;
    	                            text-align: center; position:relative; top: -35px; left: -105px;" id="like_number${i}" data-likeNum_id="comment_like_btn_img${i}">
    	                            <strong>${comment.likes}</strong>
    	                        </p>
    	                    </div>
    	                `;
    	                commentContainer.append(commentHtml);
    	            }
    	        },
    	        error: function (error) {
    	            // Ajax 요청 실패 시 처리할 내용을 여기에 추가하세요.
    	            console.error("댓글 목록을 가져오는데 실패했습니다: " + error);
    	        }
    	    });
    	} */

        
        
        
       // 신고 버튼
       $("#report_btn").click(function () {
    	   if (mNick == "null" || mNick === "null" || mNick == null || mNick === null || mNick === undefined || mNick == undefined || mNick == "" || mNick === "") {
               var result = confirm("로그인이 필요합니다. 계속하시겠습니까?");
               if (result) {
                   window.location.href = "/go_login.do";
               } else {
                   // 사용자가 로그인을 취소하면 아무 작업도 하지 않습니다.
               }
            }else {
            	// 다 안걸리면 작업 하자

                // 클릭한 버튼의 id 가져오기
                
                console.log("님 신고!");
            	alert()
                // rcp_idx 가져오기

            }
        });
        
        

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
		                // RATE 값을 5으로 변경하기
	                    document.getElementById("star5").checked = true;
		                // 미리보기 이미지 요소를 가져와서 초기화
	                    var previewImage = document.getElementById("preview_btn");
	                    previewImage.src = "";
	                    $("#content-textarea").val(""); // textarea 내용을 빈 문자열로 설정
	                },
	                error: function () {
	                    // 오류 발생 시 처리
	                    console.error("데이터 전송 실패");
	                    alert("댓글 작성 실패!");
	                    // 오류 처리 로직 추가
	                },
	            });
            }

          
        });
        
        // 취소 버튼 클릭 시 내용 초기화
        $("#cancel_btn").click(function (e) {
          	 $("#content-textarea").val(""); // textarea 내용을 빈 문자열로 설정

        	  // 미리보기 이미지 요소를 가져와서 초기화
        	  var previewImage = document.getElementById("preview_btn");
        	  previewImage.src = "";
        	
        });
	});
</script>




<script type="text/javascript">
    function previewFile() {
        var preview = document.getElementById('preview_btn');
        var fileInput = document.getElementById('imgUpload');
        
        var file = fileInput.files[0];
        var reader = new FileReader();
        
        reader.onload = function() {
            preview.src = reader.result;
            preview.style.display = 'block'; // 이미지 표시
        };
        
        if (file) {
            reader.readAsDataURL(file); // 파일을 읽어와서 이미지로 변환
        }
    }

    // 이미지 미리보기 버튼 클릭 시 호출
    /* document.getElementById('preview_btn').addEventListener('click', function() {
        previewFile();
    }); */
</script>






<script type="text/javascript">
/* 완전히 로드된 후에 실행하자! */
// 페이지 로드 완료 후에 실행될 코드
document.addEventListener("DOMContentLoaded", function () {
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 좋아요 버튼 요소를 가져옵니다.
	var likeButton = document.getElementById("like_btn_id");

	// 버튼 클릭 이벤트 핸들러를 추가합니다.
	likeButton.addEventListener("click", function () {
	    // liked_ornot 값을 가져옵니다. liked_ornot 값을 서버에서 받아온다고 가정합니다.
	    var liked_ornot = "${liked_ornot}"; // 이 부분을 서버에서 실제 값으로 대체해야 합니다.
	    alert("게시글 찜 완료!");
	    // alert("좋아요 값은" + liked_ornot);

	    if (liked_ornot === "") {
	        // liked_ornot이 null인 경우
	        alert("좋아요를 누릅니다.");
	        // 추가적인 동작을 수행하거나 서버로 데이터를 전송할 수 있습니다.
	        window.location.href = "/go_login.do";
	    } else if (liked_ornot === '1') {
	        // liked_ornot이 '1'인 경우
	        alert("좋아요 취소를 누릅니다.");
	        // 추가적인 동작을 수행하거나 서버로 데이터를 전송할 수 있습니다.
	    }
	});

	// JSP 코드로부터 m_nick 값을 가져옴
    var mNick = '<%= session.getAttribute("m_nick") %>';

    var contentTextarea = document.getElementById("content-textarea");
    if (contentTextarea) {
        contentTextarea.addEventListener("click", function () {
            // 서버에서 session에서 m_nick 값을 가져오는 방법은 여기서 생략합니다.
            // 서버에서 가져온 m_nick 값을 변수에 할당합니다. (예시로 "m_nick"이라 가정)

           	console.log("아디 첵");
	
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
		
</body>
	
</html>