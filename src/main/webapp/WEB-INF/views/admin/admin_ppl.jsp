<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>냠냠레시피 관리자</title>
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
	height: 230px;
	border: none;
	margin-left: -80px;
}
.banner_left{
	margin-left: 150px;
}
.banner_right{
	margin-right: 150px;
	float: right;
}
.banner_top{
	margin-top: 100px;
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
.btn-comp.active {
  background-color: #17a2b8; /* 선택된 버튼의 배경색을 변경 */
  color: white; /* 선택된 버튼의 글자색을 변경 */
}
/* 라디오 버튼을 시각적으로 감추는 클래스 */
  .visually-hidden {
    position: absolute;
    clip: rect(0, 0, 0, 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
    overflow: hidden;
    white-space: nowrap;
}
/* 라디오 버튼의 크기 조정 */
 .btn-check.btn-comp:checked + .btn {
   padding: 20px 30px; /* 버튼의 패딩을 조정하여 크기 변경 */
   font-size: 16px; /* 글자 크기 변경 */
 }
 
   #below_btns {
      position: absolute;
      left: 290px;
      bottom: calc(14%); /* 반응형으로 top 위치 조정 */
      /* transform: translateY(calc(100px + max(0px, -370px - 100px))); /* 최소 top 위치 제한 */ */
      /* 나머지 스타일 설정 */
      background-color: lightgray;
    }
    
.margin_right_left{
	margin-left: 500px;
	margin-right: 500px;
}

.below_btns_c{
      display: flex;
      align-items: center; /* 요소들을 수직 가운데 정렬합니다 */
      padding: 10px;
    }
    #below_btns_r{
   	  position: absolute;
      right: 130px;
      bottom: calc(1%); /* 반응형으로 top 위치 조정 */
      /* transform: translateY(calc(100px + max(0px, -370px - 100px))); /* 최소 top 위치 제한 */ */
      /* 나머지 스타일 설정 */
    }
    
</style>

   

</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="admin_sidebar.jsp" />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<jsp:include page="admin_header.jsp" />
                
                <div class="container-fluid">
                    <h1 class="ml-5 mt-5 font-weight-bold">공지사항 배너등록</h1>
                    <hr>
			
                    <!-- 여기에서 작업하시면 됩니다. -->
                    <!-- <h2>여기에서 작업하시면됩니다.</h2> -->
                    <!-- 작업 시작!! -->
                   <div style="height: 150px;">
                   <div class="row mb-5 margin_right_left">
						<!-- 조회수 카드 -->
						<div class="col">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">공지사항 등록 현황</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">75</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/notice.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 총 방문자수 -->
						<div class="col">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">광고 등록 현황</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">75</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/advertisement.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                   
                    
                    <!-- 버튼그룹 -->
						<div class="btn-group btn-comp ml-5 mt-5" role="group" aria-label="Basic radio toggle button group" style="margin-top: -50px; position:relative; top: -80px;">
						  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio1" autocomplete="off" checked>
						  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio1">공지사항 관리</label>
						
						  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio2" autocomplete="off">
						  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio2">광고 관리</label>
						
						  <input type="radio" class="btn-check btn-comp visually-hidden" name="btnradio" id="btnradio3" autocomplete="off">
						  <label class="btn btn-outline-primary btn-group btn-comp" for="btnradio3">재료이미지 관리</label>
						</div>
                    </div>
                    
				    <!-- 공지사항 넣는 부분 -->
					<div id="bannerContainer" style="height: 90%; margin-top : -30px; margin-left: -130px; margin-bottom: 200px; background-color: white;">
					    <%-- <c:forEach var="nvo" items="${noticeList}" varStatus="status"> --%>
					  <%--   <c:forEach begin="1" end="6" step="1" varStatus="status">
					        <c:set var="isOdd" value="${status.index % 2 == 1}" />
					        <c:choose>
						        <c:when test="${status.index <= 6}">
							        <div id="banner_card_${status.index}" class="row card banner_size banner_${isOdd ? 'left' : 'left'} banner_top">
							            <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
							            <div class="card-body">	
							                <h5 class="card-title">${nvo.notice_title} 공지사항 ${status.index}</h5>
							                <p class="card-text">${nvo.notice_date} 2023/08/15</p>
							            </div>
						        	</div>
						        </c:when>
						        
						        <c:otherwise>
									<div id="banner_card_${status.index}" class="row card banner_size banner_${isOdd ? 'right' : 'right'} banner_top">
							            <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
							            <div class="card-body">
							                <h5 class="card-title">${nvo.notice_title} 공지사항 ${status.index}</h5>
							                <p class="card-text">${nvo.notice_date} 2023/08/15</p>
							            </div>
						        	</div>		        
						        </c:otherwise>
					        </c:choose>
					        
					   	 </c:forEach> --%>
					   	 
					   	 
						<c:forEach begin="1" end="6" step="1" varStatus="status" var="k">
							 <div id="banner_card_${status.index}" class="row card banner_size banner_${isOdd ? 'left' : 'left'} banner_top" style="float: left; margin-bottom: -50px; margin-left: 80px; right: -100px;">
								<input type="radio" id="radio_btn_${status.index}" class="btn-check btn-comp" name="btnradio" id="btnradio1" autocomplete="off" checked style="float: left; position: relative; top: -20px; left: 0px; width: 15px;">
					            <img src="resources/images/notice_exam.png" class="card-img-top" alt="...">
					                <h5 class="card-title">${nvo.notice_title} 공지사항 ${status.index}</h5>
					                <p class="card-text">${nvo.notice_date} 2023/08/15</p>
					                
<!-- 					            <div class="card-body">
					            </div>
 -->				        	</div>
						  
						</c:forEach>
							   	 
				    </div>
    
				    <!-- 하단 버튼 세개 -->
				    <div id="below_btns" class="below_btns_c" style="margin-bottom: -150px;">
				    	<button type="button" class="btn btn-success">삭제된 게시글</button>
				    </div>
				    <div id="below_btns_r">
						<button type="button" class="btn btn-success">등록</button>
						<button type="button" class="btn btn-success gray_btn">삭제</button>
				    </div>
                    <!-- 여기까지 작업하시면됩니다. -->


                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-danger" href="login.html">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
	
	<!-- 버튼 클릭 시 색상변경  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	  $(".btn-comp").click(function(){
	    /* $(".btn-comp").removeClass("active"); // 모든 버튼에서 active 클래스 제거 */
	    $(this).addClass("active"); // 선택된 버튼에 active 클래스 추가
	  });
	});
	</script>
</body>

</html>