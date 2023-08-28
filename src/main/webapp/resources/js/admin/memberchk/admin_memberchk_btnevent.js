// Submit 기능을 하는 버튼을 눌렀을 경우 formData를 보낸다.
function goSubmit(f) {
    f.submit();
}

$(document).ready(function () {
    // 처음에 전체회원 버튼의 라벨이 선택된 것으로 표시되게 한다.
    $(".member_type[value='all']").siblings("label").removeClass("btn-outline-primary").addClass("btn-primary");

    //reset 버튼을 누르면 라벨들의 클래스를 초기화한다.
    $('input[type="reset"]').on("click", function () {
        $(".member_type").each(function () {
            $(this).siblings("label").removeClass("btn-primary").addClass("btn-outline-primary");
        });
        $(".member_type[value='all']").siblings("label").removeClass("btn-outline-primary").addClass("btn-primary");

        $(".member_lock, .member_ban").each(function () {
            $(this).siblings("label").removeClass("btn-danger").addClass("btn-outline-danger");
        });
        $(".member_dropout").siblings("label").removeClass("btn-secondary").addClass("btn-outline-secondary");
    });

    //member_type 라디오 버튼 중 하나가 선택되면 라벨들의 클래스를 변경한다.
    $(".member_type").on("change", function () {
        $(".member_type").each(function () {
            $(this).siblings("label").removeClass("btn-primary").addClass("btn-outline-primary");
        });
        if ($(this).is(":checked")) {
            $(this).siblings("label").removeClass("btn-outline-primary").addClass("btn-primary");
        }
    });

    //member_lock, member_ban 체크박스 버튼이 선택되면 라벨의 클래스를 변경한다.
    $(".member_lock, .member_ban").on("change", function () {
        if ($(this).is(":checked")) {
            $(this).siblings("label").removeClass("btn-outline-danger").addClass("btn-danger");
        } else {
            $(this).siblings("label").removeClass("btn-danger").addClass("btn-outline-danger");
        }
    });

    //member_dropout 체크박스 버튼이 선택되면 라벨의 클래스를 변경한다.
    $(".member_dropout").on("change", function () {
        if ($(this).is(":checked")) {
            $(this).siblings("label").removeClass("btn-outline-secondary").addClass("btn-secondary");
        } else {
            $(this).siblings("label").removeClass("btn-secondary").addClass("btn-outline-secondary");
        }
    });

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