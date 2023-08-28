<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

<!-- for DataTables customOptionConditions -->
<link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/searchpanes/2.2.0/css/searchPanes.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css" rel="stylesheet">

<link href="resources/css/admin/memberchk/admin_memberchk.css?after" rel="stylesheet">

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

				<!-- 회원관리 container -->
				<div class="container-fluid p-5">
					<div class="row mb-3">
						<div class="col">
							<!-- Content Title -->
							<h2 class="fw-bold">회원관리</h2>
						</div>
					</div>
					
					<!-- 사용자 정보관리 / 관리자 정보관리 버튼 -->
					<div class="row mb-3">
						<div class="col">
							<div class="btn-toolbar" role="toolbar"
								aria-label="Toolbar with button groups">
								<div class="btn-group btn-group-lg" role="group"
									aria-label="Large button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio1" autocomplete="off" checked> <label
										class="btn btn-outline-success m-0 rounded" for="btnradio1">사용자
										정보관리</label>
								</div>
								
								<!-- .d-none 로 안 보이게 숨겨놓음 -->
								<div class="btn-group btn-group-lg d-none" role="group"
									aria-label="Large button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio2" autocomplete="off">
										
										<label
										class="btn btn-outline-success m-0 rounded"
										for="btnradio2">관리자 정보관리</label>
								</div>
							</div>
						</div>
					</div>
					
					<!-- row for 회원분류/ 검색조건 cards -->
					<div class="row justify-content-center justify-content-md-between">
					
						<!-- col for 회원분류 card -->
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
						<!-- End of col for 회원분류 card -->
						
						<!-- col for 검색조건 card -->
						<!-- 서버 측 DB에서 데이터를 동적으로 가져오기 위한 검색조건 -->
						<div
							class="col-12 mt-4 p-3 col-lg mt-lg-0 text-center rounded shadow">
							<div class="card h-100">
								<h6
									class="card-header bg-light text-black-50 fw-bold small text-start">
									검색 조건</h6>

									<!-- form start -->
									<form action="/go_admin_memberchk.do" method="post">
									
								<ul class="list-group list-group-flush">
									
									<li class="list-group-item">
										<div class="row justify-content-around align-items-center">
											<div class="col-auto col-sm-4 col-xl-auto fw-bold text-nowrap">검색어</div>
											<div class="col col-xl-auto mx-auto">
												<select name="keyword_category" class="form-select text-center"
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
														name="keyword_type" id="keyword_type_like" value="like"> <label
														class="form-check-label" for="keyword_type_like">
														포함 </label>
												</div>
												<div class="form-check form-check-inline m-0">
													<input class="form-check-input" type="radio"
														name="keyword_type" id="keyword_type_equal" value="equal" checked>
													<label class="form-check-label" for="keyword_type_equal">
														일치 </label>
												</div>
											</div>
											<div class="col-12 mt-2 col-xl mt-xl-0 mx-auto">
												<div class="input-group">
													<input type="text" name="keyword" class="form-control" aria-label="input"
														aria-describedby="inputGroup-sizing-default">
													<button type="button" class="btn btn-outline-secondary" onclick="goSubmit(this.form)">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</div>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row justify-content-between align-items-center">
											<div class="col-4 col-xl-auto fw-bold text-nowrap">기간
												조건</div>
											<div class="col-8 col-xxl">
												<select name="period_category" class="form-select text-center"
													aria-label="period select">
													<option value="1">가입일</option>
													<option value="2">탈퇴일</option>
												</select>
											</div>
											<div class="col-6 mt-2 pe-1 col-xxl mt-xxl-0 input-date-wrapper">
												<input type="date" id="input_startday" name="start_date" data-placeholder="시작일" required aria-required="true"
													class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
											</div>
											<div class="col-6 mt-2 ps-1 col-xxl mt-xxl-0">
												<input type="date" id="input_endday" name="end_date" data-placeholder="종료일" required aria-required="true"
													class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
											</div>
											<div class="col-4 mt-2 pe-1 col-xxl-auto mt-xxl-0">
												<button type="button" id="btn_1day"
													class="btn btn-outline-secondary w-100">1일</button>
											</div>
											<div class="col-4 mt-2 p-1 col-xxl-auto mt-xxl-0">
												<button type="button" id="btn_7day"
													class="btn btn-outline-secondary w-100">7일</button>
											</div>
											<div class="col-4 mt-2 ps-1 col-xxl-auto mt-xxl-0">
												<button type="button" id="btn_1month"
													class="btn btn-outline-secondary w-100">1달</button>
											</div>
										</div>
									</li>
									<li class="list-group-item">
										<div class="row justify-content-around align-items-center">
											<div class="col-12 col-xxl-auto text-xxl-start fw-bold">회원
												분류</div>
											<div class="col-6 order-1 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
												
													<input class="form-check-input d-none member_type" type="radio"
														name="member_type" id="member_type_all" value="all" checked>
														<label
														class="btn btn-outline-primary w-100 m-0 fw-bold" for="member_type_all">
														전체회원</label>
											</div>
											<div class="col-6 order-3 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
													<input class="form-check-input d-none member_type" type="radio"
														name="member_type" id="member_type_self" value="self">
														<label
														class="btn btn-outline-primary w-100 m-0 fw-bold" for="member_type_self">
														자체가입</label>
											</div>
											<div
												class="col-6 order-3 p-1 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
													<input class="form-check-input d-none member_type" type="radio"
														name="member_type" id="member_type_social" value="social">
														<label
														class="btn btn-outline-primary w-100 m-0 fw-bold" for="member_type_social">
														소셜가입</label>
											</div>
											<div class="col-6 order-3 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
													<input class="form-check-input d-none member_lock" type="checkbox"
														name="member_lock" id="member_lock">
														<label
														class="btn btn-outline-danger w-100 m-0 fw-bold" for="member_lock">
														잠김회원</label>
											</div>
											<div
												class="col-6 order-3 p-1 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
													<input class="form-check-input d-none member_ban" type="checkbox"
														name="member_ban" id="member_ban">
														<label
														class="btn btn-outline-danger w-100 m-0 fw-bold" for="member_ban">
														금지회원</label>
											</div>
											<div
												class="col-6 order-2 p-1 col-sm-4 order-sm-4 mt-2 col-xxl m-xxl-0">
													<input class="form-check-input d-none member_dropout" type="checkbox"
														name="member_dropout" id="member_dropout">
														<label
														class="btn btn-outline-secondary w-100 m-0 fw-bold" for="member_dropout">
														탈퇴회원</label>
											</div>
										</div>
									</li>
										<li class="list-group-item">
											<div class="row justify-content-end align-items-center">
														<div class="col-auto">
															<input type="reset"
																class="btn btn-outline-primary w-100 fw-bold"
																value="조건 초기화" />
														</div>
														<div class="col-auto">
															<button type="button"
																class="btn btn-primary w-100 fw-bold"
																onclick="goSubmit(this.form)">검색</button>
												</div>
											</div>
										</li>

									</ul>
									
									</form>
									<!-- End of form -->
									
							</div>
						</div>						
						<!-- End of col for 검색조건 card -->
						
					</div>
					<!-- End of row for 회원분류/ 검색조건 cards -->
					
					<!-- row for 검색결과 card -->
					<div class="row mt-5 pt-3 rounded shadow">
						<div class="col-12 ps-3">
							<h4 class="fw-bold">검색결과</h4>
						</div>
						<div class="col-12">
							<div class="card p-3">
								<!-- overflow-x-hidden 안 주면 가로스크롤이 생길 때가 있음 -->
								<div class="table-responsive overflow-x-hidden">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th></th>
												<th>uid</th>
												<th	style="max-width: 3rem;">프로필</th>
												<th>닉네임</th>
												<th>이메일</th>
												<th>전화번호</th>
												<th>생년월일</th>
												<th>성별</th>
												<th>가입일</th>
												<th>가입</th>
												<th>탈퇴</th>
												<th>관리</th>
												<th>잠김</th>
												<th>관리</th>
												<th>작성</th>
												<!-- data-orderable="false"를 사용해서 정렬(화살표) 숨길 수 있음 -->
												<!-- <th data-orderable="false" class="text-nowrap text-center">관리</th> -->
												<!-- js파일에 orderable: false 로 동일하게 정렬(화살표) 숨김 설정 가능 -->
												<th>관리</th>
											</tr>
										</thead>
										<tbody>
											<!-- data 한 행 예시 -->
											<!-- <tr class="align-middle">
												<td></td>
												<td>1</td>
												<td><img
													src="/resources/images/alarm.png"
													class="img-fluid img-thumbnail" alt="" /></td>
												<td>Mr.Happiniess!</td>
												<td>Mr.H********@.g********</td>
												<td>82+ 10-1234-****</td>
												<td>931208</td>
												<td>Male</td>
												<td>2023-04-25</td>
												<td>자체</td>
												<td>정상</td>
												<td><a href="/" title="계정 탈퇴"><i
														class="fa-solid fa-user-slash text-danger"></i></a></td>
												탈퇴 상태일 경우 아래 아이콘 사용
												<td><i
														class="fa-solid fa-user-slash text-secondary"></i></td>
												<td>정상</td>
												<td><a href="/" title="계정 잠금"><i
														class="fa-solid fa-lock text-danger"></i></a></td>
												잠김 상태일 경우 아래 아이콘 사용
												<td><a href="/" title="계정 잠김 해제"><i
														class="fa-solid fa-lock-open text-secondary"></i></a></td>
												<td>정상</td>
												<td><a href="/" title="작성 금지"><i
														class="fa-solid fa-ban text-danger"></i></a></td>
												작성 금지 상태일 경우 아래 아이콘 사용
												<td><a href="/" title="작성 금지 해제"><i
														class="fa-solid fa-pencil text-primary"></i></a></td>
											</tr> -->
										
											<!-- dummy data 생성 -->
											<c:forEach begin="1" end="21" step="1" var="k" varStatus="vs">
							
											<tr class="align-middle">
												<td></td>
												<td>${k }</td>
												<td><img
													src="/resources/images/alarm.png"
													class="img-fluid img-thumbnail" alt="" /></td>
												<td>Mr.Happiniess${k }</td>
												<td>Mr.H********@.g********</td>
												<td>82+ 10-1234-****</td>
												<td>${k + 931208}</td>
												<td>${(k % 2) == 0 ? "Male" : "Female" }</td>
												<td>2023-04-${k + 9}</td>
												<td>${(k % 3) == 0 ? "자체" : "소셜" }</td>
													<c:choose>
														<c:when test="${(k % 7) == 0 }">
															<td>탈퇴</td>
															<td><i class="fa-solid fa-user-slash text-secondary"></i></td>
														</c:when>
														<c:otherwise>
															<td>정상</td>
															<td><a href="/" title="계정 탈퇴"><i
																	class="fa-solid fa-user-slash text-danger"></i></a></td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${(k % 5) == 0 }">
															<td>잠김</td>
															<td><a href="/" title="계정 잠김 해제"><i
																	class="fa-solid fa-lock-open text-secondary"></i></a></td>
														</c:when>
														<c:otherwise>
															<td>정상</td>
															<td><a href="/" title="계정 잠금"><i
																	class="fa-solid fa-lock text-danger"></i></a></td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${(k % 3) == 1 }">
															<td>금지</td>
															<td><a href="/" title="작성 금지 해제"><i
																	class="fa-solid fa-pencil text-primary"></i></a></td>
														</c:when>
														<c:otherwise>
															<td>정상</td>
															<td><a href="/" title="작성 금지"><i
																	class="fa-solid fa-ban text-danger"></i></a></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<!-- End of row for 검색결과 card -->
					
				</div>
				<!-- End of 회원관리 container -->
				
			</div>
			<!-- End of Main Content -->
			
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
	<!-- 
	<script src="resources/js/demo/datatables-demo.js"></script>
 	-->
 	
 	<!-- for DataTables customOptionConditions -->
<!--  	<script src="https://code.jquery.com/jquery-3.7.0.js"></script> -->
 	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
 	<script src="https://cdn.datatables.net/searchpanes/2.2.0/js/dataTables.searchPanes.min.js"></script>
 	<script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
 	
	<script src="resources/js/admin/memberchk/admin_memberchk_datatable.js?after"></script>
	
	<script src="resources/js/admin/memberchk/admin_memberchk_btnevent.js?after"></script>
</body>

</html>