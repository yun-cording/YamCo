<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
.banner_size{
	width: 450px;
	height: 150px;
	border: none;
}
.banner_left{
	margin-left: 150px;
}
.banner_right{
	margin-right: 150px;
	float: right;
}
.banner_top{
	margin-top: 150px;
}
.gray_btn{
	background-color: gray;
	border-color: gray;
}
.gray_btn_reverse{
	background-color: gray;
	border-color: gray;
}
.stats{
    width: 65%;
    border-radius: 50%;
    margin: 0 auto;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
}
.stats_frame{
	width: 500px;
}
.btn_color_temp{
	background-color: rgba(25, 135, 84);
	color: white;
}
.btn-group:active{
	background-color: white;
	color: white;
}
.btn-group.active{
	background-color: white;
	color: white;
}
.btn-group:active {background : red}

.btn-group.active
{
  color: red;
  background-color:red;
}

.active{
  background-color:red;
  color: red;

}

.btn.active
{
  color: red;
  background-color:red;
}

[type="radio"]:checked { border-color: red;
color: red;
background-color: red;
 }
 [class="btn"]:checked { border-color: red;
color: red;
background-color: red;
 }
 
  .btn-comp.active {
    background-color: #17a2b8; /* 선택된 버튼의 배경색을 변경 */
    color: white; /* 선택된 버튼의 글자색을 변경 */
  }


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $(".btn-comp").click(function(){
	    /* $(".btn-comp").removeClass("active"); // 모든 버튼에서 active 클래스 제거 */
	    $(this).addClass("active"); // 선택된 버튼에 active 클래스 추가
	  });
	});
	/* 
	function switch_to_green(el){

		  //Check clicked button is on the same group
		  if(el.parentElement.getAttribute("btn") == 1){
		  //Get all buttons of group 1
		  let g1_buttons = document.querySelectorAll('#group1 .btn');
		  for(let i =0; i<g1_buttons.length;i++){
		    //Remove green color from unselected buttons
		    g1_buttons[i].classList.remove('green');
		  }
		  }else{
		  //Get all buttons of group 2
		  let g2_buttons = document.querySelectorAll('#group2 .btn');
		  for(let i =0; i<g2_buttons.length;i++){
		    //Remove green color from unselected buttons
		    g2_buttons[i].classList.remove('green');
		  }
		  }
		  //Add green color to the only selected one
		  el.classList.add('green');
		} */
		
</script>
</head>
<body>
<!-- body div -->
<div>
	<!-- 버튼그룹 -->
	<div class="btn-group btn-comp" role="group" aria-label="Basic radio toggle button group">
	  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio1" autocomplete="off" checked>
	  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio1">Radio 1</label>
	
	  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio2" autocomplete="off">
	  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio2">Radio 2</label>
	
	  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio3" autocomplete="off">
	  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio3">Radio 3</label>
	</div>
	
	
	<!-- 라운드버튼 2개 -->
	<div class="row">
		<div class="card" style="width: 8rem;">
		  <img src="resources/images/java2.png" class="card-img-top stats" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <p class="card-text">content.</p>
		  </div>
		</div>
		<div class="card" style="width: 8rem;">
		  <img src="resources/images/java2.png" class="card-img-top stats" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <p class="card-text"> content.</p>
		  </div>
		</div>
	</div>
	
	<!-- 상단 메뉴 탭 3개 -->
	<div>
		<ul class="nav nav-pills">
	  <li class="nav-item">
	    <!-- <a class="nav-link active btn_color_temp" aria-current="page" href="#">Active</a> -->
	  </li>
	  <li class="nav-item">
	    <a class="nav-link btn_color_temp" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link btn_color_temp" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link btn_color_temp" href="#">Disabled</a>
	  </li>
		</ul>
	</div>

	<!-- 상단 버튼 세개 => 관리 탭들 + 오왼 이동버튼 -->
	<div>
		<button type="button" class="btn btn-success">공지사항 관리</button>
		<button type="button" class="btn btn-success">광고 관리</button>
		<button type="button" class="btn btn-success">재료 이미지 관리</button>
		<button type="button" class="btn btn-success float-right"> &lt; </button>
		<button type="button" class="btn btn-success float-right"> > </button>
	</div>
	
	
	
	
	<!-- 공지사항 넣는 부분 -->
    <div>
	<%-- 	<div id="banner_card" class="card banner_size banner_left banner_top">
		  <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">${nvo.notice_title}공지사항6</h5>
		    <p class="card-text">${nvo.notice_date}2023/08/15</p>
		  </div>
		</div> --%>
	<%-- 	<div class="card banner_size banner_right banner_top" style="margin-top: -50px;">
		  <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">${nvo.notice_title}공지사항6</h5>
		    <p class="card-text">${nvo.notice_date}2023/08/15</p>
		  </div>
		</div> --%>
	</div> 
	<div id="bannerContainer">
	<div class="row">
    <%-- <c:forEach var="nvo" items="${noticeList}" varStatus="status"> --%>
    <c:forEach begin="1" end="6" step="1" varStatus="status">
        <c:set var="isOdd" value="${status.index % 2 == 1}" />
        <c:choose>
	        <c:when test="${status.index <= 6}">
		        <div id="banner_card_${status.index}" class="card col-md-6 banner_size banner_${isOdd ? 'left' : 'left'} banner_top">
		            <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
		            <div class="card-body">
		                <h5 class="card-title">${nvo.notice_title} 공지사항 ${status.index}</h5>
		                <p class="card-text">${nvo.notice_date} 2023/08/15</p>
		            </div>
		        </div>
	        </c:when>
	        
	        <c:otherwise>
				<div id="banner_card_${status.index}" class="card col-md-6 banner_size banner_${isOdd ? 'right' : 'right'} banner_top">
		            <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
		            <div class="card-body">
		                <h5 class="card-title">${nvo.notice_title} 공지사항 ${status.index}</h5>
		                <p class="card-text">${nvo.notice_date} 2023/08/15</p>
		            </div>
	        	</div>		        
	        </c:otherwise>
        </c:choose>
        
    </c:forEach>
    </div>
    
    <!-- 하단 버튼 세개 -->
    <div style="margin-top: 100px;">
    	<button type="button" class="btn btn-success">삭제된 게시글</button>
		<button type="button" class="btn btn-success">등록</button>
		<button type="button" class="btn btn-success gray_btn">삭제</button>
    </div>
    
</div>
	


</div>
</body>
</html>