$(document).ready(function () {
    // $('#pass').keyup(function () {
    //    $('font[name=check]').text("")
    // }); // 비밀번호 키업
    //
    // $('#pass2').keyup(function () {
    //    if($('#pass').val() != $('#pass2').val()) {
    //        $('font[name=check]').text("");
    //        $('font[name=check]').html("비밀번호와 일치하지 않습니다.");
    //    } else {
    //        $('font[name=check]').text("");
    //        $('font[name=check]').html("일치 :) ");
    //    }
    // });

    $('#pass').keyup(function () {
        // $('#lblError').remove(); // 제거
        $('#font').text(''); // 클리어
    });

    //[2] 암호 확인 기능 구현
    $('#pass2').keyup(function () {
        if ($('#pass').val() != $('#pass2').val()) {
            $('#font').text(''); // 클리어
            $('#font').html("<b> 암호가 일치하지 않습니다. </b>").css('color', 'red'); // 레이어에 HTML 출력
        } else {
            $('#font').text(''); // 클리어
            $('#font').html("<b> 일치 :) </b>").css('color', 'blue'); // 레이어에 텍스트 출력
        }
    });
});