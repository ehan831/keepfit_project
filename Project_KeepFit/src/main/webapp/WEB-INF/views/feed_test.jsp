<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
    String selected_date = request.getParameter( "selected_date" );
    String member_tag = request.getParameter( "member_tag" );
    String post_mood = request.getParameter( "post_mood" );
    String sport_name = request.getParameter( "sport_name" );
    String place_tag = request.getParameter( "place_tag" );
    String content = request.getParameter( "content" );
    String post_id = request.getParameter( "post_id" );
    String post_writer = request.getParameter( "post_writer" );
    String privacy = request.getParameter( "privacy" );
%>

<%-- 이름 태그 토커나이즈 --%>
<c:set var="member_tag" value="<%=member_tag%>"/>

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
            crossorigin="anonymous">d
    </script>

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
            word-wrap:break-word;
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
            word-wrap:break-word;
            word-break: normal;
            line-height: 1.2em;
        }
    </style>
    <!--    &lt;!&ndash;[if lt IE 9]>-->
    <!--    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
    <!--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
    <!--    <![endif]&ndash;&gt;-->

</head>
<body>


<!-- app bar -->
<div class="container text-left"
     style="background-color:#f9f9f9;height:40px;border-bottom:solid 1px #b2b2b2; width:100%; z-index:2; position: fixed">
    <h2 style="margin-top:9px; color:#00306a; font-size: 20px"><img src="resources/img/logo.PNG" width="15%"></h2>
</div>




<div class="container" style="overflow:hidden;">
    <!--    맨 위 간격 맞추기 -->
    <div class="row" style="margin-top: 53px"></div>
    <!--포스팅 글-->
    <div class="row" style="margin-bottom: 8px">
        <!--        프로필 사진 -->
        <div class="col-xs-2" style="width: 20%">
            <img width="100%" class="img-circle" src="resources/img/profile.png" alt="profile">
        </div>
        <div class="col-xs-8" style="padding-left: 0;">
            <div class="col-xs-12" style="padding-left: 0;">
                <p style="margin-bottom:5px; text-align: left"><b><%=post_writer%></b></p>
            </div>
            <div class="col-xs-12" style="padding-left: 0;font-size: 11px;">
                <p style="">
                    #<%=post_mood%> #<%=sport_name%> #<%=place_tag%>
                </p>
            </div>
        </div>
        <div class="col-xs-1" style="padding-left:0; padding-top: 11px">
            <img src="resources/img/images2.png" width="100%">
        </div>
    </div>
    <!--    사진 -->
    <div class="bxslider" style="overflow: hidden; width: 100%;">
        <div>
            <img src="resources/img/2.jpg" alt="이미지 로딩 중">
        </div>
        <div>
            <img src="resources/img/3.jpg" alt="이미지 로딩 중">
        </div>
        <div>
            <img src="resources/img/4.jpg" alt="이미지 로딩 중">
        </div>
    </div>
    <div class="row" style="margin-right: 0px; margin-left: 0px; background-color: #ffffff">
        <div class="col-sm-8" style="display: inline-block">
            <div class="txt_post_single">
            <c:forTokens items="${member_tag}" delims=" " var="token">
                <b style="color: #0961de;">@${token}</b>
            </c:forTokens>
            </div>
            <div class="txt_post">
                <%=content%>
            </div>
        </div>
        <div class="col-sm-2">
            <p style="color:grey;float: right; font-size: 80%"><%=selected_date%>
            </p>
        </div>
    </div>
    <div class="row" style="padding: 15px 10px; ">
        <div style="float: left">
            <img name="likeIt" src="resources/img/heart.svg" style="margin-left: 10px">
            <a href="https://naver.com" style="margin-left: 5px;margin-right: 20px; color: #000;">좋아요</a>
            <img src="resources/img/comment.svg">
            <a href="https://nate.com" style="margin-left: 5px; color: #000;">댓글</a>
        </div>
        <div style="float: right">
            <img src="resources/img/share.svg">
            <a href="https://nate.com" style="margin-left: 5px;margin-right: 10px; color: #000;">공유</a>
        </div>
    </div>
    <!--    포스팅 끝 -->
    <div class="row" style="width:200%; height:5px; background-color: gainsboro"></div>
</div>
</html>
