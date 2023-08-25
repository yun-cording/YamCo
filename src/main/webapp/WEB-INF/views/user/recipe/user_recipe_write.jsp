<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저레시피 상세페이지</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">



<!-- 

상우 메모장
ㅁㅁㅁ
ss


 -->



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
        /* height: 5000px; */

 }

 #sidebar-right {
    background-color: yellow;
    float: left;
    width: 15.625%;
    height: 5000px;
}

#sidebar-left {
    background-color: yellow;
    width: 15.625%;
    float: left;
    height: 5000px;

}

#content {
    width: 68.75%;
    height: 100%;
    float: left;
    margin-top: 0px;
    background: white;
    height: 5000px;
}


#footer {
    left: 0px;
    width: 100%;
    clear: left;
}

	
#test {
	width: 100%;
	height: 1500px;
}



#upper{
	margin-top: 100px;
}
.text_center{
	text-align:center;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; 
}
    .horizontal-line {
      border-top: 2px solid #21730B; /* 선 스타일 지정 */
      margin-top: -320px; /* 선 위쪽 여백 지정 */
      margin-bottom: 0px; /* 선 아래쪽 여백 지정 */
      margin-left: 570px;
      margin-right: 62px;
    }
    .horizontal-line2 {
      border-top: 2px solid #21730B; /* 선 스타일 지정 */
      margin-top: -350px; /* 선 위쪽 여백 지정 */
      margin-bottom: 0px; /* 선 아래쪽 여백 지정 */
      margin-left: 60px;
      margin-right: 60px;
    }
    .horizontal-line_tomato {
      border-top: 3px solid tomato; /* 선 스타일 지정 */
      margin-top: -320px; /* 선 위쪽 여백 지정 */
      margin-bottom: 0px; /* 선 아래쪽 여백 지정 */
      margin-left: 30px;
      margin-right: 30px;
    }
    .horizontal-line_gray {
      border-top: 3px solid #f9f9f9; /* 선 스타일 지정 */
      margin-top: -320px; /* 선 위쪽 여백 지정 */
      margin-bottom: 0px; /* 선 아래쪽 여백 지정 */
      margin-left: 30px;
      margin-right: 30px;
    }
#ingredients{
	position: relative;
	top: -328px; 
	margin-left: 750px;
}
 .table_row {
 	display: block;
    margin-bottom: 3px;
	 padding-bottom: 3px;
  }
  table{
  	border: 1px;
  }
  .lower_images{
  	width: 90px;
  	height: 90px;
  }
  .round_btn{
  	 background-color: tomato;
      color: white;
      width: 100px;
      height: 50px;
      font-size: 24px;
      border: none; /* 외곽선 제거 */
      border-radius: 5px; /* 동그랗게 곡선 처리 */
      cursor: pointer;
      outline: none; /* 포커스 시 테두리 제거 */
  }
  input.report-button {
  background: url("resources/images/alarm.png") no-repeat;
  background-size: 50px;
  width: 50px;
  height: 50px;
  border: none;
}


.left_arrow{
	transform: rotate( 90deg );
}
.right_arrow{
	transform: rotate( 270deg );
}
.how_about_imgs{
	margin-top: 35px;
	margin-left: 25px;
	margin-right: 25px;
}
#content_review_btn{
	 background: url("resources/images/comment_review.png") no-repeat;
	 background-size: 290px;
}
#w3review{
	margin-left: 400px;
	position: relative;
	top: -120px;
	outline: tomato;
}

.left_margin{
	margin-left: 100px;
}
.left_margin_70{
	margin-left: 70px;
}

.font_32{
	font-size: 32px;
	font-weight: bold;
}

.input_tomato{
  width: 350px;
  height: 50px;
  border: 2px solid tomato; /* Set border color to tomato */
  border-radius: 5px;
  font-size: 20px;
  color: tomato; 
  text-align: center;
  position: relative;
  top: -5px;
}

.vertical-line {
  width: 2px; /* Adjust the width of the line */
  height: 470px; /* Adjust the height of the line */
  background-color: tomato; /* Set the color of the line */
}

.float_left{
	float:left;
}

.margin_left_70{
	margin_left: 700px;
}

.checkmark {
  height: 20px;
  width: 20px;
  background-color: tomato; /* Set background color to tomato */
  color: tomato;
  border-radius: 50%;
  position: relative;
  top: 4px;
  left: 12px;
  
}

.radio-container {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
}

/* Hide the actual radio button */
.radio-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.radio_font{
	font-size: 20px;
}

#user_rcp_content{
	
}
#summer_table{
	width: 1120px;
	border-collapse:collapse; 
}
.summer_btn{
	width: 100px; height: 50px;
	color: white;
	background-color: #878787;
	border-radius: 30px;
	font-size: 18px;
	border: none;
}

.clean{
	clear: both;
}
</style>
<!-- <script type="text/javascript">
      // HTML 요소 가져오기
      var total_btn = document.getElementById("total_btn");
      var increaseButton = document.getElementById("increase_ing");

      // 클릭 이벤트 리스너 추가
      var count = 1;
      increaseButton.addEventListener("click", function() {
          count++;
          total_btn.textContent = count;
      });
</script> -->
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
			<!-- 레시피 제목 -->
			<div class="left_margin" style="margin-top: 60px; float: left;">
				<span class="font_32">레시피 제목 : </span> 
				  <input type="text" class="input_tomato" placeholder="레시피 제목을 입력해주세요.">
			</div>
			
			<!-- 대표사진 등록 -->
			<div style="margin-left: 100px; margin-top: 200px;">
				<div>
					<span class="font_32">대표사진 등록 </span> 
					<button class="input_tomato" style="margin-left: 50px; color: white; width: 200px; background-color: tomato; height: 50px;">사진첨부하기 + </button>
					<div>
						<img src="resources/images/public_sample1.png" style="margin-top: 35px;">
					</div>
					<div style="margin-top: 20px;">
						이미지는 320 x 320px을 권장합니다.<br>
						※ 게시판에 상단의 이미지가 노출됩니다. ※
					</div>
					<div class="vertical-line" style="margin-left: 620px; margin-top: -480px;"></div>
				</div>
			</div>
			
			<!-- 오른쪽 입력부 -->
			<div>
				<!-- 카테고리 -->
				<div>
					<span class="font_32 left_margin_70 float_left margin_left_70" style="position:relative; left: 700px; top:-470px;">카테고리</span>
					<form action="/category_sel.do">
					  <!-- <label for="cars" class="input_tomato" style="float: right;"></label> -->
					  <!-- dropdown 박스 -->
					  <select name="cars" id="cars" class="input_tomato" style="float: right; margin-right: 50px; margin-top: -470px; color: #606060">
					    <option value="select_category">카테고리를 선택하세요.</option>
					    <option value="select_steam">찌기</option>
					    <option value="select_boil">끓이기</option>
					    <option value="select_cook">굽기</option>
					    <option value="select_stir">볶기</option>
					    <option value="select_fry">튀기기</option>
					    <option value="select_etc">기타</option>
					  </select>
					  <br><br>
					</form>
				</div>
				
				<!-- 조리방법 -->
				<div>
					<span class="font_32 left_margin_70 float_left margin_left_70" style="position:relative; left: 700px; top:-400px;">조리방법</span>
					<form action="/category_sel.do">
					  <!-- <label for="cars" class="input_tomato" style="float: right;"></label> -->
					  <!-- dropdown 박스 -->
					  <select name="cars" id="cars" class="input_tomato" style="float: right; margin-right: 50px; margin-top: -397px; color: #606060">
					    <option value="select_category">조리방법을 선택하세요.</option>
					    <option value="select_steam">밥</option>
					    <option value="select_boil">국&찌개</option>
					    <option value="select_cook">일품</option>
					    <option value="select_stir">반찬</option>
					    <option value="select_fry">후식</option>
					    <option value="select_etc">기타</option>
					  </select>
					  <br><br>
					</form>
				</div>
				
				<!-- 조리 난이도 -->
				<div>
					<span class="font_32 left_margin_70 float_left margin_left_70" style="position:relative; top:-325px; float: right; margin-right: 380px;">조리 난이도</span>
					<form action="/action_page.php" style="float: right; margin-top: -260px; margin-right: -470px;">
						  <input type="radio" id="html" class="radio_font checkmark"  name="fav_language" value="newbie_lev"  >
						  <label for="html" class="radio_font">초급 냠냠</label>
						  <input type="radio" id="css" class="radio_font checkmark" name="fav_language" value="middle_lev">
						  <label for="css" class="radio_font">중급 냠냠</label>
						  <input type="radio" id="javascript" class="radio_font checkmark" name="fav_language" value="advanced_lev">
						  <label for="javascript" class="radio_font">상급 냠냠</label>
					</form>
				</div>
				
				<!-- 냠냠 키워드 -->
				<div>
					<span class="font_32" style="float: left; margin-left: 100px;">냠냠 키워드</span>
					<br><br><br>
					<p></p>
					<div>
						<span class="font_32" style="color:#606060; float: left; margin-left: 60px;">#</span>
						<input type="text" class="input_tomato" style="margin-left: 20px;" placeholder="해시태그를 입력해주세요.">					
					</div>
				</div>
				
				<!-- 요리 팁 + 임시저장 -->
				<div>
					<!-- 임시저장 표시 -->
					<div style="margin: auto; margin-top: 30px; width: 600px; height:250px; border-radius: 10px; background-color:#FFDADA; text-align: center;">
						<div style="margin: auto; text-align: center; position:relative; top: 30px;">
							<p class="font_32" style="margin: auto; margin-top: 50px;">${urvo.u_rcp_time}2023-08-23 23:07</p>
							<p class="font_32">임시저장된 레시피가 있습니다.<br>
								이어서 작성하시겠습니까?
							</p>
							<div style="position: relative; top: 30px;">
							<button style="background-color: white; width: 80px; height: 30px; font-size: 20px; border-radius: 5px; border: none;">예</button>
							<button style="background-color: white; width: 80px; height: 30px; font-size: 20px; border-radius: 5px; border: none;">아니오</button>
							</div>
						</div>
					</div>
					<!-- 요리 팁 -->
					<div>
						<span class="font_32 left_margin" style="float: left;">요리 Tip</span>
						<br>
						<!-- 요리팁 작성 -->
						<div style="margin-top: 50px;">
							<form style="margin-top: -20px;" action="/action_page.php">
							  <textarea id="content-textarea" class="left_margin" placeholder="해당 요리에 대한 간단한 설명이나 Tip을 적어주세요." style="width: 1120px; height: 180px; 
							  border-radius: 5px; border-width: 3px; font-size: 20px; border-color: tomato; resize: none;"></textarea>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 재료 입력 -->
				<div>
					<!-- 재료를 입력해주세요. -->
				<!-- 	<div style="margin-top: 30px;">
						<span class="font_32 left_margin" style="float: left;">재료를 입력해주세요</span>
						<button id="increase_ing" class="input_tomato" style="margin-left: 20px; color: #606060; width: 150px; border: none; background-color: #EEF1F4; height: 44px; position: relative; top: 1px;">재료 추가 + </button>
					</div> -->
					<div style="margin-top: 30px;">
						<!-- 클릭할 때마다 1줄씩 생성 -->
						<%-- <c:forEach var="k" begin="1" step="2" end="21">
							<input type="text" id="ing_box${k}" class="input_tomato left_margin" style="border-color: #21730B; width:510px; height: 50px;" placeholder="ex) 두부 1모 ${k}">
							<input type="text" id="ing_box${k+1}" class="input_tomato left_margin" style="border-color: #21730B; width:510px; height: 50px;" placeholder="ex) 두부 1모 ${k+1}">
							<p style="margin-top: 10px;"></p>
						</c:forEach> --%>
						<div>
						    <!-- 재료를 입력해주세요. -->
						    <div style="margin-top: 30px;">
						        <span class="font_32 left_margin" style="float: left;">재료를 입력해주세요</span>
						        <button id="increase_ing" class="input_tomato" style="margin-left: 20px; color: #606060; width: 150px; border: none; background-color: #EEF1F4; height: 44px; position: relative; top: 1px;">재료 추가 + </button>
						    </div>
						    <div class="container" id="ingredientsContainer" style="margin-top: 30px;">
						        <!-- 클릭할 때마다 1줄씩 생성 -->
						    </div>
						</div>

					</div>
				</div>
				
<script type="text/javascript">
	var fieldCount = 0;

	document.addEventListener("DOMContentLoaded", function() {
	    var increaseButton = document.getElementById("increase_ing");
	    increaseButton.addEventListener("click", function() {
	        createIngredientField();
	    });
	});

	function createIngredientField() {
	    var ingredientsContainer = document.getElementById("ingredientsContainer");

	    if (fieldCount < 20) {
	        fieldCount++;

	        var input = document.createElement("input");
	        input.type = "text";
	        input.id = "ing_box" + fieldCount;
	        input.className = "input_tomato left_margin";
	        input.style = "border-color: #21730B; width: 510px; height: 50px;";
	        input.placeholder = "ex) 두부 1모 " + fieldCount;

	        if (fieldCount % 2 === 1) {
	            /* input.style.float = "left"; */
	            input.style.marginBottom = "15px";
	        } else {
	            input.style.float = "right";
	            input.style.marginRight = "100px";
	            input.style.marginBottom = "15px";
	        }
	        ingredientsContainer.appendChild(input);
	    }
	}
</script>
				
				
				<!-- 자유롭게 입력 -->
				<div style="margin-top: 100px; ">
					<!-- <div class="horizontal-line_gray" style="margin-top: -20px; margin-bottom: 20px;"></div> -->
					<p class="font_32 left_margin" style="float: left;">상세 레시피를 자유롭게 입력해주세요</p>
				</div>
				
				<!-- summernote -->
				<div>
					<table class="left_margin" id="summer_table" style="margin-top: 30px;">
						<tr>
							<td colspan="2">
								<textarea rows="10" cols="60" name="content" class="left_margin" id="user_rcp_content" style="margin-left: 100px;"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div>
				<!-- 썸머노트 버튼 -->
				<div style="margin-top: 50px;">
					<button class="summer_btn left_margin">취소</button>
					<button class="summer_btn" style="background-color: tomato; float: right; margin-right: 100px;">글쓰기</button>
					<button class="summer_btn" style="float: right; ">임시저장</button>
				</div>
				
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
	
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    	<script src="resources/js/summernote-lite.js"></script>
    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
    	<script type="text/javascript">
    	$(function(){
    		$('#user_rcp_content').summernote({
    			lang : 'ko-KR',
    			height : 800,
    			disableResizeEditor: true,
    			focus : true,
    			callbacks : {
    				onImageUpload :  function(files, editor){
    					for (var i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
    				}
    			}
			});
    	});
    	function sendImage(file, editor) {
			var frm = new FormData();
			frm.append("s_file",file);
			$.ajax({
				url : "/saveImage.do",
				data : frm,
				type : "post",
				contentType : false,
				processData : false,
				dataType : "json",
			}).done(function(data) {
				var path = data.path;
				var fname = data.fname;
				$("#content").summernote("editor.insertImage",path+"/"+fname);
			});
		}
    	
   	</script>
	
</body>
	
</html>