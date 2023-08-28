
$(document).ready(function () {
    $("#btn_1day").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") {
                var today = new Date().toISOString().substr(0, 10); // 오늘 날짜를 YYYY-MM-DD 형식으로 가져옴
                inputStartday.val(today); // 오늘 날짜로 값 지정
                inputEndday.val(today); // 오늘 날짜로 값 지정
            }
            else {
                inputStartday.val(inputEndday.val());
            }
        } else if (inputEndday.val() === "") {
            inputEndday.val(inputStartday.val());
        }
    });

    $("#btn_7day").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") {
                var startday = new Date().toISOString().substr(0, 10);
                var oneWeekLater = new Date();
                oneWeekLater.setDate(oneWeekLater.getDate() + 7);
                var endday = oneWeekLater.toISOString().substr(0, 10);
                inputStartday.val(startday); // 오늘 날짜로 값 지정
                inputEndday.val(endday); // 일주일 후로 값 지정
            }
            else {
                var endday = new Date(inputEndday.val());
                var startday = new Date(endday.toISOString().substr(0, 10));
                startday.setDate(endday.getDate() - 7);
                inputStartday.val(startday.toISOString().substr(0, 10));
            }
        } else if (inputEndday.val() === "") {
            var startday = new Date(inputStartday.val());
            var endday = new Date(startday.toISOString().substr(0, 10));
            endday.setDate(startday.getDate() + 7);
            inputEndday.val(endday.toISOString().substr(0, 10));
        }
    });

    $("#btn_1month").on("click", function () {
        var inputStartday = $("#input_startday");
        var inputEndday = $("#input_endday");

        if (inputStartday.val() === "") {
            if (inputEndday.val() === "") {
                var startday = new Date().toISOString().substr(0, 10);
                var oneWeekLater = new Date();
                oneWeekLater.setMonth(oneWeekLater.getMonth() + 1);
                var endday = oneWeekLater.toISOString().substr(0, 10);
                inputStartday.val(startday); // 오늘 날짜로 값 지정
                inputEndday.val(endday); // 한달 후로 값 지정
            }
            else {
                var endday = new Date(inputEndday.val());
                var startday = new Date(endday.toISOString().substr(0, 10));
                startday.setMonth(endday.getMonth() - 1);
                inputStartday.val(startday.toISOString().substr(0, 10));
            }
        } else if (inputEndday.val() === "") {
            var startday = new Date(inputStartday.val());
            var endday = new Date(startday.toISOString().substr(0, 10));
            endday.setMonth(startday.getMonth() + 1);
            inputEndday.val(endday.toISOString().substr(0, 10));
        }
    });
});