<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>냠냠레시피 관리자</title>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
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
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h2 font-weight-bold mb-2 text-gray-800">대시보드</h1>
					<p class="small mb-4">안녕하세요 ${m_nick }님! 관리자 페이지에 로그인 하셨습니다.</p>
					<!-- 맨윗줄 -->
					<div class="row mb-5">
						<!-- 조회수 카드 -->
						<div class="col">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">총 조회수</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.hit_total }</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/search 1.png" alt=""
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
												<span class="font-weight-bold font">총 방문자 수</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.visit_total }</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/web-traffic 1.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">신규 회원등록</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.client_new }</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/user 1.png" alt="" width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">신규 등록 레시피</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${vo.recipe_new }</div>
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
					<div class="row">
						<!-- 통계 한눈에 보기 -->
						<div class="col-6">
							<div class="card h-100 shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header">
									<h6 class="m-0 mb-3 pt-3 font-weight-bold text-success">통계
										한눈에 보기</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body d-flex justify-content-between">
									<div class="chart-pie">
										<canvas id="myPieChart" style="width: 120px; height: 120px;"></canvas>
										<div class="font-weight-bold small text-center">사용자레시피/공공레시피 조회비율</div>
									</div>
									<div class="chart-pie">
										<canvas id="myPieChart2" style="width: 120px; height: 120px;"></canvas>
										<div class="font-weight-bold small text-center">오전/오후 방문자 비율</div>
									</div>
									<div class="chart-pie">
										<canvas id="myPieChart3" style="width: 120px; height: 120px;"></canvas>
										<div class="font-weight-bold small text-center">남/녀 비율</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<!-- 조회수 차트 -->
							<div class="card shadow">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-success">조회수 차트</h6>
									<span class="small font-weight-bold text-gray-500">1주일
										간의 전체 조회수를 나타냅니다</span>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<div class="card shadow mt-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-success">신고가 많은 게시글 /
										리뷰</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<colgroup>
												<col width="10%" />
												<col width="15%" />
												<col width="35%" />
												<col width="20%" />
												<col width="20%" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">신고 횟수</th>
													<th scope="col">닉네임</th>
													<th scope="col">게시글 제목</th>
													<th scope="col">댓글 내용</th>
													<th scope="col">블라인드 처리</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${vo.final_report_list}" var="k">
												<tr>
													<td>${k.count }</td>
													<td>${k.m_nick }</td>
													<td>${k.u_rcp_title }</td>
													<td>${k.c_contents }</td>
													<td> <button class="btn btn-danger">블라인드 처리</button> </td>
												</tr>											
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<!-- 일별 방문자 수 -->
							<div class="card shadow mt-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-success">일별 방문자 수</h6>
								</div>
								<div class="card-body">
									<div class="chart-bar">
										<canvas id="myBarChart"></canvas>
									</div>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-danger" href="/logOut_go">로그아웃</a>
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

	<!-- Page level plugins -->
	<script src="/resources/vendor/chart.js/Chart.min.js"></script>
	<script type="text/javascript">
		var doughnutData1 = [${vo.hit_user} ,  ${vo.hit_public} ]
		var doughnutData2 = [ ${vo.visit_am}, ${vo.visit_pm}  ]
		var doughnutData3 = [ ${vo.male_count} ,${vo.female_count} ]
		var hitData = ${vo.week_hit_count}
		var hitDay = ${vo.daysOfWeek}
		var visitData =  ${vo.week_visit_count}
		
	</script>
	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/chart-area-demo.js"></script>
	<script src="/resources/js/demo/chart-pie-demo.js?after"></script>
	<script src="/resources/js/demo/chart-bar-demo.js"></script>
	
	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript">
    $(document).ready(function () {
        $('#dataTable').dataTable({
            "columnDefs": [
                { "orderable": false, "targets": [1,2,3,4] }
            ],
            order: [[0, 'desc']]
        });
    });
	</script>
</body>

</html>