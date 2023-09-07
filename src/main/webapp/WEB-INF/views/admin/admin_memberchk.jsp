<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 서드파티 라이브러리 datatable를 사용하기 위한 CDN -->
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/searchpanes/2.2.0/css/searchPanes.dataTables.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css"
	rel="stylesheet">

<!-- input[type='date']의 data-placeholder를 사용하기 위한 css 파일 -->
<link href="resources/css/admin/memberchk/admin_memberchk.css?after"
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

				<!-- 회원관리 container -->
				<div class="container-fluid p-5">
					<div class="row mb-3">
						<div class="col">
							<!-- Content Title -->
							<h2 class="fw-bold">회원관리</h2>
						</div>
					</div>

					<!-- 사용자 정보관리 / 관리자 정보관리 버튼 -->
					<div class="row mb-3 justify-content-start">
						<div class="col-auto p-0">
							<a class="btn btn-lg btn-success" href="/go_admin_memberchk.do"
								role="button">사용자 정보관리</a>
						</div>
						<!-- supervisor account check -->
						<!-- 슈퍼바이저 계정이 아닐 경우 안 보이게 숨겨놓음 -->
						<%-- <c:if test="${supervisor == 'ok'}"> --%>
						<div class="col-auto p-0">
							<a class="btn btn-lg btn-outline-success"
								href="/go_admin_memberchk_admin.do" role="button">관리자 정보관리</a>
						</div>
						<%-- </c:if> --%>
					</div>

					<!-- row for 회원분류/ 검색조건 cards -->
					<div class="row justify-content-center justify-content-md-between">

						<%-- DB 연동 미구현!!! --%>
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
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">전체
												회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">${countSummary.total_member }명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">자체
												가입 회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">${countSummary.member_type_self }명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">소셜
												가입 회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">${countSummary.member_type_social }명</div>
										</div>
									</li>
									<li class="list-group-item h-25">
										<div
											class="row justify-content-between h-100 align-items-center">
											<div
												class="col-auto col-lg-12 col-xxl-auto fw-bold text-nowrap">탈퇴
												회원</div>
											<div
												class="col-auto col-lg-12 col-xxl-auto text-black-50 fw-bold small">${countSummary.drop_out_member }명</div>
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

							<!-- card for search -->
							<div class="card h-100">
								<h6
									class="card-header bg-light text-black-50 fw-bold small text-start">
									검색 조건</h6>

								<!-- form for search -->
								<form action="/go_admin_memberchk_search.do" method="post">

									<ul class="list-group list-group-flush">

										<li class="list-group-item">
											<!-- row for 검색어 조건 -->
											<div class="row justify-content-around align-items-center">
												<div
													class="col-auto col-sm-4 col-xl-auto fw-bold text-nowrap">검색어</div>
												<div class="col col-xl-auto mx-auto">
													<!-- 검색 키워드 카테고리 선택 -->
													<select name="keyword_category"
														class="form-select text-center"
														aria-label="keyword select">
														<option value="1">아이디</option>
														<option value="2">닉네임</option>
														<option value="3">전화번호</option>
														<option value="4">생일</option>
													</select>
												</div>
												<div class="col-auto ps-0">
													<!-- 검색 키워드 포함/일치 여부 선택 -->
													<div class="form-check form-check-inline m-0">
														<input class="form-check-input" type="radio"
															name="keyword_type" id="keyword_type_like" value="like">
														<label class="form-check-label" for="keyword_type_like">
															포함 </label>
													</div>
													<div class="form-check form-check-inline m-0">
														<input class="form-check-input" type="radio"
															name="keyword_type" id="keyword_type_equal" value="equal"
															checked> <label class="form-check-label"
															for="keyword_type_equal"> 일치 </label>
													</div>
												</div>
												<div class="col-12 mt-2 col-xl mt-xl-0 mx-auto">
													<div class="input-group">
														<!-- 검색 키워드 입력창 -->
														<input type="text" name="keyword" class="form-control"
															aria-label="input"
															aria-describedby="inputGroup-sizing-default">

														<!-- 버튼 클릭시 submit 동작 수행 -->
														<button type="button" class="btn btn-outline-secondary"
															onclick="goSubmit(this.form)">
															<i class="fa-solid fa-magnifying-glass"></i>
														</button>
													</div>
												</div>
											</div> <!-- End of row for 검색어 조건 -->
										</li>


										<li class="list-group-item">
											<!-- row for 기간 조건 -->
											<div class="row justify-content-between align-items-center">
												<div class="col-4 col-xl-auto fw-bold text-nowrap">기간
													조건</div>
												<div class="col-8 col-xxl">
													<!-- 기간 조건 카테고리 선택 -->
													<select name="period_category"
														class="form-select text-center" aria-label="period select">
														<option value="1">가입일</option>
														<option value="2">탈퇴일</option>
													</select>
												</div>

												<!-- 기간 조건 시작일/종료일 선택 -->
												<div
													class="col-6 mt-2 pe-1 col-xxl mt-xxl-0 input-date-wrapper">
													<!-- 주의: required 속성이 없으면 data-placeholder를 적용하는 css가 작동 안 됨 -->
													<input type="date" id="input_startday" name="start_date"
														data-placeholder="시작일" required aria-required="true"
														class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
												</div>
												<div class="col-6 mt-2 ps-1 col-xxl mt-xxl-0">
													<input type="date" id="input_endday" name="end_date"
														data-placeholder="종료일" required aria-required="true"
														class="btn btn-outline-secondary text-center rounded w-100 fw-bold">
												</div>

												<!-- 기간 조건 단축키(1일, 7일, 1달) 버튼 -->
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
											</div> <!-- End of row for 기간 조건 -->
										</li>

										<li class="list-group-item">
											<!-- row for 회원 분류 조건 -->
											<div class="row justify-content-around align-items-center">
												<div class="col-12 col-xxl-auto text-xxl-start fw-bold">회원
													분류</div>

												<!-- m_login_type에 따른 분류(라디오 버튼) -->
												<div class="col-6 order-1 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
													<!-- 모든 m_login_type -->
													<input type="radio" class="btn-check" name="member_type"
														id="member_type_all" autocomplete="off" value="all"
														checked> <label
														class="btn btn-outline-primary w-100 m-0 fw-bold"
														for="member_type_all">전체회원</label>
												</div>
												<div class="col-6 order-3 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
													<!-- m_login_type이 자체가입(1)일 때 -->
													<input type="radio" class="btn-check" name="member_type"
														id="member_type_self" autocomplete="off" value="self">
													<label class="btn btn-outline-primary w-100 m-0 fw-bold"
														for="member_type_self">자체가입</label>
												</div>
												<div
													class="col-6 order-3 p-1 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
													<!-- m_login_type이 소셜가입(2,3,4)일 때 -->
													<input type="radio" class="btn-check" name="member_type"
														id="member_type_social" autocomplete="off" value="social">
													<label
														class="btn btn-outline-primary m-0 w-100 fw-bold rounded"
														for="member_type_social">소셜가입</label>
												</div>
												<!-- End of m_login_type에 따른 분류(라디오 버튼) -->

												<!-- m_fail_count이 5이상일 때(잠김회원)일 때 -->
												<div class="col-6 order-3 p-1 col-sm-4 mt-2 col-xxl m-xxl-0">
													<input class="btn-check" type="checkbox" name="member_lock"
														id="member_lock" autocomplete="off" value="lock">
													<label class="btn btn-outline-danger w-100 m-0 fw-bold"
														for="member_lock"> 잠김회원</label>
												</div>

												<!-- m_status에 따른 분류(라디오 버튼) -->
												<div
													class="col-6 order-3 p-1 col-sm-4 mt-2 offset-xxl-1 col-xxl m-xxl-0">
													<!-- m_status이 금지회원(5)일 때 -->
													<input class="btn-check" type="radio" name="member_state"
														id="member_ban" autocomplete="off" value="ban"> <label
														class="btn btn-outline-danger w-100 m-0 fw-bold"
														for="member_ban"> 금지회원</label>
												</div>
												<div
													class="col-6 order-2 p-1 col-sm-4 order-sm-4 mt-2 col-xxl m-xxl-0">
													<!-- m_status이 탈퇴회원(4)일 때 -->
													<input class="btn-check" type="radio" name="member_state"
														id="member_dropout" autocomplete="off" value="dropout">
													<label class="btn btn-outline-secondary w-100 m-0 fw-bold"
														for="member_dropout"> 탈퇴회원</label>
												</div>
												<!-- End of m_status에 따른 분류(라디오 버튼) -->

											</div> <!-- End of row for 회원 분류 조건 -->
										</li>

										<li class="list-group-item">
											<div class="row justify-content-end align-items-center">
												<div class="col-auto">
													<!-- reset : 폼 컨트롤의 값을 초기화 시켜줍니다. -->
													<input type="reset"
														class="btn btn-outline-primary w-100 fw-bold"
														value="조건 초기화" />
												</div>
												<div class="col-auto">
													<!-- 버튼 클릭시 submit 동작 수행 -->
													<button type="button" class="btn btn-primary w-100 fw-bold"
														onclick="goSubmit(this.form)">검색</button>
												</div>
											</div>
										</li>

									</ul>

								</form>
								<!-- End of form for search -->

							</div>
							<!-- End of card for search -->

						</div>
						<!-- End of col for 검색조건 card -->

					</div>
					<!-- End of row for 회원분류/ 검색조건 cards -->

					<!-- row for 검색결과 card -->
					<div class="row mt-5 pt-3 rounded shadow">
						<div class="col-12 ps-3">
							<h4 class="fw-bold">검색결과</h4>
						</div>

						<!-- col for datatable -->
						<div class="col-12">
							<!-- card for datatable -->
							<div class="card p-3">
								<!-- 주의: overflow-x-hidden 안 주면 가로스크롤이 생길 때가 있음 -->
								<div class="table-responsive overflow-x-hidden">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>idx</th>
												<!-- 사용자에게는 보이지 않고 숨겨지는 열이다 -->
												<!-- 프로필 사진 원본 크기가 클 경우 화면에 출력되는 최대크기 제한 -->
												<th class="imgMaxSize">프로필</th>
												<th>닉네임</th>
												<th>아이디</th>
												<th>전화번호</th>
												<th>생일</th>
												<th>성별</th>
												<th>가입일</th>
												<th>탈퇴일</th>
												<th>가입</th>
												<th>탈퇴</th>
												<th>관리</th>
												<th>잠김</th>
												<th>관리</th>
												<th>작성</th>
												<th>관리</th>
												<!-- data-orderable="false"를 사용해서 정렬(화살표) 숨길 수 있음 -->
												<!-- <th data-orderable="false" class="text-nowrap text-center">관리</th> -->
												<!-- js파일에 orderable: false 로 동일하게 정렬(화살표) 숨김 설정 가능 -->
											</tr>
										</thead>

										<tbody>
											<c:choose>
												<%-- search_result이 있는 경우 반복문으로 데이터 행 출력 --%>
												<c:when test="${not empty search_result }">
													<c:forEach var="k" items="${search_result}">
														<tr class="align-middle">
															<td>${k.m_idx }</td>
															<td class="imgMaxSize"><img src="${k.m_image }"
																class="img-fluid img-thumbnail" alt="${k.m_image }" /></td>
															<td>${k.m_nick }</td>
															<td>${k.m_id }</td>
															<td>${k.m_phone }</td>
															<td>${k.m_birthday }</td>
															<td>${k.m_gender == "M" ? "Male" : "Female" }</td>
															<td>${k.m_regdate }</td>
															<td>${k.m_out_date}</td>
															<td>${k.m_login_type < 2 ? "자체" : "소셜" }</td>
															<!-- 회원의 상태에 따라 다른 출력을 보여준다 -->
															<c:choose>
																<c:when test="${k.m_status == 3 }">
																	<td class="text-danger">탈퇴</td>
																	<td><i
																		class="fa-solid fa-user-slash text-secondary"
																		title="정상"></i></td>
																</c:when>
																<c:otherwise>
																	<td class="text-primary">정상</td>
																	<!-- 해당 태그를 누르면 회원을 탈퇴시킨다 -->
																	<!-- m_status = 3 -->
																	<td><i class="fa-solid fa-user-slash text-danger hovercursorpointer" title="계정 탈퇴" onclick="dropOut(${k.m_idx})"></i></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${k.m_fail_count >= 5 }">
																	<td class="text-danger">잠김</td>
																	<!-- 해당 태그를 누르면 회원의 잠김 상태를 해제한다. -->
																	<!-- m_fail_count = 0 -->
																	<td><i
																		class="fa-solid fa-lock-open text-secondary hovercursorpointer"
																		title="계정 잠김 해제" onclick="openLock(${k.m_idx})"></i></td>
																</c:when>
																<c:otherwise>
																	<td class="text-primary">정상</td>
																	<!-- 해당 태그를 누르면 회원을 잠김 상태로 만든다. -->
																	<!-- m_fail_count = 5 -->
																	<td><i class="fa-solid fa-unlock text-primary"
																		title="정상"></i></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${k.m_status == 4 }">
																	<td class="text-danger">금지</td>
																	<!-- 해당 태그를 누르면 회원을 작성 가능 상태로 만든다. -->
																	<!-- m_status = 1 -->
																	<td><i class="fa-solid fa-pencil text-primary hovercursorpointer" title="작성 금지 해제" onclick="openWrite(${k.m_idx})"></i></td>
																</c:when>
																<c:otherwise>
																	<td class="text-primary">정상</td>
																	<!-- 해당 태그를 누르면 회원을 작성 불가 상태로 만든다. -->
																	<!-- m_status = 4 -->
																	<td><i class="fa-solid fa-ban text-danger hovercursorpointer" title="작성 금지" onclick="banWrite(${k.m_idx})"></i></td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							<!-- End of card for datatable -->
						</div>
						<!-- End of col for datatable -->
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

	<!-- 서드파티 라이브러디 datatable를 사용하기 위한 CDN -->
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/searchpanes/2.2.0/js/dataTables.searchPanes.min.js"></script>
	<script
		src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>

	<!-- 검색결과에 사용되는 datatable 관련 javascript -->
	<script src="resources/js/admin/memberchk/admin_memberchk_datatable.js"></script>

	<!-- form에 사용되는 버튼 관련 javascript -->
	<script src="resources/js/admin/memberchk/admin_memberchk_btnevent.js"></script>
</body>

</html>