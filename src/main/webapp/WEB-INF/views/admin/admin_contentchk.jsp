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
    <style type="text/css">
    	.btn_group{
    align-items: center;
    justify-content: center;
    display: flex;
}
.btn_empty{
    margin: 5px;
}
    
.date_size{
   	width: 300px;
   	height: 30px;
}	
   
select option[value=""][disabled] {
	display: none;
}
</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
    <script type="text/javascript">
    	$(function() {
			$("#reset_search").click(function() {
				$(".select_box").val("카테고리");
				$(".input_txf").val("");
				$("#startday").val("");
				$("#endday").val("");
				$("input:radio[name='btn_status']").prop("checked", false);
			});
		});
    	
    	$(function() {
    	    $(".btn_ok").on("click", function() {
    	            var result = confirm("블라인드 처리 하시겠습니까?");
    	            if (result) { // 사용자가 확인을 누른 경우
    	                $("input:hidden[name='btn_blindok']").show();
    	            } else { // 사용자가 취소를 누른 경우
    	                $("input:button[name='btn_blind']").prop("checked", false);
    	                $("input:button[name='btn_blind']").val("블라인드");
    	                $("input:button[name='btn_blind']").css("background-color", ""); // 배경 색상 제거
    	            }
    	    });
    	});
    	
    	$(document).ready(function () {
    	    // 1일 버튼 클릭시
    	    $("#btn_1day").on("click", function () {
    	        var inputStartday = $("#startday");
    	        var inputEndday = $("#endday");

    	        if (inputStartday.val() === "") {
    	            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜로 값 지정)
    	                var today = new Date().toISOString().substr(0, 10); // 오늘 날짜를 YYYY-MM-DD 형식으로 가져옴
    	                inputStartday.val(today);
    	                inputEndday.val(today);
    	            }
    	            else { //종료일을 기준으로 시작일도 같게 함
    	                inputStartday.val(inputEndday.val());
    	            }
    	        } else if (inputEndday.val() === "") { //시작일을 기준으로 종료일도 같게 함
    	            inputEndday.val(inputStartday.val());
    	        } else {  //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜로 값 지정)
    	            var today = new Date().toISOString().substr(0, 10);
    	            inputStartday.val(today);
    	            inputEndday.val(today);
    	        }
    	    });
    	    

    	    // 7일 버튼 클릭시
    	    $("#btn_7day").on("click", function () {
    	        var inputStartday = $("#startday");
    	        var inputEndday = $("#endday");

    	        if (inputStartday.val() === "") {
    	            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜를 기준으로 일주일 지정)
    	                var startday = new Date().toISOString().substr(0, 10);
    	                var oneWeekLater = new Date();
    	                oneWeekLater.setDate(oneWeekLater.getDate() + 7);
    	                var endday = oneWeekLater.toISOString().substr(0, 10);
    	                inputStartday.val(startday); // 오늘 날짜로 값 지정
    	                inputEndday.val(endday); // 일주일 후로 값 지정
    	            }
    	            else { //종료일을 기준으로 일주일 전을 시작일로 정함
    	                var endday = new Date(inputEndday.val());
    	                var startday = new Date(endday.toISOString().substr(0, 10));
    	                startday.setDate(endday.getDate() - 7);
    	                inputStartday.val(startday.toISOString().substr(0, 10));
    	            }
    	        } else if (inputEndday.val() === "") { //시작일을 기준으로 일주일 후를 종료일로 정함
    	            var startday = new Date(inputStartday.val());
    	            var endday = new Date(startday.toISOString().substr(0, 10));
    	            endday.setDate(startday.getDate() + 7);
    	            inputEndday.val(endday.toISOString().substr(0, 10));
    	        } else {  //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜를 기준으로 일주일 지정)
    	            var startday = new Date().toISOString().substr(0, 10);
    	            var oneWeekLater = new Date();
    	            oneWeekLater.setDate(oneWeekLater.getDate() + 7);
    	            var endday = oneWeekLater.toISOString().substr(0, 10);
    	            inputStartday.val(startday);
    	            inputEndday.val(endday);
    	        }
    	    });

    	    //1달 버튼 클릭시
    	    $("#btn_1month").on("click", function () {
    	        var inputStartday = $("#startday");
    	        var inputEndday = $("#endday");

    	        if (inputStartday.val() === "" && inputEndday.val() === "") {
    	            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜를 기준으로 한달 지정)
    	                var startday = new Date().toISOString().substr(0, 10);
    	                var oneWeekLater = new Date();
    	                oneWeekLater.setMonth(oneWeekLater.getMonth() + 1);
    	                var endday = oneWeekLater.toISOString().substr(0, 10);
    	                inputStartday.val(startday); // 오늘 날짜로 값 지정
    	                inputEndday.val(endday); // 한달 후로 값 지정
    	            }
    	            else { //종료일을 기준으로 한달 전을 시작일로 정함
    	                var endday = new Date(inputEndday.val());
    	                var startday = new Date(endday.toISOString().substr(0, 10));
    	                startday.setMonth(endday.getMonth() - 1);
    	                inputStartday.val(startday.toISOString().substr(0, 10));
    	            }
    	        } else if (inputEndday.val() === "") { //시작일을 기준으로 한달 후를 종료일로 정함
    	            var startday = new Date(inputStartday.val());
    	            var endday = new Date(startday.toISOString().substr(0, 10));
    	            endday.setMonth(startday.getMonth() + 1);
    	            inputEndday.val(endday.toISOString().substr(0, 10));
    	        } else { //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜를 기준으로 한달 지정)
    	            var startday = new Date().toISOString().substr(0, 10);
    	            var oneWeekLater = new Date();
    	            oneWeekLater.setMonth(oneWeekLater.getMonth() + 1);
    	            var endday = oneWeekLater.toISOString().substr(0, 10);
    	            inputStartday.val(startday);
    	            inputEndday.val(endday);
    	        }
    	    });
    	});
    	
    	function search_go(f) {
			var category =  $(".category").val();
			alert(category);
			var title = $(".input_txf").val();
			alert(title);
			var start_date = $("#startday").val();
			alert(start_date);
			var end_date = $("#endday").val();
			alert(end_date);
			var status = $("input:radio[name='btn_status']:checked").val();
			alert(status);
			f.submit();
		}
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom styles for this page -->
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
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

				<div class="container-fluid m-5">
					<h1 class="ml-5 mt-5 font-weight-bold">사용자 게시물 관리</h1>
					<hr>

					<!-- 여기에서 작업하시면 됩니다. -->	
					<div class="row justify-content-between">			
						<div
							class="col-6 mt-4 p-3 text-center rounded shadow w-75">
							<form action="/content_search.go" method="post">	
							<div class="card h-100">
								<h6
									class="card-header bg-light text-black-50 fw-bold small text-start">
									검색 조건</h6>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-auto fw-bold text-nowrap">검색어</div>
										<div class="col col-lg-auto mx-auto">
											<div class="dropdown">
												<select class="btn-light form-select select_box category">
													<option value="카테고리" disabled selected>카테고리</option>
													<option value="1인분">1인분</option>
													<option value="채식">채식</option>
													<option value="국물류">국물류</option>
													<option class="dropdown-item"  value="돈까스,일식">돈까스,
															일식</option>
													<option class="dropdown-item" value="고기,구이">고기,
															구이</option>
													<option class="dropdown-item" value="해산물">해산물</option>
													<option class="dropdown-item" value="분식">분식</option>
													<option class="dropdown-item" value="면류">면류</option>
													<option class="dropdown-item" value="죽">죽</option>
													<option class="dropdown-item" value="술안주">술안주</option>
													<option class="dropdown-item" value="반찬">반찬</option>
													<option class="dropdown-item" value="후식">후식</option>
													<option class="dropdown-item" value="기타">기타</option>
											</select>
											</div>
										</div>
										<div class="col-12 mt-2 col-lg mt-lg-0 mx-auto">
											<div class="input-group">
												<input type="text" class="form-control input_txf" aria-label="input"
													aria-describedby="inputGroup-sizing-default">
											</div>
										</div>
									</div>
								</li>
								<li class="list-group-item">
											<div class="row justify-content-between align-items-center">
												<div class="col-4 col-xl-auto fw-bold text-nowrap">기간
													조건</div>
												
												<div
													class="col-6 mt-2 pe-1 col-xxl mt-xxl-0 input-date-wrapper">
													<input type="date" id="startday" name="start_date"
														data-placeholder="시작일" required aria-required="true"
														class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
												</div>
												<div class="col-6 mt-2 ps-1 col-xxl mt-xxl-0">
													<input type="date" id="endday" name="end_date"
														data-placeholder="종료일" required aria-required="true"
														class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
												</div>
												<div class="col-4 mt-2 pe-1 col-xxl-auto mt-xxl-0">
													<button type="button" id="btn_1day"
														class="btn btn-outline-success w-100">1일</button>
												</div>
												<div class="col-4 mt-2 p-1 col-xxl-auto mt-xxl-0">
													<button type="button" id="btn_7day"
														class="btn btn-outline-success w-100">7일</button>
												</div>
												<div class="col-4 mt-2 ps-1 col-xxl-auto mt-xxl-0">
													<button type="button" id="btn_1month"
														class="btn btn-outline-success w-100">1달</button>
												</div>
											</div>
										</li>
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-12 col-xxl-auto text-xxl-start fw-bold">게시글
											상태</div>
										<div class="col">
											<div class="btn_group status" role="group"
												aria-label="Basic radio toggle button group">
												<div class="btn_empty d-grid gap-2 col-6 mx-auto">
													<input type="radio" class="btn-check" name="btn_status"
														id="btnradio4" value="게시중"> <label
														class="btn btn-outline-success" for="btnradio4">게시중</label>
												</div>
												<div class="btn_empty d-grid gap-2 col-6 mx-auto">
													<input type="radio" class="btn-check" name="btn_status"
														id="btnradio5" value="블라인드"> <label
														class="btn btn-outline-danger" for="btnradio5">블라인드</label>
												</div>
											</div>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row justify-content-between align-items-center">
										<div class="col-auto"></div>
										<div class="col-auto">
											<div class="row">
												<div class="col-auto">
													<button type="button"
														class="btn btn-outline-success w-100 fw-bold" id="reset_search">
														초기화 <i class="fa-solid fa-arrow-rotate-right"></i>
													</button>
												</div>
												<div class="col-auto">
													<button type="button" class="btn btn-success w-100 fw-bold" id="u_content_search" onclick="search_go(this.form)">검색</button>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
							</div>
							</form>
						</div> 
						<div class="col-3 mt-4" style="padding-right: 4%; padding-left: 4%;">
						<div class="row">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">총 조회수</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">75</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/search 1.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
							<div class="card border-left-success shadow h-100 py-2 mt-5">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">신규 등록 레시피</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">153</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/blogger 1.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>게시물 번호</th>
                                            <th>카테고리</th>
                                            <th>작성자</th>
                                            <th>레시피 제목</th>
                                            <th>찜</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                            <th>신고횟수</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${content_result}" var="k" varStatus=""> 
                                        <tr>
                                            <td>${k.rcp_idx}</td>
                                            <td>${k.m_idx}</td>
                                            <td>${k.u_rcp_title}</td>
                                            <td>${k.m_nick}</td>
                                            <td>${k.w_count}</td>
                                            <td>${k.u_rcp_hit}</td>
                                            <td>${k.u_rcp_time}</td>
                                            <td>${k.u_rcp_blind}</td>
                                            <td>${k.u_rcp_status == "3" ? "블라인드" : "게시중"}</td>
                                            <td class="d-flex justify-content-center">
	                                            		<div class="row">
												<div class="col-auto">
													<button type="button"
														class="btn btn-danger w-60" id="reset_search">
														블라인드</button>
												</div>
												<div class="col-auto">
													<button type="button" class="btn btn-secondary w-60" id="u_content_search">블라인드 취소</button>
												</div>
											</div>
                                            </td>
                                        </tr>
                                         </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
                    
                    <!-- 여기까지 작업하시면됩니다. -->


                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->
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
   <script src="resources/vendor/jquery/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js?after"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
    
</body>

</html>