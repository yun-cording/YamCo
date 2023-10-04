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
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
.card-img-top {
	width: 300px !important;
	height: 100px !important;
}

.banner_size {
	margin: 20px;
	width: 350px;
	height: 230px;
	border: none;
	display: inline-block;
}

.banner_right {
	margin-right: 150px;
	float: right;
}

.banner_top {
	margin-top: 20px;
}

.gray_btn {
	background-color: gray;
	border-color: gray;
}

.gray_btn_reverse {
	background-color: gray;
	border-color: gray;
}

.stats {
	width: 65%;
	border-radius: 50%;
	margin: 0 auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, .2);
}

.stats_frame {
	width: 500px;
}

.btn_color_temp {
	background-color: rgba(25, 135, 84);
	color: white;
}

.btn-group:active {
	background-color: white;
	color: white;
}

.btn-comp.active {
	background-color: #17a2b8; /* 선택된 버튼의 배경색을 변경 */
	color: white; /* 선택된 버튼의 글자색을 변경 */
}
/* 라디오 버튼을 시각적으로 감추는 클래스 */
.visually-hidden {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	padding: 0;
	border: 0;
	overflow: hidden;
	white-space: nowrap;
}
/* 라디오 버튼의 크기 조정 */
.btn-check.btn-comp:checked+.btn {
	padding: 20px 30px; /* 버튼의 패딩을 조정하여 크기 변경 */
	font-size: 16px; /* 글자 크기 변경 */
}

#below_btns {
	position: absolute;
	left: 290px;
	bottom: calc(14%); /* 반응형으로 top 위치 조정 */
	/* transform: translateY(calc(100px + max(0px, -370px - 100px))); /* 최소 top 위치 제한 */
	*/
	/* 나머지 스타일 설정 */
	background-color: lightgray;
}

.margin_right_left {
	margin-left: 500px;
	margin-right: 500px;
}

.below_btns_c {
	display: flex;
	align-items: center; /* 요소들을 수직 가운데 정렬합니다 */
	padding: 10px;
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

				<div class="container-fluid">
					<h1 class="ml-5 mt-5 font-weight-bold">공지사항 관리페이지</h1>
					<hr>
					<!-- 여기에서 작업하시면 됩니다. -->
					<!-- <h2>여기에서 작업하시면됩니다.</h2> -->
					<!-- 작업 시작!! -->
					<div class="row mb-5 ml-4">
						<div class="col-3">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">삭제된 공지사항 현황</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${notice_list.size() }</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/notice.png" alt="" width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-3">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												<span class="font-weight-bold font">삭제된 광고 현황</span>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${ppl_list.size() }</div>
										</div>
										<div class="col-auto">
											<img src="/resources/images/advertisement.png" alt=""
												width="40px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 버튼그룹 -->
					<div class="row justify-content-between ml-5 mt-5 mb-5">
						<div>
							<button type="button" class="btn btn-success m-1"
								onclick="notice_view()">공지사항 관리</button>
							<button type="button" class="btn btn-success m-1"
								onclick="ppl_view()">광고 관리</button>
							<button type="button" class="btn btn-success m-1"
								onclick="fooding_view()">재료이미지 관리</button>
						</div>
						<div>
							<button class="btn btn-success mr-3"><</button>
							<button class="btn btn-success mr-3">></button>
						</div>
					</div>
					<h2 class="ml-5 mt-5 font-weight-bold" id="subtitle">삭제된 공지사항</h2>
					<hr>
					<!-- 공지사항 넣는 부분 -->
					<div class="flexContainer">
						<c:forEach items="${notice_list }" varStatus="status" var="k">
							<div id="banner_card_${status.index}"
								class="notice banner_size banner_${isOdd ? 'left' : 'left'} banner_top">
								<label for="btnradio${status.index }"> <input
									type="radio" idx=${k.notice_idx } class="btn-check btn-comp"
									name="btnradio" id="btnradio${status.index }"
									style="float: left; position: relative; top: -20px; left: 0px; width: 15px;">
									<img src="/resources/images/${k.notice_img }"
									class="card-img-top" alt="...">
									<h5 class="card-title mt-3">${k.notice_title }</h5>
									<p class="card-text">${k.notice_date }</p>
								</label>
							</div>
						</c:forEach>
						<c:forEach items="${ppl_list }" varStatus="status" var="k">
							<div id="banner_card_${status.index}"
								class="ppl banner_size banner_${isOdd ? 'left' : 'left'} banner_top"
								style="display: none">
								<label for="btnradio_p${status.index }"> <input
									type="radio" idx=${k.ppl_idx } class="btn-check btn-comp"
									name="btnradio" id="btnradio_p${status.index }"
									style="float: left; position: relative; top: -20px; left: 0px; width: 15px;">
									<img src="/resources/images/ads/${k.ppl_img }"
									class="card-img-top" alt="...">
									<h5 class="card-title mt-3">${k.ppl_title }</h5>
									<p class="card-text">${k.ppl_date}</p>
								</label>
							</div>
						</c:forEach>
						<c:forEach items="${fooding_list }" varStatus="status" var="k">
							<div id="banner_card_${status.index}"
								class="fooding banner_size banner_${isOdd ? 'left' : 'left'} banner_top"
								style="display: none">
								<label for="btnradio_f${status.index }"> <input
									type="radio" idx=${k.food_idx } class="btn-check btn-comp"
									name="btnradio" id="btnradio_f${status.index }"
									style="float: left; position: relative; top: -20px; left: 0px; width: 15px;">
									<img src="/resources/images/${k.food_img }"
									class="card-img-top" alt="...">
									<h5 class="card-title mt-3">${k.food_title }</h5>
									<p class="card-text">${k.food_date}</p>
								</label>
							</div>
						</c:forEach>
					</div>
					<!-- 하단 버튼 세개 -->
					<div class="row justify-content-between mb-3">
						<button type="button" class="btn btn-success" id="registPPL">등록중인
							게시물 보기</button>
						<button type="button" class="btn btn-success mr-5"
							id="registButton">등록</button>
					</div>
				</div>
				<!-- 여기까지 작업하시면됩니다. -->
			</div>
		</div>
	</div>
	<!-- End of Content Wrapper -->
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

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- 버튼 클릭 시 색상변경  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
		var kind = "0";
		function notice_view() {
			$("#subtitle").text("삭제된 공지사항")
			kind = "0";
			$(".notice").show();
			$(".ppl").hide();
			$(".fooding").hide();
		}
		function ppl_view() {
			$("#subtitle").text("삭제된 광고")
			kind = "1";
			$(".notice").hide();
			$(".ppl").show();
			$(".fooding").hide();
		}
		function fooding_view() {
			$("#subtitle").text("삭제된 재료")
			kind = "2"
			$(".notice").hide();
			$(".ppl").hide();
			$(".fooding").show();
		}
		$(document)
				.ready(
						function() {
							$("#registButton")
									.click(
											function() {
												if (confirm('등록하시겠습니까?')) {
													var selectedNotice = $('input[name="btnradio"]:checked');
													if (selectedNotice.length > 0) {
														var idx = selectedNotice
																.attr("idx")
														// 여기에서 imageId를 사용하여 이미지를 삭제하거나 처리할 수 있습니다.
														location.href = "/admin/notice_regist.do?idx="
																+ idx
																+ "&kind="
																+ kind
														alert("등록되었습니다. 등록된 공지는 하단 [삭제된 공지]에서 확인 가능합니다.")
													} else {
														alert("라디오 버튼을 선택하세요.");
													}
												}
											});
							$("#registPPL").on("click", function() {
								location.href = "/admin/go_admin_ppl.do"
							})
						});
	</script>
</body>
</html>