ㄴㅂ<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="result" value="${result }" />

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
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"	rel="stylesheet" type="text/css">	
	<!-- Custom styles for this template-->
	<link href="/resources/css/sb-admin-2.min.css?after" rel="stylesheet">	
	
<link	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"	crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
<script type="text/javascript">
function btnradio1() {
	location.href="/admin/admin_report_recipe.do?result=1" ;
}
function btnradio2() {
	location.href="/admin/admin_report_recipe.do?result=2" ;			
}

function btnradio3() {
	location.href="/admin/admin_report_recipe.do?result=3" ;
}

function btnradio4() {
	location.href="/admin/admin_report_recipe.do?result=4" ;
}

function confirm_go(c_idx, rcp_idx,button) { //블라인드 처리하기 작동함수
var sendData ='';
if(c_idx){
	sendData='c_idx='+c_idx
}else{
	sendData='rcp_idx='+rcp_idx
}
swal({
	  title: "해당 게시글을 블라인드 처리하리겠습니까?",
	  text: "블라인드 된 게시글은 조회할 수 없습니다.",
	  icon: "warning",
	  buttons: true,
	  dangerMode: true,
	})
	.then((willDelete) => {
	  if (willDelete) {
		$.ajax({
			url: '/blind.do',
		    method: 'GET',
		    data: sendData ,
		    success: function (success) {
		    	if(success){
		    		swal("블라인드 처리되었습니다.", {
				    	icon: "success",
				    });
		    		var myBtn = $(button)
		    		var row = myBtn.parent().parent()
		    		var table = $('#dataTable').DataTable();

					var filteredRows = table.rows(function (idx, data, node) {
					    var postData = data[0]; // 첫 번째 열에 게시글 번호가 있다고 가정
					    if(c_idx){
							return postData === c_idx				    	
					    }else{
						    return postData === rcp_idx; // 일치하는 행을 선택
					    }
					});
					if(c_idx){
							filteredRows.every(function () {
						    var rowData = $(this.node())
						    console.log(rowData)
						    var controlBtn = rowData.find('td:eq(6)>button')
						    console.log(controlBtn)
						    controlBtn.text('블라인드 완료').addClass("btn-secondary").removeClass('btn-danger').attr("disabled",true)
						});
					}else{
						filteredRows.every(function () {
						    var rowData = $(this.node())
						    var controlBtn = rowData.find('td:eq(7)>button')
						    console.log(controlBtn)
						    controlBtn.text('블라인드 완료').addClass("btn-secondary").removeClass('btn-danger').attr("disabled",true)
						});
					}
		      	}
		    },
		    error: function (xhr, status, error) {
		      swal("Ajax요청 실패");
		    }
		})  
	  } else {
	    swal("블라인드 요청이 중단되었습니다.");
	  }
	});
}

 
var result = "${result}";
 $(document).ready(function() {
	
	if(result == '1'){
		$("#btnradio1").prop("checked", true);
	}else if(result == '2'){
		$("#btnradio2").prop("checked", true);
	}else if(result == '3'){
		$("#btnradio3").prop("checked", true);
	}else if(result == '4'){
		$("#btnradio4").prop("checked", true);
	}else{
		$("#btnradio1").prop("checked", true);
	}
	
});
</script>
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
						<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"
						onclick="btnradio1()"> 
							<label class="btn btn-outline-success" for="btnradio1" >게시글</label>
							 
							<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
							onclick="btnradio2()"> 
							<label class="btn btn-outline-success" for="btnradio2">댓글</label>
							
							<input type="radio" class="btn-check" name="btnradio" id="btnradio3"autocomplete="off"
							onclick="btnradio3()"> 
							<label class="btn btn-outline-success" for="btnradio3">처리된 게시글들</label>
							<input type="radio" class="btn-check" name="btnradio" id="btnradio4"autocomplete="off"
							onclick="btnradio4()"> 
							<label class="btn btn-outline-success" for="btnradio4">처리된 댓글들</label>
					</div>
					<!-- 버튼 끝 -->

					<!-- Begin Page Content -->
					<div class="container-fluid" style="text-align: center;">
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="table-responsive">
										<c:choose>
										<c:when test="${result == 1 || empty result}">
										<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<colgroup>
											<col width="12%" />
											<col width="10%" />
											<col width="9%" />
											<col width="10%" />
											<col width="15%" />
											<col width="23%" />
											<col width="10%" />
											<col width="11%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">게시글번호</th>
												<th scope="col">신고자</th>
												<th scope="col">신고 유형</th>
												<th scope="col">작성자</th>
												<th scope="col">게시글 제목</th>
												<th scope="col">신고 내용</th>
												<th scope="col">답변</th>
												<th scope="col">블라인드 처리</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${rcp_list}" var="k"  >
										<tr>
												<td>${k.rcp_idx }</td>
												<td>${k.recipe_attacknick }</td>
												<td>${k.r_type }</td>
												<td>${k.recipe_defencenick }</td>
												<td>${k.u_rcp_title }</td>
												<td>${k.r_reply }</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-100 "
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<c:if test="${k.u_rcp_status==0 }">
													<td> <button type="button" class="btn btn-danger" onclick="confirm_go( '${k.c_idx}','${k.rcp_idx }',this )">블라인드 처리</button> </td>
												</c:if>
												<c:if test="${k.u_rcp_status==3 }">
													<td> <button type="button" class="btn btn-secondary" disabled>블라인드 완료</button> </td>
												</c:if>
											</tr>
										</c:forEach>
										</tbody>
										</table>
										</c:when>
										<c:when test="${result == 2 }">
										<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<colgroup>
											<col width="14%" />
											<col width="16%" />
											<col width="14%" />
											<col width="16%" />
											<col width="14%" />
											<col width="16%" />
											<col width="10%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">댓글번호</th>
												<th scope="col">신고자</th>
												<th scope="col">신고 유형</th>
												<th scope="col">댓글 작성자</th>
												<th scope="col">댓글 내용</th>
												<th scope="col">답변</th>
												<th scope="col">블라인드 처리</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${c_list}" var="k"  >
										<tr>
												<td>${k.c_idx }</td>
												<td>${k.comment_attacknick }</td>
												<td>${k.r_type }</td>
												<td>${k.comment_defencenick }</td>
												<td>${k.c_contents }</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-100 "
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<c:if test="${k.c_status==2 }">
													<td> <button type="button" class="btn btn-secondary" disabled>블라인드 완료</button> </td>
												</c:if>
												<c:if test="${k.c_status==0 }">
													<td> <button type="button" class="btn btn-danger" onclick="confirm_go( '${k.c_idx}','${k.rcp_idx }',this )">블라인드 처리</button> </td>
												</c:if>
											</tr>
										</c:forEach>
										</tbody>
										</table>
										</c:when>
										<c:when test="${result == 3 }">
										<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<colgroup>
											<col width="12%" />
											<col width="10%" />
											<col width="9%" />
											<col width="10%" />
											<col width="15%" />
											<col width="23%" />
											<col width="10%" />
											<col width="11%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">게시글번호</th>
												<th scope="col">신고자</th>
												<th scope="col">신고 유형</th>
												<th scope="col">작성자</th>
												<th scope="col">게시글 제목</th>
												<th scope="col">신고 내용</th>
												<th scope="col">답변</th>
												<th scope="col">블라인드 처리</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${rcp_list}" var="k"  >
										<tr>
												<td>${k.rcp_idx }</td>
												<td>${k.recipe_attacknick }</td>
												<td>${k.r_type }</td>
												<td>${k.recipe_defencenick }</td>
												<td>${k.u_rcp_title }</td>
												<td>${k.r_reply }</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-100 "
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<c:if test="${k.u_rcp_status==0 }">
													<td> <button type="button" class="btn btn-danger" onclick="confirm_go( '${k.c_idx}','${k.rcp_idx }',this )">블라인드 처리</button> </td>
												</c:if>
												<c:if test="${k.u_rcp_status==3 }">
													<td> <button type="button" class="btn btn-secondary" disabled>블라인드 완료</button> </td>
												</c:if>
											</tr>
										</c:forEach>
										</tbody>
										</table>
										</c:when>
										<c:when test="${result == 4 }">
										<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
										<colgroup>
											<col width="13%" />
											<col width="24%" />
											<col width="13%" />
											<col width="24%" />
											<col width="13%" />
											<col width="13%" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">신고당한 댓글번호</th>
												<th scope="col">신고자</th>
												<th scope="col">신고 유형</th>
												<th scope="col">댓글 작성자</th>
												<th scope="col">답변</th>
												<th scope="col">블라인드 처리</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${c_list}" var="k"  >
										<tr>
												<td>${k.c_idx }</td>
												<td>${k.comment_attacknick }</td>
												<td>${k.r_type }</td>
												<td>${k.comment_defencenick }</td>
												<td><button type="button" style="color: white;" class="btn bg-success bg-opacity-100 "
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@mdo">답변 미작성</button></td>
												<td> <button type="button" class="btn btn-danger" onclick="confirm_go( '${k.c_idx}','${k.rcp_idx }',this )">블라인드 처리</button> </td>
											</tr>
										</c:forEach>
										</tbody>
										</table>
										</c:when>
										</c:choose>
										
										
									
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

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugins -->
	<script
		src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/datatables-demo.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html> 