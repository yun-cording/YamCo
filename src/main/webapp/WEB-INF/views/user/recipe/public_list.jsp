<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공공레시피</title>
<link rel="icon" type="image/x-icon"	href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/recipe/public_list.css?after" />
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<!-- 카테고리 만들기 -->
			<!-- <form id="sort_form" action="/public_list.do" method="GET"> -->
				<div id="category">
				    <div id="category_helmet"></div>
				    <ul id="howto_menu">
				        <li id="howto_first">조리방법</li>
				        <li class="howto_center">전체보기</li>
				        <li class="howto_center">굽기</li>
				        <li class="howto_center">끓이기</li>
				        <li class="howto_center">볶기</li>
				        <li class="howto_center">찌기</li>
				        <li class="howto_center">튀기기</li>
				        <li id="howto_etc">기타</li>
				    </ul>
				    <ul id="category_menu">
				        <li id="category_first">카테고리</li>
				        <li class="category_center">전체보기</li>
				        <li class="category_center">국&찌개</li>
				        <li class="category_center">일품</li>
				        <li class="category_center">밥</li>
				        <li class="category_center">반찬</li>
				        <li class="category_center">후식</li>
				        <li id="category_etc">기타</li>
				    </ul>
				</div>
			<!-- </form> -->
			<!-- 카테고리 끝 -->
			<!-- 레시피 출력 -->
			<!-- 콘텐츠공간 -->
			<div class="flexContainer">
				<c:forEach var="k" items="${listSummary}">
					<div class="recipe_one">
						<p>
						<!-- 메인이미지 클릭 시 해당 게시글 상세페이지로 이동 -->
						<a href="/go_publicDet.do?rcp_seq=${k.rcpSeq}">
							<img src="${k.attFileNoMain}" class="recipe_thumbnail">
						</p>
						<p>
							${k.rcpNm}
						</p>
						
							<div class="writer">
								<img
									src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
									class="profile"> <span>냠냠레시피</span>
							</div></a>
							<div class="like" style="text-align: right;">
							    <img class="icon" src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg" alt="">
							    <span>${empty k.avg_c_grade ? 0 : k.avg_c_grade}</span>
							    <img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
							    <span>${empty k.total_comments ? 0 : k.total_comments}</span>
							    <img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png" alt="">
							    <span>${empty k.p_rcp_hit ? 0 : k.p_rcp_hit}</span>
							    <%-- <span>${Math.round(empty k.p_rcp_hit ? 0 : k.p_rcp_hit)}</span> --%>
							</div>
							
						
					</div>
				</c:forEach>
			</div>
		<%-- 	<div class=pagecontainer>
				<ol class="paging">
					<li><a href=""> < </a></li>
					<li><a href=""> 1 </a></li>
					<li><a href=""> 2 </a></li>
					<li><a href=""> 3 </a></li>
					<li><a href=""> 4 </a></li>
					<li><a href=""> 5 </a></li>
					<li><a href=""> > </a></li>
				</ol>
			</div> --%>
			<!-- 레시피 출력끝  -->
		</div>
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
		</aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
	
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
	  	// JavaScript를 사용하여 클릭 이벤트 처리
	    var cookWay = document.querySelectorAll("#howto_menu li");
	  	var selectedWay="${selectedWay}"
	    var selectedCate="${selectedCate}"
	    
	    cookWay.forEach(function(item) {
	        item.addEventListener("click", function() {
	            // 클릭된 요소의 텍스트 내용을 얻습니다.
	            var selectedWay = item.textContent;
	            location.href = "/public_list.do?selectedWay="+selectedWay+"&selectedCate="+selectedCate
	            // 선택된 요소를 서버로 전달하는 AJAX 요청을 보냅니다.
	            // 이 부분은 실제로 서버와 통신하는 부분입니다.
	            // AJAX 요청을 보내는 방법은 jQuery나 Fetch API를 사용할 수 있습니다.
	            // 예를 들면, jQuery.ajax() 또는 fetch() 함수를 사용할 수 있습니다.
	            /* $.ajax({
	                type: "GET",
	                url: "/public_list.do", // Spring MVC 컨트롤러의 엔드포인트 URL
	                data: { selectedWay: selectedWay }, // 선택된 메뉴를 데이터로 전달
	                success: function (response) {
	                  	console.log('응답 : ',response)
	                },
	                error: function () {
	                    // 오류 발생 시 처리할 내용을 여기에 추가하세요.
	                } 
	            }); */
	        });
	    });
	  	// JavaScript를 사용하여 클릭 이벤트 처리
	     var category = document.querySelectorAll("#category_menu li");
	    
	    category.forEach(function(item) {
	        item.addEventListener("click", function() {
	            // 클릭된 요소의 텍스트 내용을 얻습니다.
	            var selectedCate = item.textContent;
	            location.href = "/public_list.do?selectedWay="+selectedWay+"&selectedCate="+selectedCate
	            // alert(selectedCate);
	            // 선택된 요소를 서버로 전달하는 AJAX 요청을 보냅니다.
	            // 이 부분은 실제로 서버와 통신하는 부분입니다.
	            // AJAX 요청을 보내는 방법은 jQuery나 Fetch API를 사용할 수 있습니다.
	            // 예를 들면, jQuery.ajax() 또는 fetch() 함수를 사용할 수 있습니다.
	            $.ajax({
	                type: "GET",
	                url: "/public_list.do", // Spring MVC 컨트롤러의 엔드포인트 URL
	                data: { selectedCate: selectedCate }, // 선택된 메뉴를 데이터로 전달
	                success: function (response) {
	                  	// alert("성공!");
	                },
	                error: function () {
	                    // 오류 발생 시 처리할 내용을 여기에 추가하세요.
	                }
	            });
	        });
	    });
    });
</script>



<!-- 
<script type="text/javascript">
$(document).ready(function () {
    // JavaScript를 사용하여 클릭 이벤트 처리
   /*  var form = document.getElementById("sort_form");
    alert("오류인가 메인");

 	// 폼 내에서 submit 이벤트가 발생할 때 서버로 데이터를 전송
    form.addEventListener("submit", function (event) {
        event.preventDefault(); // 폼의 기본 동작인 페이지 이동을 막음
        alert("오류인가 2");

        // 선택된 메뉴와 카테고리 값을 가져옴
        var selectedWay = document.querySelector("#howto_menu li.selected").textContent;
        var selectedCate = document.querySelector("#category_menu li.selected").textContent;

        // AJAX 요청을 보냅니다.
        $.ajax({
            type: "GET",
            url: "/public_list.do",
            data: {
                selectedWay: selectedWay,
                selectedCate: selectedCate
            },
            success: function (response) {
                // AJAX 요청이 성공하면 서버 응답을 처리할 수 있습니다.
                // 예를 들어, 응답 데이터를 사용하여 페이지의 특정 부분을 업데이트할 수 있습니다.
            },
            error: function () {
                // 오류 발생 시 처리할 내용을 여기에 추가하세요.
            }
        });
    }); */

    // 클릭 이벤트 처리 (선택된 메뉴 및 카테고리 변경)
/*     var cookWay = document.querySelectorAll("#howto_menu li");
    cookWay.forEach(function (item) {
        item.addEventListener("click", function () {
            // 선택된 메뉴 스타일링 변경
            document.querySelectorAll("#howto_menu li").forEach(function (li) {
                li.classList.remove("selected");
            });
            item.classList.add("selected");
        });
    });

    var category = document.querySelectorAll("#category_menu li");
    category.forEach(function (item) {
        item.addEventListener("click", function () {
            // 선택된 카테고리 스타일링 변경
            document.querySelectorAll("#category_menu li").forEach(function (li) {
                li.classList.remove("selected");
            });
            item.classList.add("selected");
        });
    }); */
    
    
	var howtoItems = document.querySelectorAll("#howto_menu li");
	var categoryItems = document.querySelectorAll("#category_menu li");

	// 메뉴 항목 클릭 이벤트 처리
	function handleMenuClick(item, menuType) {
	    // 클릭된 요소에 'selected' 클래스 추가
	    var items = menuType === 'howto' ? howtoItems : categoryItems;
	    items.forEach(function (li) {
	        li.classList.remove("selected");
	    });
	    item.classList.add("selected");

	    // 선택된 항목의 텍스트 내용을 얻습니다.
	    var selectedWay = menuType === 'howto' ? item.textContent : document.querySelector("#howto_menu li.selected").textContent;
	    var selectedCate = menuType === 'category' ? item.textContent : document.querySelector("#category_menu li.selected").textContent;

	    // 데이터를 폼의 URL 파라미터로 추가
	    var form = document.getElementById("sort_form");
	    form.action = "/public_list.do?selectedWay=" + encodeURIComponent(selectedWay) + "&selectedCate=" + encodeURIComponent(selectedCate);

	    // 폼을 서버로 제출
	    form.submit();
	}

	// 'howto_menu' 항목 클릭 이벤트 처리
	howtoItems.forEach(function (item) {
	    item.addEventListener("click", function () {
	        handleMenuClick(item, 'howto');
	    });
	});

	// 'category_menu' 항목 클릭 이벤트 처리
	categoryItems.forEach(function (item) {
	    item.addEventListener("click", function () {
	        handleMenuClick(item, 'category');
	    });
	});



    
});
</script> -->

	
</body>
</html>