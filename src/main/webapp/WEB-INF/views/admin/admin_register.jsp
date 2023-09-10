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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">


<!-- Plugin -->
<style type="text/css">
body {
	background: #EEE;
	font-family: 'Roboto', sans-serif;
}

.dropzone {
	width: 98%;
	height: 750px;
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

#titletext {
	width: 1420px;
	height: 35px;
	font-size: 28px;
	outline: none;
}

.btn1 {
	float: right;
}

.zone_position {
	margin-top: 220px;
}

#titletext {
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


					<form enctype="multipart/form-data" method="post"
						onsubmit="send(this)">
						<!-- 라디오 버튼 시작 -->
						<div class="input-group m-3">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="category"
									id="notice" value="notice" checked> <label
									class="form-check-label" for="notice">공지사항</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="category"
									id="ppl" value="ppl"> <label class="form-check-label"
									for="ppl">광고</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="category"
									id="food_ing" value="food_ing"> <label
									class="form-check-label" for="food_ing">재료 이미지</label>
							</div>
						</div>
						<!-- 라디오 버튼 끝 -->
						<div class="input-group m-3">
							<label class="input-group-text" for="title">제목</label> <input
								name="title" type="text" class="form-control"
								placeholder="제목을 입력하시오" required>
						</div>

						<div style="margin-top: 35px;">
							<img id="thumnail_img_pick" class="rounded mx-auto d-block"
								src="" alt="이미지를 첨부하세요">

							<div class="input-group m-3">
								<label class="input-group-text" for="fileInput">이미지</label> <input
									type="file" class="form-control" id="fileInput"
									name="upload_img" accept="image/*" required>
							</div>
						</div>

						<div>
							<button type="submit" class="btn1 btn-secondary btn-lg">등록</button>
							<input type="reset" class="btn1 btn-success btn-lg" value="취소">
						</div>
					</form>

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

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script type="text/javascript">
	function send(f) {
		f.action="/admin/saveAdminImage.do";
		f.submit();
	}
	
	$(document).ready(function() {
		/* 초기 이미지 설정 */		
		var imgTag = $("#thumnail_img_pick");
		$("#thumnail_img_pick").attr("src", "/resources/images/notice_exam.png");
		$("#thumnail_img_pick").attr("width", "900px");
		$("#thumnail_img_pick").attr("height", "330px");
		
		// 이미지 등록시 실행될 메소드
		$("#fileInput").on("change", function() {
			var selectFile = this.files[0]; // 파일을 받는다

			const reader = new FileReader();
			
			reader.onload = function (e) {
			$('#thumnail_img_pick').attr("src", e.target.result );
			};
			
			reader.readAsDataURL(selectFile);
		});
		
		/* 배너크기에 따라 화면에 출력되는 이미지 크기 조정 */
		$(".form-check-input").on("change", function () {
			var curID = $(this).attr("id");
			var imgWidth = "900px";
			var imgHeight = "330px";
			var duration = 500;
			
			switch(curID) {
			case "notice":
				break;
			case "ppl":
			case "food_ing":
				imgWidth = "300px";
				imgHeight = "275px";
				break;
			}

			imgTag.animate({
				width: imgWidth,
				height: imgHeight
			}, duration);
		});
	});	 
</script>

</body>

</html>