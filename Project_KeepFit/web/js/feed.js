$(document).ready(function () {

    // 좋아요 클릭 시, 하트 이미지 변경되는 메소드
    let status = false;
    $('#likeIt').click( function () {
        if( status ) {
            $(this).attr('src', 'img/heart.svg');
        } else $(this).attr('src', 'img/heart_filled.svg');
        status = !status;
    });

});