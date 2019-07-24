<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
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

    <!--    &lt;!&ndash;[if lt IE 9]>-->
    <!--    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
    <!--    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
    <!--    <![endif]&ndash;&gt;-->

<style>
.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
} 
</style>

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
                <b><p style="margin-bottom:5px; text-align: left"></p>SpongeBob</b>
            </div>
            <div class="col-xs-12" style="padding-left: 0;font-size: 11px;">
                <p style="">#강남 #양재 #1.45km</p>
            </div>
        </div>
        <div class="col-xs-1" style="padding-left:0; padding-top: 11px">
            <img src="resources/img/images2.png" width="100%">
        </div>
    </div>
    <!--    사진 -->
    <div class="bxslider">
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
    <div class="row" style="padding: 15px 10px; ">
        <div style="float: left">
            <img name="likeIt" src="resources/img/heart.svg" style="margin-left: 10px">
            <a href="https://naver.com" style="margin-left: 5px;margin-right: 20px; color: #000;">좋아요</a>
            <img src="resources/img/comment.svg">
            <a href="comment2.do" onclick="window.open(this.href,'댓글','width=640, height=480'); return false;" style="margin-left: 5px; color: #000;">댓글</a>
        </div>

        
<!-- modal 구동 버튼 (trigger) -->
<button type="button" href="comment2.do" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">
  댓글
</button>

<!-- 80%size Modal at Center -->
<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div align='center' class="modal-body">
          	<%@ include file="comment2.jsp" %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>     



        
        <div style="float: right">
            <img src="resources/img/share.svg">
            <a href="https://nate.com" style="margin-left: 5px;margin-right: 10px; color: #000;">공유</a>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <p style="color:grey;">30분 전</p>
        </div>
    </div>
    <!--    포스팅 끝 -->
    <div class="row" style="width:200%; height:5px; background-color: gainsboro"></div>
    <!--    새 포스트 시작-->
    <!--포스팅 글2-->
    <div class="row" style="margin-top: 10px; margin-bottom: 8px">
        <!--        프로필 사진 -->
        <div class="col-xs-2" style="width: 20%">
            <img width="100%" class="img-circle" src="resources/img/profile.png" alt="profile">
        </div>
        <div class="col-xs-8" style="padding-left: 0;">
            <div class="col-xs-12" style="padding-left: 0;">
                <b><p style="margin-bottom:5px; text-align: left"></p>SpongeBob</b>
            </div>
            <div class="col-xs-12" style="padding-left: 0;font-size: 11px;">
                <p style="">#강남 #양재 #1.45km</p>
            </div>
        </div>
        <div class="col-xs-1" style="padding-left:0; padding-top: 11px">
            <img src="resources/img/images2.png" width="100%">
        </div>
    </div>
    <!--    사진 -->
    <div class="bxslider">
        <div>
            <img src="resources/img/1.jpg" alt="이미지 로딩 중">
        </div>
    </div>
    <div class="row" style="padding: 15px 10px; ">
        <div style="float: left">
            <img name="likeIt" src="resources/img/heart.svg" style="margin-left: 10px"><a
                style="margin-left: 5px;margin-right: 20px; color: #000;">좋아요</a>
            <img src="resources/img/comment.svg"><a style="margin-left: 5px; color: #000;">댓글</a>
        </div>
        <div style="float: right">
            <img src="resources/img/share.svg"><a style="margin-left: 5px;margin-right: 10px; color: #000;">공유</a>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <p style="color:grey;">2시간 전</p>
        </div>
    </div>
    <!--    포스팅 끝 -->
    <div class="row" style="width:200%; height:5px; background-color: gainsboro"></div>
</div>

<div class="container">
<table>
   <c:forEach items="${postList}" var="postList">
     <tr>
       <td>${postList.post_id}</td>
       <td>${postList.post_writer}</td>
       <td>${postList.selected_date}</td>
       <td>${postList.post_date}</td>
       <td>${postList.post_mood}</td>
       <td>${postList.member_tag}</td>
       <td>${postList.privacy}</td>
       <td>${postList.content}</td>
       <td>${postList.path_pic}</td>

     </tr>
   </c:forEach>
   </table>
   </div>

<!-- 1 -->
${postStatus } 
</body>
</html>
