<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저레시피 작성페이지</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<link rel="stylesheet"
	href="https://cdn.korzh.com/metroui/v4/css/metro-all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/user/award.css?after">
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/recipe/user_recipe_write.css">
<script type="text/javascript">
      // HTML 요소 가져오기
      var total_btn = document.getElementById("total_btn");
      var increaseButton = document.getElementById("increase_ing");

      // 클릭 이벤트 리스너 추가
      var count = 1;
</script>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	  // 페이지가 로드될 때 스크롤을 맨 위로 이동시키는 함수
	  function scrollToTop() {
	    window.scrollTo({ top: 0, behavior: 'smooth' });
	  }

	  // 페이지가 로드되면 맨 위로 스크롤
	  scrollToTop();
	});
	
	function name() {
		
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		// 대표사진 등록 사진 첨부 버튼 클릭시 실행될 메소드
		$("#fileInput").on("change", function() {
			var selectFile = this.files[0]; // 파일을 받는다

			const reader = new FileReader();
			
			reader.onload = function (e) {
			$('#thumnail_img_pick').attr("src", e.target.result );
			};
			
			reader.readAsDataURL(selectFile);
			
		});
	});	 
</script>
</head>
<body>

	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">
				<jsp:include page="../../recentlist.jsp" />
			</aside>
			<!-- 내용들 담은 form태그 시작 -->
			<form enctype="multipart/form-data" method="post" onsubmit="return write_go(this)" >
				<div id="content">
					<!-- 레시피 제목 -->
					<div class="left_margin" style="margin-top: 60px; float: left;">
						<span class="font_32">레시피 제목 : </span> <input type="text" name="u_rcp_title"
							value=${urvo.u_rcp_title }class="input_tomato" placeholder="레시피 제목을 입력해주세요.">
					</div>

					<!-- 대표사진 등록 -->
					<div style="margin-left: 100px; margin-top: 200px;">
						<div>
							<span class="font_32">대표사진 등록 </span> <label for="fileInput"
								id="fileInputLabel" class="input_tomato"> <!-- class="custom-file-input" -->
								<input type="file" id="fileInput" accept="image/*" name="u_rcp_img"></input> <!-- class="input_tomato" -->
								<span>사진첨부하기 +</span>
							</label>
							<div style="margin-top: 35px;">
								<img id="thumnail_img_pick"
									src="resources/user_image/user_thumnail/${urvo.u_rcp_img }" width="320px"
									height="320px">
							</div>
							<div style="margin-top: 20px;">
								이미지는 320 x 320px을 권장합니다.<br> ※ 게시판에 상단의 이미지가 노출됩니다. ※
							</div>
							<div class="vertical-line"
								style="margin-left: 620px; margin-top: -480px;"></div>
						</div>
					</div>

					<!-- 오른쪽 입력부 -->
					<div>
						<!-- 카테고리 -->
						<div>
							<span class="font_32 left_margin_70 float_left margin_left_70"
								style="position: relative; left: 700px; top: -470px;">카테고리</span>
							<!-- <form action="/category_sel.do"> -->
							<!-- <label for="cars" class="input_tomato" style="float: right;"></label> -->
							<!-- dropdown 박스 -->
							<select name="u_rcp_category1" id="cars" class="input_tomato"
								style="float: right; margin-right: 50px; margin-top: -470px; color: #606060">
								<c:choose>
								<c:when test="${ category_choice1 == 'select_category'}">
								<option value="select_category" selected>카테고리를 선택하세요.</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_category'}">
								<option value="select_category">카테고리를 선택하세요.</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_steam'}">
								<option value="select_steam" selected>찌기</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_steam'}">
								<option value="select_steam">찌기</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_boil'}">
								<option value="select_boil" selected>끓이기</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_boil'}">
								<option value="select_boil">끓이기</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_cook'}">
								<option value="select_cook" selected>굽기</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_cook'}">
								<option value="select_cook" >굽기</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_stir'}">
								<option value="select_stir" selected>볶기</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_stir'}">
								<option value="select_stir" >볶기</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_fry'}">
								<option value="select_fry" selected>튀기기</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_fry'}">
								<option value="select_fry" >튀기기</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_etc'}">
								<option value="select_etc" selected>기타</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_etc'}">
								<option value="select_etc">기타</option>
								</c:when>
								</c:choose>
							</select> <br> <br>
							<!-- </form> -->
						</div>

						<!-- 조리방법 -->
						<div>
							<span class="font_32 left_margin_70 float_left margin_left_70"
								style="position: relative; left: 700px; top: -400px;">조리방법</span>
							<!-- dropdown 박스 -->
							<select name="u_rcp_category2" id="cars" class="input_tomato"
								style="float: right; margin-right: 50px; margin-top: -397px; color: #606060">
								<c:choose>
								<c:when test="${ category_choice1 == 'select_category'}">
								<option value="select_category" selected>카테고리를 선택하세요.</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_category'}">
								<option value="select_category">카테고리를 선택하세요.</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_steam'}">
								<option value="select_rice" selected>밥</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_steam'}">
								<option value="select_rice">밥</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_boil'}">
								<option value="select_soup" selected>국&찌개</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_boil'}">
								<option value="select_soup">국&찌개</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_cook'}">
								<option value="select_bestone" selected>일품</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_cook'}">
								<option value="select_bestone" >일품</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_stir'}">
								<option value="select_side" selected>반찬</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_stir'}">
								<option value="select_side" >반찬</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_fry'}">
								<option value="select_afterEat" selected>후식</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_fry'}">
								<option value="select_afterEat" >후식</option>
								</c:when>
								<c:when test="${ category_choice1 == 'select_etc'}">
								<option value="select_etc" selected>기타</option>
								</c:when>
								<c:when test="${ category_choice1 != 'select_etc'}">
								<option value="select_etc">기타</option>
								</c:when>
								</c:choose>
							</select> <br> <br>
						</div>

						<!-- 조리 난이도 -->
						<div>
							<span class="font_32 left_margin_70 float_left margin_left_70"
								style="position: relative; top: -325px; float: right; margin-right: 380px;">조리
								난이도</span>
							<div
								style="float: right; margin-top: -260px; margin-right: -470px;">
								<c:choose>
								<c:when test="${ level == 'newbie_lev'}">
								  <input type="radio" id="html" class="radio_font checkmark"name="u_rcp_level" value="newbie_lev" checked>  
									<label for="html" class="radio_font">초급 냠냠</label>  
									</c:when> 
									<c:when test="${ level != 'newbie_lev'}">
								  <input type="radio" id="html" class="radio_font checkmark"name="u_rcp_level" value="newbie_lev" >  
									<label for="html" class="radio_font">초급 냠냠</label>  
									</c:when>
									<c:when test="${ level == 'middle_lev'}">
									<input type="radio" id="css" class="radio_font checkmark"name="u_rcp_level" value="middle_lev" checked>  
									<label for="css" class="radio_font">중급 냠냠</label>   
									</c:when>
									<c:when test="${ level != 'middle_lev'}">
									<input type="radio" id="css" class="radio_font checkmark"name="u_rcp_level" value="middle_lev">  
									<label for="css" class="radio_font">중급 냠냠</label>   
									</c:when>  
									<c:when test="${ level == 'advanced_lev'}">
									<input type="radio" id="javascript" class="radio_font checkmark" name="u_rcp_level" value="advanced_lev" checked>   
									<label	for="javascript" class="radio_font">상급 냠냠</label>
									</c:when>
									<c:when test="${ level != 'advanced_lev'}">
									<input type="radio" id="javascript" class="radio_font checkmark" name="u_rcp_level" value="advanced_lev" >   
									<label	for="javascript" class="radio_font">상급 냠냠</label>
									</c:when>
									
									<c:otherwise>
									  <input type="radio" id="html" class="radio_font checkmark"name="u_rcp_level" value="newbie_lev" checked>  
									<label for="html" class="radio_font">초급 냠냠</label>  
									<input type="radio" id="css" class="radio_font checkmark"name="u_rcp_level" value="middle_lev" >  
									<label for="css" class="radio_font">중급 냠냠</label>   
									<input type="radio" id="javascript" class="radio_font checkmark" name="u_rcp_level" value="advanced_lev" >  
									<label	for="javascript" class="radio_font">상급 냠냠</label>
									</c:otherwise>
									
									</c:choose>
							</div>
						</div>

						<!-- 냠냠 키워드 -->
						<div>
							<span class="font_32"
								style="margin-left: 100px; margin-bottom: 30px;">냠냠 키워드</span>
							<div style="margin-top: 30px;">
								<span class="font_32"
									style="color: #606060; float: left; margin-left: 60px; margin-top: -5px;">#</span>
								<input type="text" class="input_tomato" id="hashtag"
									name="u_rcp_keyword1" style="margin-left: 20px;" value="${urvo.u_rcp_keyword }"
									placeholder="해시태그를 입력후 enter를 눌러주세요." required oninvalid="this.setCustomValidity('해시태그를 입력해세요.')" oninput="this.setCustomValidity('')">
							</div>
						</div>

						<!-- 요리 팁 + 임시저장 -->
						<div>
					
							<!-- 요리 팁 -->
							<div>
								<span class="font_32 left_margin" style="float: left;">요리Tip</span>
								<br>
								<!-- 요리팁 작성 -->
								<div style="margin-top: 50px;">
									<!-- <form style="margin-top: -20px;" action="/action_page.php"> -->
									<div style="margin-top: -20px;">
										<textarea id="content-textarea" class="left_margin"	placeholder="해당 요리에 대한 간단한 설명이나 Tip을 적어주세요." name="u_rcp_tip"></textarea>
									</div>
									<!-- </form> -->
								</div>
							</div>
						</div>
						<!-- 재료 입력 -->
						<div>
							<div style="margin-top: 30px;">
								<div>
									<!-- 재료를 입력해주세요. -->
									<div style="margin-top: 30px;">
										<span class="font_32 left_margin" style="float: left;">재료를
											입력해주세요</span>
										<button type="button" id="increase_ing" class="input_tomato" onclick="increase_input()">재료추가	+</button>
									</div>
									<div class="container" id="ingredientsContainer"
										style="margin-top: 30px;">
										<!-- 클릭할 때마다 1줄씩 생성 -->
									</div>
								</div>
							</div>
						</div>


	<script type="text/javascript">
	/* 취소버튼 클릭시 한번더 의사 묻는 script */
	function cancel_btn() {
		if(confirm("작성을 취소하시겠습니까?")){
			history.go(-1);
		}
	}
	
</script>
<script type="text/javascript">
/* 해시태그 입력 후 enter 클릭시 칸 추가 */
 
$(document).ready(function() {
	$("#hashtag").keypress(function(e) {
		if(e.which === 13){
			e.preventDefault();
			// 해시태그 유효성 검사
			if($("#hashtag").val().length<=0){
				alert("해시태그를 입력해 주세요.");
				u_rcp_keyword1.focus();
				return;
			}
			
			var newhashtagInput = $('<input>').attr({
				type : 'text' ,
				class: 'input_tomato',
				style: 'margin-left: 20px;',
				placeholder: "해시태그는 2개까지 추가 가능합니다.",
				name: 'u_rcp_keyword2',
				id: 'hashtag1',
				required : true
			});
			
			$(this).after(newhashtagInput);
			newhashtagInput.focus();
			alert("해시태그는 2개까지 가능합니다.");
			return;
			
		}
	});
});	
</script>
<script type="text/javascript">
		var fieldCount = 0;
	var newInputField = 0;
	//for() 컨트롤러에서 값 가져올때 split으로 ,기준으로 잘라서 배열을 만들고 배열 크기만큼의 숫자 값을 넘겨줘서
	//for문을 실행한 후 각 칸에 해당하는 벨류값을 넣어준다.
	function increase_input() {
		
		if (fieldCount < 20) {
			if(fieldCount>0){
			 newInputField = $("#ing_box"+fieldCount);
			 if(newInputField.val().length<=0){
				alert("재료를 입력하고 추가 해주세요.");
				newInputField.focus();
				return false;
				}
			}
			 
		var new_input = $('<input>');
		fieldCount++;
		new_input.attr("type","text");
		new_input.attr("id","ing_box"+fieldCount);
		new_input.attr("class","input_green left_margin_80");
		new_input.attr("style","width:510px; height:50px; color:black;");
		new_input.attr("placeholder","ex) 두부 1모" + fieldCount);
		new_input.attr("name","u_rcp_ing"+fieldCount);
		new_input.attr("required","required");
		
		 if (fieldCount % 2 === 1) {
			 new_input.css({
				 'marginBottom':'15px'
			 });
	        } else {
	        	new_input.css({
					 'marginRight':'100px',
					 'float':'right',
					 'marginBottom':'15px'
				 });
	        }
		 $('#ingredientsContainer').append(new_input);
		 
		}
	};
	
	function write_go(f) {
			
		if(f.u_rcp_title.value.trim().length<=0){
			alert("제목을 입력해 주세요.");
			f.u_rcp_title.focus();
			return false;
		}
		
		if(f.u_rcp_category1.value.trim() == 'select_category'){
			alert("카테고리를 선택해 주세요");
			f.u_rcp_category1.focus();
			return false;
		}
		
		if(f.u_rcp_category2.value.trim() == 'select_category'){
			alert("카테고리를 선택해 주세요");
			f.u_rcp_category2.focus();
			return false;
		}
		
		if($("#hashtag").val().length<=0){
			alert("해시태그를 입력해 주세요");
			f.u_rcp_keyword1.focus();
			return false;
		}
		
	var u_rcp_status = 0;
	 var u_rcp_ing2 = [];
	 console.log("filedCount : " + fieldCount);
	for (var i = 0; i < fieldCount; i++) {	
		u_rcp_ing2[i-1] = $("#ing_box"+i).val();
	} 
		
	if(confirm("저장 하시겠습니까?") == true){
			//alert("저장해");
		f.action="/write_go?u_rcp_ing2="+u_rcp_ing2+"&u_rcp_status="+u_rcp_status;
		}else{
			//alert("저장안해");	
			return false;
		}
		
	}
	
	function limitWrite_go(f) {
		var result = ${result};
		console.log(result);
		if(result == 'have'){// have 임시저장글이 있지만 새로 작성하는상태에서 임시저장을 누른 경우
			if(confirm("기존 임시저장글은 삭제됩니다.\n임시저장하시겠습니까?") == true){
				
				if(f.u_rcp_title.value.trim().length<=0){
					alert("제목을 입력해 주세요.");
					f.u_rcp_title.focus();
					return false;
				}
				
				var u_rcp_status = 2;
				 var u_rcp_ing2 = [];
				for (var i = 0; i < fieldCount; i++) {
					u_rcp_ing2[i-1] = $("#ing_box"+i).val();
				} 
				
				f.action="/write_go?u_rcp_ing2="+u_rcp_ing2+"&u_rcp_status="+u_rcp_status;
				f.submit();	
				
			}
			else{
				return false;
			}
		
		}else{
		if(confirm("임시저장은 한개의 게시글만 가능합니다.\n임시저장 하시겠습니까?") == true){
			// if() db에 로그인된 사용자의 m_idx를 가지고 u_recipe테이블에가서 기존글 확인하고
			// confirm창으로 기존에 임시저장된 게시글이 있습니다. 계속하시면 기존 임시저장글은 삭제됩니다. 진행하시겠습니까? 처리
			// true일 경우 controller 에서 update문으로 새로 작성한 임시저장글로 업데이트
		 if(f.u_rcp_title.value.trim().length<=0){
			alert("제목을 입력해 주세요.");
			f.u_rcp_title.focus();
			return false;
		}
		
		var u_rcp_status = 2;
		 var u_rcp_ing2 = [];
		for (var i = 0; i < fieldCount; i++) {
			u_rcp_ing2[i-1] = $("#ing_box"+i).val();
		} 
		
		f.action="/write_go?u_rcp_ing2="+u_rcp_ing2+"&u_rcp_status="+u_rcp_status;
		f.submit();	
		
	}else{
		return false;
	}
			
}// 임시저장된 게시글이 없을때 임시저장되는문 끝
		
}
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    var textarea = document.getElementById("content-textarea"); 
    textarea.addEventListener("focus", function() {
        textarea.style.borderColor = "tomato"; // Set the desired border color when focused
    });
    textarea.addEventListener("blur", function() {
        textarea.style.borderColor = "tomato"; // Set the original border color when focus is lost
    });
});
</script>
				<!-- 자유롭게 입력 -->
						<div style="margin-top: 100px;">
							<!-- <div class="horizontal-line_gray" style="margin-top: -20px; margin-bottom: 20px;"></div> -->
							<p class="font_32 left_margin" style="float: left;">상세 레시피를
								자유롭게 입력해주세요</p>
						</div>

						<!-- summernote -->
						<div>
							<table class="left_margin" id="summer_table" style="margin-top: 30px;">
								<tr>
									<td colspan="2"><textarea rows="10" cols="60" name="u_rcp_main" class="left_margin" id="u_rcp_main"	style="margin-left: 100px;"></textarea></td>
								</tr>
							</table>
						</div>
						<div>
							<!-- 썸머노트 버튼 -->
							<div style="margin-top: 50px; margin-bottom: 100px;">
								<button type="button" class="summer_btn left_margin" onclick="cancel_btn()" >취소</button> <!-- onclick="cancel_btn()" -->
								<button type="submit" class="summer_btn" style="background-color: tomato; float: right; margin-right: 100px;" >글쓰기</button>
								<button type="button" class="summer_btn" style="float: right;" onclick="limitWrite_go(this.form)" >임시저장</button>
								<!-- <input type="submit" class="summer_btn" style="float: right;" onclick="limitWrite_go(this.form)" >임시저장</input> -->
							</div>

						</div>
					</div>

					<!-- content 끝 -->
				</div>
				<!-- form태그 끝 -->
			</form>

			<aside id="sidebar-right">
				<jsp:include page="../../bestlist.jsp" />
			</aside>
			<div id="footer">
				<jsp:include page="../../footer.jsp" />
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
    	$(function(){
    		$('#u_rcp_main').summernote({
    			lang : 'ko-KR',
    			height : 800,
    			disableResizeEditor: true,
    			// focus : true,
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
				$("#u_rcp_main").summernote("editor.insertImage",path+"/"+fname);
			});
		}
   	</script>
</body>
</html>