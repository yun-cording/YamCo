<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    .modal-body{
    	font-size: 15px;
    }
    
    .form-check-label{
    	font-size: 13px;
    }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <script>
  $(function(){
  	$("#modal1").click(function() {
		var chkbox = $(this).is(":checked");
	if(chkbox){ 
		$("#modal1").css("background-color", "white");
		$("#modal1").attr("disabled", true);
	}else{
		$("#flexCheckDefault").css("background-color", "white");
	}
  	});
  });
  
  $(function(){
  	$("#flexCheckDefault").click(function() {
		var chkbox = $(this).is(":checked");
	if(chkbox){ 
		$("#modal1").css("background-color", "tomato");
		$("#modal1").attr("disabled", true);
		$("#flexCheckDefault").css("background-color", "tomato");
	}else{
		$("#flexCheckDefault").css("background-color", "white");	
	}
  	});
  });

</script>
</head>
<body>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="" id="modal1" data-bs-toggle="modal" data-bs-target="#myModal">
</div>
    
  <!-- Modal -->
  <div class="modal" id="myModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-scrollable  modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel" style="color: tomato;">개인 회원 약관에 동의</h1>
        </div>
        <div class="modal-body">
            제공된 개인정보
            (이용자 식별자 기본제공, 그 외 제공 항목이 있을 경우 아래 별도 기재)는 이용자 식별, 통계, 계정 연동 및 CS 등을 위해 
            서비스 이용기간 동안 활용/보관 됩니다. 본 제공 동의를 거부할 권리가 있으나, 
            동의를 거부하실 경우 서비스 이용이 제한될 수 있습니다.            
        </div>
        <div class="modal-footer">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-bs-dismiss="modal" aria-label="Close">
                <label class="form-check-label" for="flexCheckDefault">
                  위 내용에 동의합니다.
                </label>
              </div>
        </div>
      </div>
    </div>
  </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>