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
				$(".select_box").val("0");
				$(".input_txf").val("");
				$(".start_date").val("");
				$(".end_date").val("");
				$("input:radio[name='btn_date']").prop("checked", false);
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
							<form action="" method="post">	
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
												<select class="btn-light form-select select_box">
													<option value="0" disabled selected>카테고리</option>
													<option value="1">1인분</option>
													<option value="2">채식</option>
													<option value="3">국물류</option>
													<option class="dropdown-item"  value="4">돈까스,
															일식</option>
													<option class="dropdown-item" value="5">고기,
															구이</option>
													<option class="dropdown-item" value="6">해산물</option>
													<option class="dropdown-item" value="7">분식</option>
													<option class="dropdown-item" value="8">면류</option>
													<option class="dropdown-item" value="9">죽</option>
													<option class="dropdown-item" value="10">술안주</option>
													<option class="dropdown-item" value="11">반찬</option>
													<option class="dropdown-item" value="12">후식</option>
													<option class="dropdown-item" value="13">기타</option>
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
									<div class="row justify-content-around align-items-center">
										<div class="col-4 col-xxl-auto fw-bold text-nowrap">기간
											조건</div>
										<div class="col-8 col-xxl">
											<div class="row px-4 mt-3">
												<div class="col pl-0 pr-0 pr-md-2 mb-2">
													<input type="date" name="start-date" class="btn btn-outline-secondary text-center rounded w-100 fw-bold start_date">
												</div>
												<div class="col pl-0 pl-md-2 pr-0">
													<input type="date" name="end-date" class="btn btn-outline-secondary text-center rounded w-100 fw-bold end_date">
												</div>
										<div class="col">
											<div class="btn_group" role="group"
												aria-label="Basic radio toggle button group">
												<div class="btn_empty">
													<input type="radio" class="btn-check" name="btn_date"
														id="btnradio1" autocomplete="off"> <label
														class="btn btn-outline-success" for="btnradio1">1일</label>
												</div>
												<div class="btn_empty">
													<input type="radio" class="btn-check" name="btn_date"
														id="btnradio2" autocomplete="off"> <label
														class="btn btn-outline-success" for="btnradio2">1주일</label>
												</div>
												<div class="btn_empty">
													<input type="radio" class="btn-check" name="btn_date"
														id="btnradio3" autocomplete="off"> <label
														class="btn btn-outline-success" for="btnradio3">1개월</label>
												</div>
											</div>
										</div>
											</div>											
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-12 col-xxl-auto text-xxl-start fw-bold">게시글
											상태</div>
										<div class="col">
											<div class="btn_group" role="group"
												aria-label="Basic radio toggle button group">
												<div class="btn_empty d-grid gap-2 col-6 mx-auto">
													<input type="radio" class="btn-check" name="btn_status"
														id="btnradio4"> <label
														class="btn btn-outline-success" for="btnradio4">게시중</label>
												</div>
												<div class="btn_empty d-grid gap-2 col-6 mx-auto">
													<input type="radio" class="btn-check" name="btn_status"
														id="btnradio5"> <label
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
													<button type="button" class="btn btn-success w-100 fw-bold" id="u_content_search" onclick="search.go()">검색</button>
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
                                            <td>${k.u_rcp_status == "3" ? "게시중" : "블라인드"}</td>
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