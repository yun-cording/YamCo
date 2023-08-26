<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 부트스트랩 연결 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css?after" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<style type="text/css">
input[type='date']::before {
	content: attr(data-placeholder);
	width: 100%;
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

				<div class="container-fluid p-5">
					<div class="row mb-3">
						<div class="col">
							<!-- Content Title -->
							<h2 class="fw-bold">회원관리</h2>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div class="btn-toolbar" role="toolbar"
								aria-label="Toolbar with button groups">
								<!-- <div class="btn-group btn-group-lg shadow" role="group" aria-label="First Large radio toggle button group"> -->
								<div class="btn-group btn-group-lg shadow" role="group"
									aria-label="Large button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio1" autocomplete="off" checked> <label
										class="btn btn-outline-success m-0 rounded" for="btnradio1">사용자
										정보관리</label>
								</div>
								<div class="btn-group btn-group-lg shadow" role="group"
									aria-label="Large button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio2" autocomplete="off"> <label
										class="btn btn-outline-success m-0  rounded d-none invisible"
										for="btnradio2">관리자 정보관리</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-center justify-content-md-between">
						<div class="col-12 p-3 col-lg-auto me-lg-5 rounded shadow">
							<div class="card h-100">
								<h6 class="card-header bg-light text-black-50 fw-bold small">
									회원 분류</h6>
								<ul class="list-group list-group-flush h-100">
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">전체회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">31명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">자체
												가입 회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">6명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">소셜
												가입 회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">23명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">탈퇴
												회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">2명</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div
							class="col-12 mt-4 p-3 col-lg mt-lg-0 text-center rounded shadow">
							<div class="card h-100">
								<h6
									class="card-header bg-light text-black-50 fw-bold small text-start">
									검색 조건</h6>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
										<div class="row justify-content-around align-items-center">
											<div class="col-auto fw-bold text-nowrap">검색어</div>
											<div class="col col-lg-auto mx-auto">
												<select class="form-select text-center"
													aria-label="keyword select">
													<option value="1">아이디</option>
													<option value="2">닉네임</option>
													<option value="3">휴대전화</option>
													<option value="4">생년월일</option>
													<option value="5">성별</option>
												</select>
											</div>
											<div class="col-auto ps-0">
												<div class="form-check form-check-inline m-0">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault1"> <label
														class="form-check-label" for="flexRadioDefault1">
														포함 </label>
												</div>
												<div class="form-check form-check-inline m-0">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault2" checked>
													<label class="form-check-label" for="flexRadioDefault2">
														일치 </label>
												</div>
											</div>
											<div class="col-12 mt-2 col-lg mt-lg-0 mx-auto">
												<div class="input-group">
													<input type="text" class="form-control" aria-label="input"
														aria-describedby="inputGroup-sizing-default">
													<button type="button" class="btn btn-outline-secondary">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row justify-content-around align-items-center">
											<div class="col-4 col-xxl-auto fw-bold text-nowrap">기간
												조건</div>
											<div class="col-8 col-xxl">
												<select class="form-select text-center"
													aria-label="period select">
													<option value="1">가입일</option>
													<option value="2">탈퇴일</option>
												</select>
											</div>
											<div class="col-6 mt-2 col-xxl mt-xxl-0">
												<input type="date" name="start_date" data-placeholder="시작일" class="text-center btn-outline-secondary">
												<button type="button"
													class="btn btn-outline-secondary w-100 fw-bold text-nowrap">
													시작일 <i class="fa-regular fa-calendar-days"></i>
												</button>
											</div>
											<div class="col-6 mt-2 col-xxl mt-xxl-0">
												<button type="button"
													class="btn btn-outline-secondary w-100 fw-bold text-nowrap">
													종료일 <i class="fa-regular fa-calendar-days"></i>
												</button>
											</div>
											<div class="col-4 mt-2 col-xxl-auto mt-xxl-0">
												<button type="button"
													class="btn btn-outline-secondary w-100">1일</button>
											</div>
											<div class="col-4 mt-2 col-xxl-auto mt-xxl-0">
												<button type="button"
													class="btn btn-outline-secondary w-100">7일</button>
											</div>
											<div class="col-4 mt-2 col-xxl-auto mt-xxl-0">
												<button type="button"
													class="btn btn-outline-secondary w-100">1달</button>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row justify-content-around align-items-center">
											<div class="col-12 col-xxl-auto text-xxl-start fw-bold">회원
												분류</div>
											<div class="col-6 order-1 col-sm-4 mt-2 col-xxl m-xxl-0">
												<button type="button" class="btn btn-primary w-100 fw-bold">전체회원</button>
											</div>
											<div class="col-6 order-3 col-sm-4 mt-2 col-xxl m-xxl-0">
												<button type="button"
													class="btn btn-outline-primary w-100 fw-bold">자체가입</button>
											</div>
											<div
												class="col-6 order-3 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
												<button type="button"
													class="btn btn-outline-primary w-100 fw-bold">소셜가입</button>
											</div>
											<div class="col-6 order-3 col-sm-4 mt-2 col-xxl m-xxl-0">
												<button type="button"
													class="btn btn-outline-danger w-100 fw-bold">잠김회원</button>
											</div>
											<div
												class="col-6 order-3 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
												<button type="button" class="btn btn-danger w-100 fw-bold">금지회원</button>
											</div>
											<div
												class="col-6 order-2 col-sm-4 order-sm-4 mt-2 col-xxl m-xxl-0">
												<button type="button"
													class="btn btn-secondary w-100 fw-bold">탈퇴회원</button>
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
															class="btn btn-outline-primary w-100 fw-bold">
															조건 초기화 <i class="fa-solid fa-arrow-rotate-right"></i>
														</button>
													</div>
													<div class="col-auto">
														<button type="button"
															class="btn btn-primary w-100 fw-bold">검색</button>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="row mt-5 pt-3 rounded shadow">
						<div class="col-12 ps-3">
							<h4 class="fw-bold">검색결과</h4>
						</div>
						<div class="col-12">
							<div class="card p-3">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th data-orderable="false" class="text-nowrap"
													style="max-width: 3rem;">프로필</th>
												<th class="text-nowrap">닉네임</th>
												<th class="text-nowrap">이메일</th>
												<th class="text-nowrap">전화번호</th>
												<th class="text-nowrap">생년월일</th>
												<th class="text-nowrap">성별</th>
												<th class="text-nowrap">가입일</th>
												<th class="text-nowrap">가입</th>
												<th class="text-nowrap">탈퇴</th>
												<th class="text-nowrap">잠김</th>
												<th class="text-nowrap">작성</th>
												<th data-orderable="false" class="text-nowrap">금지</th>
												<th data-orderable="false" class="text-nowrap">삭제</th>
												<th data-orderable="false" class="text-nowrap">탈퇴</th>
												<th data-orderable="false" class="text-nowrap">관리</th>
											</tr>
										</thead>
										<tbody>
											<tr class="align-middle">
												<td class="align-middle text-nowrap text-center"><img
													src="/resources/images/alarm.png"
													class="img-fluid img-thumbnail" alt="" /></td>
												<td class="align-middle text-nowrap">Mr.Happiniess!</td>
												<td class="align-middle text-nowrap">Mr.H********@.g********</td>
												<td class="align-middle text-nowrap">82+ 10-1234-****</td>
												<td class="align-middle text-nowrap">931208</td>
												<td class="align-middle text-nowrap">Male</td>
												<td class="align-middle text-nowrap">2023-04-25</td>
												<td class="align-middle text-nowrap">자체</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-ban text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-trash-can text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-slash text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-pen text-primary"></i></a></td>
											</tr>
											<tr class="align-middle">
												<td class="align-middle text-nowrap text-center"><img
													src="/resources/images/alarm.png"
													class="img-fluid img-thumbnail" alt="" /></td>
												<td class="align-middle text-nowrap">Mr.Happiniess!</td>
												<td class="align-middle text-nowrap">Mr.H********@.g********</td>
												<td class="align-middle text-nowrap">82+ 10-1234-****</td>
												<td class="align-middle text-nowrap">931208</td>
												<td class="align-middle text-nowrap">Male</td>
												<td class="align-middle text-nowrap">2023-04-25</td>
												<td class="align-middle text-nowrap">자체</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-ban text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-trash-can text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-slash text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-pen text-primary"></i></a></td>
											</tr>
											<tr class="align-middle">
												<td class="align-middle text-nowrap text-center"><img
													src="/resources/images/alarm.png"
													class="img-fluid img-thumbnail" alt="" /></td>
												<td class="align-middle text-nowrap">Mr.Happiniess!</td>
												<td class="align-middle text-nowrap">Mr.H********@.g********</td>
												<td class="align-middle text-nowrap">82+ 10-1234-****</td>
												<td class="align-middle text-nowrap">931208</td>
												<td class="align-middle text-nowrap">Male</td>
												<td class="align-middle text-nowrap">2023-04-25</td>
												<td class="align-middle text-nowrap">자체</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-nowrap">정상</td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-ban text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-trash-can text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-slash text-danger"></i></a></td>
												<td class="align-middle text-center"><a href="/"><i
														class="fa-solid fa-user-pen text-primary"></i></a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
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
					<a class="btn btn-danger" href="login.html">로그아웃</a>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script
		src="resources/vendor/datatables/jquery.dataTables.min.js?after"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/datatables-demo.js"></script>

	<script>
		$(document).ready(function() {
			var dataTable = $('#dataTable').DataTable(); // 테이블 초기화

			// 두 번째 열을 기준으로 정렬
			dataTable.order([ 1, 'asc' ]).draw();
		});
	</script>
</body>

</html>