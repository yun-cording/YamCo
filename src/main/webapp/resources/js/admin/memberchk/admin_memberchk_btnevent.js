// Submit 기능을 하는 버튼을 눌렀을 경우 formData를 보낸다.
function goSubmit(f) {
    f.submit();
}

function dropOut(m_idx) {
    swal({
        title: "계정 탈퇴",
        text: "해당 사용자의 계정 탈퇴시키겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willDropOut) => {
        if(willDropOut) {
            swal({
                title: "계정 탈퇴 시 복구 불가",
                text: "정말로 계정 탈퇴를 진행할까요?",
                icon: "warning",
                buttons: true,
                dangerMode: true,
              }).then((willDropOutChk) => {
                if(willDropOutChk) {
                    location.href = "/go_admin_memberchk_update.do?m_idx=" + m_idx + "&m_status=3";
                }
              });
        }
      });
}

function openLock(m_idx) {
    swal({
        title: "계정 잠김 해제",
        text: "해당 사용자의 계정 잠김을 해제하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willOpenLock) => {
        if(willOpenLock) {
            location.href = "/go_admin_memberchk_update.do?m_idx=" + m_idx + "&m_fail_count=0";
        }
      });
}

function openWrite(m_idx) {
    swal({
        title: "작성 금지 해제",
        text: "해당 사용자의 게시물 작성을 허용하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willOpenLock) => {
        if(willOpenLock) {
            location.href = "/go_admin_memberchk_update.do?m_idx=" + m_idx + "&m_status=1";
        }
      });
}

function banWrite(m_idx) {
    swal({
        title: "작성 금지",
        text: "해당 사용자의 게시물 작성을 금지하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willOpenLock) => {
        if(willOpenLock) {
            location.href = "/go_admin_memberchk_update.do?m_idx=" + m_idx + "&m_status=4";
        }
      });
}

$(document).ready(function () {
    // 1일 버튼 클릭시
    $("#btn_1day").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜로 값 지정)
                var today = new Date().toISOString().substr(0, 10); // 오늘 날짜를 YYYY-MM-DD 형식으로 가져옴
                inputStartday.val(today);
                inputEndday.val(today);
            }
            else { //종료일을 기준으로 시작일도 같게 함
                inputStartday.val(inputEndday.val());
            }
        } else if (inputEndday.val() === "") { //시작일을 기준으로 종료일도 같게 함
            inputEndday.val(inputStartday.val());
        } else {  //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜로 값 지정)
            var today = new Date().toISOString().substr(0, 10);
            inputStartday.val(today);
            inputEndday.val(today);
        }
    });

    // 7일 버튼 클릭시
    $("#btn_7day").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜를 기준으로 일주일 지정)
                var startday = new Date().toISOString().substr(0, 10);
                var oneWeekLater = new Date();
                oneWeekLater.setDate(oneWeekLater.getDate() + 7);
                var endday = oneWeekLater.toISOString().substr(0, 10);
                inputStartday.val(startday); // 오늘 날짜로 값 지정
                inputEndday.val(endday); // 일주일 후로 값 지정
            }
            else { //종료일을 기준으로 일주일 전을 시작일로 정함
                var endday = new Date(inputEndday.val());
                var startday = new Date(endday.toISOString().substr(0, 10));
                startday.setDate(endday.getDate() - 7);
                inputStartday.val(startday.toISOString().substr(0, 10));
            }
        } else if (inputEndday.val() === "") { //시작일을 기준으로 일주일 후를 종료일로 정함
            var startday = new Date(inputStartday.val());
            var endday = new Date(startday.toISOString().substr(0, 10));
            endday.setDate(startday.getDate() + 7);
            inputEndday.val(endday.toISOString().substr(0, 10));
        } else {  //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜를 기준으로 일주일 지정)
            var startday = new Date().toISOString().substr(0, 10);
            var oneWeekLater = new Date();
            oneWeekLater.setDate(oneWeekLater.getDate() + 7);
            var endday = oneWeekLater.toISOString().substr(0, 10);
            inputStartday.val(startday);
            inputEndday.val(endday);
        }
    });

    //1달 버튼 클릭시
    $("#btn_1month").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") { //시작일, 종료일 둘 다 입력값이 없는 경우(오늘 날짜를 기준으로 한달 지정)
                var startday = new Date().toISOString().substr(0, 10);
                var oneWeekLater = new Date();
                oneWeekLater.setMonth(oneWeekLater.getMonth() + 1);
                var endday = oneWeekLater.toISOString().substr(0, 10);
                inputStartday.val(startday); // 오늘 날짜로 값 지정
                inputEndday.val(endday); // 한달 후로 값 지정
            }
            else { //종료일을 기준으로 한달 전을 시작일로 정함
                var endday = new Date(inputEndday.val());
                var startday = new Date(endday.toISOString().substr(0, 10));
                startday.setMonth(endday.getMonth() - 1);
                inputStartday.val(startday.toISOString().substr(0, 10));
            }
        } else if (inputEndday.val() === "") { //시작일을 기준으로 한달 후를 종료일로 정함
            var startday = new Date(inputStartday.val());
            var endday = new Date(startday.toISOString().substr(0, 10));
            endday.setMonth(startday.getMonth() + 1);
            inputEndday.val(endday.toISOString().substr(0, 10));
        } else { //시작일, 종료일 둘 다 입력값이 있는 경우(오늘 날짜를 기준으로 한달 지정)
            var startday = new Date().toISOString().substr(0, 10);
            var oneWeekLater = new Date();
            oneWeekLater.setMonth(oneWeekLater.getMonth() + 1);
            var endday = oneWeekLater.toISOString().substr(0, 10);
            inputStartday.val(startday);
            inputEndday.val(endday);
        }
    });
});