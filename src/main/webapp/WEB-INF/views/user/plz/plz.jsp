<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
	<link rel="stylesheet" href="resources/css/user/recipe/search_list.css?after" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="icon" type="image/x-icon" href="resources/images/icon_tomato.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js?after"></script>
<script src="resources/js/user/recipe/search_list.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
		 font-family: 'Yeongdeok_TTF';
    }
    
 #sidebar-right {
	float: left;
	width: 15.625%;
}

#sidebar-left {
	width: 15.625%;
	float: left;
	
}

#content {
	width: 68.75%;
	float: left;
	margin-top: 0px;
}


#footer {
	left: 0px;
	color: #fff;
	width: 100%;
	clear: left;
	padding-top: 100px;
}

.text{
	font-size: 24px;
	background: tomato;
	color: white;
}
.margin{
	margin-left:100px;
	margin-top: 10px;
}
.top{
	margin-top: 60px;
}
.box{
	border: 3px solid tomato;
	border-radius: 40px;
	border-top-width: 40px;
	border-bottom-width: 40px;
	width: 1120px;
	height: 1000px;
	margin-left: 100px;
	background: rgb(248,248,248);
}
.arrow{
	width: 300px;
	height: 150px;
	float: left;
	margin-top: 20px;
}
.ref_top{
	margin-left: 250px;
	margin-top: 10px;
}
.click{
	color: tomato;
	font-size: 128px;
	font-weight: bold;
	float: left;
}
.clean{
clear: both;
}
.guide{
	margin-left: 320px;
	float: left;
	color: black;
}
#gif-container{
	margin-left: 180px;
}
.hidden-input{
	float: left;
	 opacity: 0;
    transition: opacity 2s cubic-bezier(1, 0, 1, 1);
}
.input_text{
	width:80px;
	height:30px;
	font-size: 14px;
	position: relative;
	left: -102px;
	
}

.search{
	margin-top:15px;
	width:1120px;
	display: flex;
	align-content:center;
	justify-content: center;
}

.bt{
	
	border: none;
	background: tomato;
	color: white;
	font-size: 25px;
	font-weight: bold;
	width: 222px;
	height: 65px;
	border-radius: 36px;
	
}

#input-stack{
	width:1120px;
	display: flex;
	align-content:center;
	justify-content: center;
}
.center{
	margin-left: 74px;
}
.container{
	margin-top: 50px;
}
.off{
	display: none;
}

</style>

</head>
<body>
	<div id="mydiv">
		
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div class="margin top"><span class="text">우리집 냉장고 속에 있는 이런 재료론 어떤 요리가?</span></div>
			<div class="margin"><span class="text">아래 냉장고를 클릭해서 우리집 냉장고에 있는 재료를 입력하세요!</span></div>
			<div class="margin box">
				<div class="clean"><div class="ref_top"><img class="arrow" src="/resources/images/arrow_tomato.png"><span class="click">Click!</span></div>
				</div>
				<div class="guide"><span>※최대 3개의 재료까지 등록 가능합니다</span></div>
				<div id="gif-container"><img class="ref" id="gif-image" src="/resources/images/move_refrige.gif"></div>
				<div id="input-stack">
					<div class="clean">
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input id="input1" class="input_text" type="text" name="input1"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input id="input2" class="input_text" type="text" name="input2"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input id="input3" class="input_text" type="text" name="input3"></div>
					</div>
				</div>
					<div class="search"><button id="rcp_search_bt" class="bt" onclick="searchbt(0)">레시피 검색</button></div>
			</div>
			<!-- 냉장고 끝 -->
			<div id="onoff" class="off">
			<!-- 검색시 시작 -->
			<div class="container">
				<div class="row mx-5">
				<div class="col-10">
					<span class="search_subject">검색된 냠냠's 쉐프레시피는 총</span> <span class="search_count">${u_list.size()}</span> <span class="search_subject">개 입니다.</span>
				</div>
				<div id="u_order_hit" class="col-1 tab-on" onclick="searchbt(0)">
					<span>조회순</span>
				</div>
				<div id="u_order_grade" class="col-1 tab-off" onclick="searchbt(1)">
					<span>평점순</span>
				</div>
			</div>
			</div>
			
			<!-- 레시피 출력 시작 -->
			
			<!-- 콘텐츠공간 -->
			<div id="flexContainer" class="flexContainer">
				 
			</div>
			<div id="plusbt" class="d-flex justify-content-center my-5">
			<c:if test="${u_list.size()>4 }">
				<button type="button" class="btn btn-lg text-white"
				 style="background-color: tomato" id="btn_append">더보기</button>
			</c:if>
			</div>
			<!-- 레시피 출력끝  -->
			</div>
		</div>
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
			</aside>
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var gifContainer = document.getElementById("gif-container");
    var gifImage = document.getElementById("gif-image");
    var inputStack = document.getElementById("input-stack");
    var hiddenInputs = inputStack.querySelectorAll(".hidden");
    var clickCount = 0;
		
    
	 // 1. 클릭 시에만 GIF 재생
    gifContainer.addEventListener("click", function() {
             gifImage.src = "/resources/images/move_refrige.gif"; 
                 hiddenInputs[clickCount].style.opacity = "1";
             clickCount++
    });      
 	
    // 페이지 이탈 시 클릭 횟수 및 이미지 초기화
    window.addEventListener("beforeunload", function() {
        clickCount = 0;

        for (var i = 0; i < hiddenInputs.length; i++) {
            hiddenInputs[i].style.display = "none"; // 이미지 숨김
        }
    });
});


	
	
</script>
<script type="text/javascript">

        var order ;
    function searchbt(order) {
    	$("#flexContainer").empty();
    	var inputValues = [
            $("#input1").val().trim(),
            $("#input2").val().trim(),
            $("#input3").val().trim()
        ];
    	
    	if ( $("#input1").val().trim() === "" && $("#input2").val().trim() === "" &&  $("#input3").val().trim() === "") {
            return;
        }
    	 var idx = 0;
    		
    	
    	 loadMoreData();
    	 function loadMoreData() {
    		
    	 $.ajax({
             type: "POST",  // 요청 메서드 (POST로 설정)
             url: "/openRef.do",  // 컨트롤러 URL을 입력하세요.
             data: {inputValues: inputValues , order: order, idx: idx},  // 배열을 직접 보냅니다.
             traditional: true,  // 배열을 전송할 때 jQuery가 기본적으로 사용하는 스타일을 사용합니다.
             success: function(response) {
            	 for (var i = idx; i < idx + 4 && i < response.length; i++) {
                     var k = response[i];
                     var newRecipe = '';
                     newRecipe += '<div class="u_recipe_one">';
                     newRecipe += '    <a href="/사용자레시피?rcp_seq=' + k.rcp_idx + '">';
                     newRecipe += '        <p><img src="' + k.u_rcp_img + '" class="recipe_thumbnail"></p>';
                     newRecipe += '        <p>' + k.u_rcp_title + '</p>';
                     newRecipe += '        <div class="writer">';
                     newRecipe += '            <img src="' + k.m_image + '" class="profile"><span>' + k.m_nick + '</span>';
                     newRecipe += '        </div>';
                     newRecipe += '    </a>';
                     newRecipe += '    <div class="like" style="text-align: right;">';
                     newRecipe += '        <img class="icon" src="/resources/images/icon_tomato_ver2_1.png" alt="">';
                     newRecipe += '        <span>' + (k.avg_grade ? k.avg_grade : 0) + '</span>';
                     newRecipe += '        <img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">';
                     newRecipe += '        <span>' + (k.c_count ? k.c_count : 0) + '</span>';
                     newRecipe += '        <img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png" alt="">';
                     newRecipe += '        <span>' + (k.u_rcp_hit ? k.u_rcp_hit : 0) + '</span>';
                     newRecipe += '    </div>';
                     newRecipe += '</div>';
            	  $("#flexContainer").append(newRecipe);
                      
            	 }
            	 
            	 idx += 4;
            	 if (idx >= response.length) {
                     $("#btn_append").hide(); // 모든 데이터를 로드한 경우 버튼 숨기기
                 }else{
                	 var moreButton = '<button type="button" class="btn btn-lg text-white" style="background-color: tomato" id="btn_append">더보기</button>';
                     $("#plusbt").empty().append(moreButton);
                 }
             },
             error: function(error) {
                 // 에러 처리 코드를 작성합니다.
             }
         });
    	}
    	
	  var container = document.getElementById("onoff");
	  if (container.classList.contains("off")) {
		  container.classList.remove("off");
	  }
	  
	// 더보기 버튼 클릭 시 추가 데이터 로딩
	    $(document).on("click","#btn_append", function () {
	        loadMoreData();
	    });
	
	    if(order==1){
			$("#u_order_hit").attr("class","col-1 tab-off")
			$("#u_order_grade").attr("class","col-1 tab-on")
		}
	    if(order==0){
			$("#u_order_hit").attr("class","col-1 tab-on")
			$("#u_order_grade").attr("class","col-1 tab-off")
		}
	    
}
    

</script>
</body>
</html>