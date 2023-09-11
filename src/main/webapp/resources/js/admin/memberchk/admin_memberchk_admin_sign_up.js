// 회원가입 소스코드 원본: PCL
// 소스코드 사용: LHJ
var status1 = 0;
var status2 = 0;
var status3 = 0;

function log() {
    console.log("아이디 : " + status1);
    console.log("비번 : " + status2);
    console.log("닉네임 : " + status3);
    if (status1 == 1 && status2 == 1 && status3 == 1) {
        document.getElementById('join_chk').disabled = false;
        document.getElementById('join_chk').classList.remove("btn-secondary");
        document.getElementById('join_chk').classList.add("btn-primary");
    } else {
        document.getElementById('join_chk').disabled = true;
        document.getElementById('join_chk').classList.remove("btn-primary");
        document.getElementById('join_chk').classList.add("btn-secondary");
    }
}

function memberJoin_go(f) {
    if (status1 == 1 && status2 == 1 && status3 == 1) {
        log();
        document.getElementById('join_chk').disabled = false;
        f.action = "/admin/admin_join.do";
        f.submit();
    } else {
        document.getElementById('join_chk').disabled = true;
        log();
        alert("전부 입력해주세요.");
    }
}

function pwChk_go() {
    var pw = document.getElementById('password').value;
    var pwChk = document.getElementById('pwcheck').value;

    function checkValidSomeThing(param) {
        var pwtxt = /^(?=.*?[a-z])(?=.*?[0-9]).{8,15}$/;
        return pwtxt.test(param);
    }
    if (pw == null || pw == '' || checkValidSomeThing(pw)) {
        document.getElementById('pwTxt').innerHTML = '';
        status2 = 0;
        log();
    } else if (!checkValidSomeThing(pw)) {
        document.getElementById('pwTxt').innerHTML = ' 최소 8자리 이상 15자리 이하 영문 소문자, 숫자를 사용해주세요.';
        document.getElementById('pwTxt').style.color = "red";
        status2 = 0;
        log();
    }

    if (pwChk == null || pwChk == '') {
        document.getElementById('pwDouble').innerHTML = '';
        status2 = 0;
        log();
    } else if (pw != pwChk) {
        document.getElementById('pwDouble').innerHTML = '비밀번호가 일치하지 않습니다.';
        document.getElementById('pwDouble').style.color = "red";
        status2 = 0;
        log();
    } else {
        document.getElementById('pwDouble').innerHTML = '비밀번호가 일치합니다.';
        document.getElementById('pwDouble').style.color = "green";
        status2 = 1;
        log();
    }
}

$(document).ready(function () {
    $("#id").keyup(function () {
        var chk = $(this).val();
        function checkValidSomeThing(param) {
            var myRe = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            return myRe.test(param);
        }

        var txt = $(".idDoubleChk");
        if (chk === '') {
            txt.text("");
            status1 = 0;
            log();
        } else if (!checkValidSomeThing(chk)) {
            txt.text("이메일 형식으로 입력해주세요.").css("color", "red");
            status1 = 0;
            log();
        } else {
            $.ajax({
                url: "/go_memberIdChk.do",
                method: "post",
                dataType: "text",
                data: "m_id=" + $("#m_id").val(),
                async: false,
                success: function (result) {
                    if (result >= 1) {
                        $(".idDoubleChk").text("중복된 아이디입니다.").css("color", "red");
                        status1 = 0;
                        log();
                    } else {
                        $(".idDoubleChk").text("사용 가능한 아이디입니다.").css("color", "green");
                        status1 = 1;
                        log();
                    }
                },
                error: function () {
                    alert("오류");
                }
            });
        }
    });

    $("#nickname").keyup(function () {
        var chk = $("#nickname").val();
        function checkValidSomeThing(param) {
            var pattern = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
            return pattern.test(param);
        }
        var txt = $(".nickDoubleChk");
        if (chk === '') {
            txt.text("");
            status3 = 0;
            log();
        } else if (!checkValidSomeThing(chk)) {
            txt.text("닉네임은 특수문자를 제외한 2자 이상 10자 이하로 작성해주세요.").css("color", "red");
            status3 = 0;
            log();
        }
        else {
            $.ajax({
                url: "/member_nick_chk.do",
                method: "post",
                dataType: "text",
                data: "m_nick=" + chk,
                async: false,
                success: function (result) {
                    if (result >= 1) {
                        txt.text("중복된 아이디입니다.").css("color", "red");
                        status3 = 0;
                        log();
                    } else {
                        txt.text("사용 가능한 아이디입니다.").css("color", "green");
                        status3 = 1;
                        log();
                    }
                },
                error: function () {
                }
            });
        }
    });
});