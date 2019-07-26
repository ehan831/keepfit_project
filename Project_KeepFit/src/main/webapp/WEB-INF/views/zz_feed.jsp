<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setCharacterEncoding( "UTF-8" );
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home|KeepFit</title>

    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

    <!-- 아이콘 제공 사이트, https://fontawesome.com-->
    <script src="https://kit.fontawesome.com/0c46a3b816.js"></script>

    <!--bx slider-->
    <link rel="stylesheet" href="resources/css/jquery.bxslider.css">
    <script src="resources/js/jquery.bxslider.js"></script>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {
            $('.bxslider').bxSlider({
                infiniteLoop: false,
                pagerType: 'full',
                minSlides: 2,
            });
        });
        //
        // 좋아요 클릭 시, 하트 이미지 변경되는 메소드
        $('i[name=likeIt]').click(function () {
            if ($(this).classList.contains('fa-heartbeat')) {
               $(this).removeClass('fa-heartbeat');
               $(this).addClass('fa-heart');
            } else {
                $(this).removeClass('fa-heart');
                $(this).addClass('fa-heartbeat');
            }
        });

    </script>
    <script src="resources/js/feed.js" type="text/javascript"></script>

    <style>
        .txt_post {
            padding: 1px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            max-height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
        }

        .txt_post_single {
            padding: 1px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            word-break: normal;
            line-height: 1.2em;
        }
    </style>
    <!--    &lt;!&ndash;[if lt IE 9]>-->
    <!--    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
    <!--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
    <!--    <![endif]&ndash;&gt;-->
    <style>
        .bx-viewport {
            /*fix other elements on the page moving (on Chrome)*/
            -webkit-transform: translatez(0);
            max-height: 400px;
        }
    </style>
</head>
<body>


<!-- app bar -->
<div class="container text-left"
     style="background-color:#001b2a;height:40px;border-bottom:solid 1px #b2b2b2; width:100%; z-index:2; position: fixed;
        display: block; overflow: hidden">
    <div class="row" style="height: 40px">
        <img src="resources/img/logo.PNG" height="100%">
    </div>
</div>

<!-- 본문 피드 -->
<div class="container" style="overflow:hidden;">
    <!-- 맨 위 간격 맞추기 -->
    <div class="row" style="margin-top: 45px"></div>
    <!--포스팅 글-->
    <c:forEach var="aa" items="${postList}">
        <div class="row" style="margin-bottom: 8px; margin-top: 8px">
            <!--        프로필 사진 -->
            <div class="col-xs-2" style="width: 20%">
                <img width="100%" class="img-circle" src="resources/img/profile.png" alt="profile">
            </div>
            <div class="col-xs-8" style="padding-left: 0;">
                <div class="col-xs-12" style="padding-left: 0;">
                    <p style="margin-bottom:5px; text-align: left"><b>${aa.post_writer}
                    </b></p>
                </div>
                <div class="col-xs-12" style="padding-left: 0;font-size: 11px;">
                    <p style="">
                        #${aa.post_mood}&nbsp;#${aa.sport_name}&nbsp;#${aa.place_tag}
                    </p>
                </div>
            </div>
                <%--            ... 아이콘 --%>
            <div class="col-xs-1" style="padding-left:0; padding-top: 11px">
                <img src="resources/img/images2.png" width="100%">
            </div>
        </div>
        <!-- 사진 -->
        <div class="bxslider">
            <div>
                <img src="resources/img/${aa.post_id}/1.jpg" alt="이미지 로딩 중">
            </div>
        </div>
        <div class="row" style="margin-right: 0px; margin-left: 0px; background-color: #ffffff">
            <div class="col-sm-8" style="display: inline-block">
                <div class="txt_post_single">
                    <c:set var="m_tag" value="${aa.member_tag}"></c:set>
                    <c:forTokens items="${m_tag}" delims=" " var="token">
                        <b style="color: #0961de">@${token}</b>
                    </c:forTokens>
                </div>
                <div class="txt_post">
                        ${aa.content}
                </div>
            </div>
            <div class="col-sm-2" style="margin-top: 10px">
                <p style="color:grey;float: left; font-size: 80%">
                        <%--                    ${aa.selected_date}--%>
                    <fmt:parseDate value="${aa.selected_date}" var="selected_date"
                                   pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                    <fmt:formatDate value="${selected_date}" pattern="M월 dd일" type="date"></fmt:formatDate>
                </p>
                <p style="color:grey; float:right; font-size:80%;"><a href="">...더 보기</a></p>
            </div>
        </div>
        <%--        좋아요, 댓글, 공유--%>
        <div class="row" style="padding: 15px 10px; ">
            <div style="float: left; font-size: 120% ">
                <b><i name="likeIt" class="far fa-heart" style="margin-left: 10px;"></i></b>
                <a href="https://naver.com" style="margin-left: 1px;margin-right: 20px; color: #000;">좋아요</a>

                <b><i class="far fa-comment-alt" style="margin-left: 1px;"></i></b>
                <a href="https://naver.com" style="margin-left: 1px;margin-right: 20px; color: #000;">댓글</a>
            </div>
            <div style="float: right; font-size: 120%">
                <b><i class="far fa-share-square" style="margin-left: 10px;"></i></b>
                <a href="https://naver.com" style="margin-left: 1px;margin-right: 20px; color: #000;">공유</a>
            </div>
        </div>
        <%--        구버전 아이콘들--%>
        <%--        <div class="row" style="padding: 15px 10px; ">--%>
        <%--            <div style="float: left">--%>
        <%--                <img name="likeIt" src="resources/img/heart.svg" style="margin-left: 10px">--%>
        <%--                <a href="https://naver.com" style="margin-left: 5px;margin-right: 20px; color: #000;">좋아요</a>--%>
        <%--                <img src="resources/img/comment.svg">--%>
        <%--                <a href="https://nate.com" style="margin-left: 5px; color: #000;">댓글</a>--%>
        <%--            </div>--%>
        <%--            <div style="float: right">--%>
        <%--                <img src="resources/img/share.svg">--%>
        <%--                <a href="https://nate.com" style="margin-left: 5px;margin-right: 10px; color: #000;">공유</a>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <!-- 포스팅 끝 -->
        <div class="row" style="width:200%; height:5px; background-color: gainsboro;"></div>
    </c:forEach>
</div>
</body>
</html>
