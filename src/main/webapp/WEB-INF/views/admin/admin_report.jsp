<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 신고관리</title>
<!-- 부트스트랩 사용하기위해 필요한 라이브러리  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>

	<!-- 알럿창꾸미기 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    
    <script type="text/javascript">
    function chk() {
    	 Swal.fire({
    		  position: 'middle',
    		  icon: 'success',
    		  title: '블라인드 처리 되었습니다.',
    		  showConfirmButton: false,
    		  timer: 2000
    		})
	}
    </script>
  </head>
  <body>
    <div id="Mydiv"> <!-- div 시작-->
    <p>신고 내역 관리</p>
    <!-- 버튼시작 -->
    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
      <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
      <label class="btn btn-outline-primary" for="btnradio1">게시글</label>
    
      <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio2">댓글</label>
    
      <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
      <label class="btn btn-outline-primary" for="btnradio3">처리된 내용들</label>
    </div>
    <!-- 버튼 끝 -->
    <br>
    <!-- 라디오 버튼 시작 -->
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
      <label class="form-check-label" for="inlineRadio1">욕설/비하</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
      <label class="form-check-label" for="inlineRadio2">성희롱</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
      <label class="form-check-label" for="inlineRadio3">광고</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4">
      <label class="form-check-label" for="inlineRadio4">허위정보</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5">
      <label class="form-check-label" for="inlineRadio5">기타</label>
    </div>
    <!-- 라디오 버튼 끝 -->
   
    <!-- 테이블 시작 -->
    <table class="table table-striped table-hover">
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
        <th scope="row">1</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">2</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">3</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">4</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">5</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">6</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">7</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">8</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">9</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">10</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">11</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
      <tr>
        <th scope="row">12</th>
        <td>ysh</td>
        <td>4</td>
        <td>심바gray의 50가지 레시피</td>
        <td>myBigSecret...</td>
        <td>**************</td>
        <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">답변 미작성</button></td>
        <td><button class="btn btn-primary" onclick="chk()">블라인드 처리하기</button></td>
      </tr>
    </tbody>
    </table>
    <!-- 테이블 끝 -->

    <!-- 모달 시작 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
    <!-- 모달 끝 -->

    <!-- 페이징 시작 -->
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item disabled">
          <a class="page-link">Previous</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </nav>
    <!-- 페이징 끝 -->
   </div> <!-- div끝 -->
  </body>
</html>
</html>