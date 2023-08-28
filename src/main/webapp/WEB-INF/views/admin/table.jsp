<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>어드민 테이블 예시</title>

<!-- 부트스트랩 사용하기위해 필요한 라이브러리  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<colgroup>
							<col width="5%" />
							<col width="10%" />
							<col width="5%" />
							<col width="10%" />
							<col width="15%" />
							<col width="25%" />
							<col width="15%" />
							<col width="15%" />
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
								<td>asd</td>
								<td>asd</td>
							</tr>
							<tr>
								<td>Jonas Alexander</td>
								<td>Developer</td>
								<td>San Francisco</td>
								<td>30</td>
								<td>2010/07/14</td>
								<td>$86,500</td>
								<td>$320,800</td>
								<td>$320,800</td>
							</tr>
							<tr>
								<td>Shad Decker</td>
								<td>Regional Director</td>
								<td>Edinburgh</td>
								<td>51</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>2008/11/13</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Michael Bruce</td>
								<td>Javascript Developer</td>
								<td>Singapore</td>
								<td>29</td>
								<td>2011/06/27</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011/01/25</td>
								<td>$320,800</td>
								<td>$320,800</td>
								<td>$112,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div>
	<!-- /.container-fluid -->

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<!--     <script src="js/sb-admin-2.min.js"></script> -->

	<!-- Page level plugins -->
	<script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/datatables-demo.js"></script>
</body>
</html>