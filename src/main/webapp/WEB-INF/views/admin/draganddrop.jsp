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
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Plugin -->

<link rel="stylesheet"
	href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css" />
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>

<style type="text/css">
body {
	background: #EEE;
	font-family: 'Roboto', sans-serif;
}

.dropzone {
	width: 98%;
	height:1000px;
	margin: 1%;
	border: 2px dashed #3498db !important;
	border-radius: 5px;
	-webkit-transition: .2s;
	transition: .2s;
	multiple: false;
}

.dropzone.dz-drag-hover {
	border: 2px solid #3498db !important;
}

.dz-message.needsclick img {
	width: 50px;
	display: block;
	margin: auto;
	opacity: .6;
	margin-bottom: 15px;
}

span.plus {
	display: none;
}
#dropzone{
	margin-top: 280px;
}

.dropzone.dz-started .dz-message {
	display: inline-block !important;
	width: 350px;
	float: right;
	border: 1px solid rgba(238, 238, 238, 0.36);
	border-radius: 30px;
	height: 350px;
	margin: 16px;
	-webkit-transition: .2s;
	transition: .2s;
}

.dropzone.dz-started .dz-message span.text {
	display: none;
}

.dropzone.dz-started .dz-message span.plus {
	display: block;
	font-size: 70px;
	color: #AAA;
	line-height: 110px;
}
/* 
#titletext{
	width:1420px;
	height: 35px;
	font-size: 28px;
	outline: none;
}	 */

.btn1{
	float: right;
}
.zone_position{
	margin-top: 350px;
}
#titletext{
	margin-top: 10px;
	width: 45%;
}
.dropzone .dz-preview .dz-image {
  width: 1200px;
  height: 500px;
  position: relative;
	top: -500px;  
	left: 100px;
	border-radius: 10px;
	text-align: center;
}
.dz-preview{
	height: 0px;
	position: relative;
	top: -100px;
	border-radius: 10px;
}
.dz-image{
	text-align: center;
	border-radius: 10px;
	position: relative;
	left: -150px;
}
#demo-upload{
	height: 800px;
	border-radius: 10px;
	text-align: center;
}
.dz-details{
	margin-top: -150px;
}

img{vertical-align:middle;
	text-align: center;
}

/*# sourceMappingURL=ss.css.map */
</style>

<script>
/* 여기 빼버리면 ajax 작동 안함! */
Dropzone.autoDiscover = false;
/* Dropzone.options.myAwesomeDropzone = {
		  thumbnailWidth: 550,
		  thumbnailHeight: 550,
		} */
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		console.log("작동한다!");
		var myDropzone = new Dropzone(".dropzone", {
		    /* url: 'http://localhost:8080/', */
		    method: "post",
		    autoProcessQueue: false, //자동으로 보내기 방지
		    /* 나중에 myDropzone.processQueue(); 으로 업로드 */
		    paramName: 'files',
		    parallelUploads: 99,
		    maxFilesize: 10, // MB
		    uploadMultiple: false,
		    maxFiles: 1,
		    createImageThumbnails: true,
		    thumbnailWidth:1500, // 미리보기 이미지의 가로 크기
		    thumbnailHeight:500, // 세로 크기
		    acceptedFiles: ".jpeg,.jpg,.png,.gif",
		    thumbnailMethod: "contain",
		    ignoreHiddenFiles: true,
		    autoQueue: false,
			 init: function() {
                this.on("addedfile", function(file) {
                    // 파일이 추가될 때의 동작
            		console.log("작동2한다!");
                    // 비활성화
                    alert("사진 첨부는 1장만 가능합니다.");
            		 /* $(".dropzone").attr("disabled", true); 
            		 clickable: false;  */
                });
		    }, 
		    
/* 		    headers: {
		        "Authorization": 'Bearer ' + token //localstorage에 저장된 token
		    }, */
		});
	});
</script>
<script type="text/javascript">






/* var dropzoneFile=new Dropzone("#dropzone-file",{
    url:'url 설정',
    maxFilesize:5000000000,
    parallelUploads:5,    //한번에 올릴 파일 수
    addRemoveLinks:  true, //업로드 후 삭제 버튼 
    timeout:300000,	//커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
    maxFiles:1,       //업로드 할 최대 파일 수
    paramName:"file", //파라미터로 넘길 변수명 default는 file
    autoQueue:true,	//드래그 드랍 후 바로 서버로 전송
    createImageThumbnails:true,	//파일 업로드 썸네일 생성
    uploadMultiple:true,	//멀티파일 업로드
    dictRemoveFile:'삭제',	//삭제 버튼의 텍스트 설정
    dictDefaultMessage:'PREVIEW', //미리보기 텍스트 설정
    accept:function(file,done){
        //validation을 여기서 설정하면 된다.
        //설정이 끝나고 꼭 done()함수를 호출해야 서버로 전송한다. 
        done(); 
    },
    init:function(){
        this.on('success',function(file,responseText){
            var obj = JSON.parse(responseText);
            //서버로 파일이 전송되면 실행되는 함수이다.
            //obj 객체를 확인해보면 서버에 전송된 후 response 값을 확인할 수 있다.
        })
    }
    				     
});
 */
/*  Dropzone.options.imageUpload = {

	    maxFilesize:10,

	    maxFiles: 1,

	    

	}; */
 

		
		
	/* 	 var currentFile = null; 
		  Dropzone.autoDiscover = false;
		        $('.dropzoneForm').dropzone({
		            //parameter name value
		            paramName: "files",
		            autoProcessQueue: false,
		            maxFiles: 1,         
		            addRemoveLinks: true,
		            dictResponseError: 'Server not Configured',
		            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",// use this to restrict file type
		            init: function () {
		                var submitButton = document.querySelector("#SaveImage");
		                var dropzoneForm = this;

		                submitButton.addEventListener("click", function () {
		                    dropzoneForm.processQueue();
		                });
		                this.on("addedfile", function (file) {
		                    if (currentFile) {
		                        currentFile.previewElement = null;
		                        this.removeFile(currentFile);
		                    }
		                    currentFile = file;
		                });
		                this.on("success",
		                    function (file) {
		                        var res = eval('(' + file.xhr.responseText + ')');
		                        dropzoneForm.removeFile(file);
		                        $("#modalUploadPic").modal('hide');
		                        window.location = res.newurl;
		                    });
		            }
		        }); */
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
					<h1 class="ml-5 mt-5 font-weight-bold">공지사항 배너 등록</h1>
					<hr>

					<!-- 여기에서 작업하시면 됩니다. -->

				<!-- 라디오 버튼 시작 -->
					<div style="margin-left: 26px;">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
							<label class="form-check-label" for="inlineRadio1">공지사항</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="option2">
							<label class="form-check-label" for="inlineRadio2">광고</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio3" value="option3">
							<label class="form-check-label" for="inlineRadio3">재료 이미지</label>
						</div>
						<!-- 라디오 버튼 끝 -->
						<!-- 드레그앤드랍 부분 시작-->
					<form action="https://httpbin.org/post" class="dropzone needsclick dropoption"
						id="demo-upload">
						<div id="titletextbox">
										<label style="font-size: 24px;">제목 :  </label>
										<input type="text" id="titletext">
										<hr>
										</div>
						<div id="dropzone" class="zone_position">
							<div class="dz-message needsclick">
								<span class="text"> <img
									src="http://www.freeiconspng.com/uploads/------------------------------iconpngm--22.png"
									alt="Camera" /> 여기를 클릭하거나 업로드할 파일을 끌어다 놓으세요.
								</span> 
<!-- 								<span class="plus">+</span> -->
							</div>
						</div>
					</form>
						<!-- 드레그앤드랍 부분 끝-->
					<button type="button" class="btn1 btn-secondary btn-lg">취소</button>
						<button type="button" class="btn1 btn-success btn-lg">등록</button>
						
					<!-- 여기까지 작업하시면됩니다. -->


				</div>
			</div>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	</div>

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
					<a class="btn btn-danger" href="/logOut.do">로그아웃</a>
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

</body>

</html>