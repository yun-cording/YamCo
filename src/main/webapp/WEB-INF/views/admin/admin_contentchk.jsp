<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1 class="ml-5 mt-5 font-weight-bold">사용자 게시물 관리</h1>
					<hr>

					<!-- 여기에서 작업하시면 됩니다. -->					
						<div class="card h-100 mb-5" style="width: 30%; margin-left: 10%;">
							<div class="col">
							<h6
								class="card-header bg-light text-black-50 fw-bold small text-start">
								검색 조건</h6>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-auto fw-bold text-nowrap">검색어</div>
										<div class="col col-lg-auto mx-auto">
											<div class="dropdown">
												<select class="btn-light form-select">
													<option value="" disabled selected>카테고리</option>
													<option value="1">1인분</option>
													<option value="1">채식</option>
													<option value="1">국물류</option>
													<option class="dropdown-item"  value="1">돈까스,
															일식</option>
													<option class="dropdown-item" value="2">고기,
															구이</option>
													<option class="dropdown-item" value="3">해산물</option>
													<option class="dropdown-item" value="4">분식</option>
													<option class="dropdown-item" value="5">면류</option>
													<option class="dropdown-item" value="6">죽</option>
													<option class="dropdown-item" value="7">술안주</option>
													<option class="dropdown-item" value="8">반찬</option>
													<option class="dropdown-item" value="9">후식</option>
													<option class="dropdown-item" value="10">기타</option>
											</select>
											</div>
										</div>
										<div class="col-12 mt-2 col-lg mt-lg-0 mx-auto">
											<div class="input-group">
												<input type="text" class="form-control" aria-label="input"
													aria-describedby="inputGroup-sizing-default">
											</div>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-4 col-xxl-auto fw-bold text-nowrap">기간
											조건</div>
										<div class="col-8 col-xxl"></div>
										<div class="card-body">
											<div class="row px-4 mt-3 justify-content-between">
												<div class="col-sm-6 pl-0 pr-0 pr-md-2 mb-2">
													<input type="date" name="start-date" class="date_size">
												</div>
												<div class="col-sm-6 pl-0 pl-md-2 pr-0">
													<input type="date" name="end-date" class="date_size">
												</div>
											</div>
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
								</li>
								<li class="list-group-item">
									<div class="row justify-content-around align-items-center">
										<div class="col-12 col-xxl-auto text-xxl-start fw-bold">게시글
											상태</div>
										<div class="col-6 order-3 col-sm-4 mt-2 col-xxl m-xxl-0">
											<button type="button"
												class="btn btn-outline-success w-100 fw-bold">게시중</button>
										</div>
										<div
											class="col-6 order-3 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
											<button type="button"
												class="btn btn-outline-success w-100 fw-bold">블라인드</button>
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
														class="btn btn-outline-success w-100 fw-bold">
														초기화 <i class="fa-solid fa-arrow-rotate-right"></i>
													</button>
												</div>
												<div class="col-auto">
													<button type="button" class="btn btn-success w-100 fw-bold">검색</button>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
							</div>
						</div> 
						<div class="col w-50">
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
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                        <tr>
                                            <td>1</td>
                                            <td>1인분</td>
                                            <td>김희준</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>0</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>채식</td>
                                            <td>박채림</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>12</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>국물류</td>
                                            <td>김재훈</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>125</td>
                                            <td>블라인드</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>돈가스, 일식</td>
                                            <td>김상우</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>1</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>고기, 구이</td>
                                            <td>이한주</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>0</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>해산물</td>
                                            <td>윤성훈</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>0</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>분식</td>
                                            <td>탁영송</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>0</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>면류</td>
                                            <td>강성진</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>12</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>죽</td>
                                            <td>권연준</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>2</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>술안주</td>
                                            <td>이수환</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>445</td>
                                            <td>블라인드</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td>반찬</td>
                                            <td>이소연</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>786</td>
                                            <td>블라인드</td>
                                            <td>상태변경</td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td>후식</td>
                                            <td>김민지</td>
                                            <td>레시피 제목</td>
                                            <td>500</td>
                                            <td>500</td>
                                            <td>2023-06-01</td>
                                            <td>12</td>
                                            <td>게시중</td>
                                            <td>상태변경</td>
                                        </tr>
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
    <script src="resources/vendor/jquery/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

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