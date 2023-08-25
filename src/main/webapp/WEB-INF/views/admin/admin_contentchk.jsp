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
   
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
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
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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