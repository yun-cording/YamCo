<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>신고내역 관리</title>
<!-- 알럿창꾸미기 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<script type="text/javascript">
    function chk() {
    	 Swal.fire({
    		  position: 'middle',
    		  icon: 'success',
    		  title: '블라인드 처리 되었습니다.',
    		  showConfirmButton: true,
    		  timer: 2000
    		})
	}
    </script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css?after" rel="stylesheet">	
	
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

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

				<div class="container-fluid">
					<h1 class="ml-5 mt-5 font-weight-bold">신고내역 관리</h1>
					<hr>
					<!-- 여기에서 작업하시면 됩니다. -->
					
					<!-- 버튼시작 -->
					<div class="btn-group" role="group"	aria-label="Basic radio toggle button group" style="margin-left:26px;">
						<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked> 
							<label class="btn btn-outline-success" for="btnradio1">게시글</label>
							 
							<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"> 
							<label class="btn btn-outline-success" for="btnradio2">댓글</label>
							 
							<input type="radio" class="btn-check" name="btnradio" id="btnradio3"autocomplete="off"> 
							<label class="btn btn-outline-success" for="btnradio3">처리된 내용들</label>
					</div>
					<!-- 버튼 끝 -->

					<!-- 라디오 버튼 시작 -->
					<div style="margin-left: 26px;">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1">
							<label class="form-check-label" for="inlineRadio1">욕설/비하</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label" for="inlineRadio2">성희롱</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio3" value="option3">
							<label class="form-check-label" for="inlineRadio3">광고</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio4" value="option4">
							<label class="form-check-label" for="inlineRadio4">허위정보</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio5" value="option5">
							<label class="form-check-label" for="inlineRadio5">기타</label>
						</div>
					</div>
					<!-- 라디오 버튼 끝 -->

					<!-- Begin Page Content -->
					<div class="container-fluid" style="text-align: center;">
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<colgroup>
											<col width="5%" />
											<col width="10%" />
											<col width="7%" />
											<col width="10%" />
											<col width="15%" />
											<col width="32%" />
											<col width="10%" />
											<col width="11%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">신고번호</th>
												<th scope="col">신고자</th>
												<th scope="col">신고 누적 횟수</th>
												<th scope="col">피신고자 닉네임</th>
												<th scope="col">게시글 제목</th>
												<th scope="col">작성 내용</th>
												<th scope="col">답변</th>
												<th scope="col">블라인드 처리</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-100 "
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white; disabled;" class="btn bg-secondary"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 작성완료</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리완료</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-danger" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>ysh</td>
												<td>4</td>
												<td>심바gray의 50가지 레시피</td>
												<td>myBigSecret...</td>
												<td>**************</td>
												<td><button type="button" class="btn bg-success bg-opacity-75"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td><button class="btn btn-secondary" onclick="chk()">블라인드
														처리하기</button></td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- 테이블 끝 -->
						</div>
						
						<!-- 모달 시작 -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">New
											message</h1>
										<button type="button" class="btn-close"	data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form>
											<div class="mb-3">
												<label for="recipient-name" class="col-form-label">Recipient:</label>
												<input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="mb-3">
												<label for="message-text" class="col-form-label">Message:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">Close</button>
										<button type="button" class="btn btn-secondary">Send
											message</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 모달 끝 -->
						
					</div>
					<!-- 여기까지 작업하시면됩니다. -->


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
					<a class="btn btn-success" href="login.html">로그아웃</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugins -->
	<script
		src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="resources/js/demo/datatables-demo.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>