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
	height:750px;
	margin: 1%;
	border: 2px dashed #3498db !important;
	border-radius: 5px;
	-webkit-transition: .2s;
	transition: .2s;
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

#titletext{
	width:1420px;
	height: 35px;
	font-size: 28px;
	outline: none;
}	

.btn1{
	float: right;
}
.zone_position{
	margin-top: 220px;
}
#titletext{
	margin-top: 10px;
	width: 95%;
}
/*# sourceMappingURL=ss.css.map */
</style>

<script type="text/javascript">
	interface Props {
	  contentImageState: {
	    contentImage: File | null;
	    setContentImage: Function;
	  };
	}

	function ImageInputBlock({ contentImageState }: Props) {
	  const [isDragging, setIsDragging] = useState(false);

	  // 부모 컴포넌트에서 내려준 contentImage state
	  const { contentImage, setContentImage } = contentImageState;

	  const onDragEnter = (e: React.DragEvent<HTMLDivElement>) => {
	    e.preventDefault();
	    e.stopPropagation();
	    setIsDragging(true);
	  };
	  const onDragLeave = (e: React.DragEvent<HTMLDivElement>) => {
	    e.preventDefault();
	    e.stopPropagation();
	    setIsDragging(false);
	  };
	  const onDragOver = (e: React.DragEvent<HTMLDivElement>) => {
	    e.preventDefault();
	    e.stopPropagation();
	    if (e.dataTransfer.files) {
	      setIsDragging(true);
	    }
	  };
	  const onDrop = (e: React.DragEvent<HTMLDivElement>) => {
	    e.preventDefault();
	    e.stopPropagation();
	    setContentImage(e.dataTransfer.files[0]);
	    setIsDragging(false);
	  };

	  return (
	      <DndBox
	          onDragEnter={onDragEnter}
	          onDragLeave={onDragLeave}
	          onDragOver={onDragOver}
	          onDrop={onDrop}

			  // styled components props
	          isDragging={isDragging}
	      >
	      </DndBox>
		);
	}
</script>

<script type="text/javascript">
const onContentImageChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      setContentImage(e.target.files[0]);
    }
  };

  return (
  		<input
            type="file"
            accept=".png,.jpg,.jpeg"
            id="input-file"
            style={{ display: "none" }}
  			aria-hidden
            onChange={onContentImageChange}
          />
         <DndBox
            onDragEnter={onDragEnter}
            onDragLeave={onDragLeave}
            onDragOver={onDragOver}
            onDrop={onDrop}
            isDragging={isDragging}
          >
             <label htmlFor="input-file" role="button">
                이미지 가져오기
             </label>
         </DndBox>
  )
</script>

<script type="text/javascript">
const [contentImageUrl, setContentImageUrl] = useState<string | null>(null);

const readImage = (image: File) => {
  const reader = new FileReader();
  reader.onload = function (e) {
    setContentImageUrl(String(e.target?.result));
  };
  reader.readAsDataURL(image);
};

const onDrop = (e: React.DragEvent<HTMLDivElement>) => {
	// ...
  readImage(e.dataTransfer.files[0]);
};

const onContentImageChange = (e: ChangeEvent<HTMLInputElement>) => {
  if (e.target.files) {
    setContentImage(e.target.files[0]);
    readImage(e.target.files[0]);
  }
};

return (
 	 <ImageBox>
      {contentImageUrl && (
          <img
            alt="문제 이미지 미리보기"
            src={contentImageUrl}
            onClick={() => onModalStateChange({ state: true })}
          />
      )}
   </ImageBox>
)
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
										<label style="size: 35px;">제목 :  </label>
										<input type="text" id="titletext">
										<hr>
										</div>
						<div id="dropzone" class="zone_position">
							<div class="dz-message needsclick">
								<span class="text"> <img
									src="http://www.freeiconspng.com/uploads/------------------------------iconpngm--22.png"
									alt="Camera" /> 여기를 클릭하거나 업로드할 파일을 끌어다 놓으세요.
								</span> <span class="plus">+</span>
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
					<a class="btn btn-danger" href="login.html">로그아웃</a>
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