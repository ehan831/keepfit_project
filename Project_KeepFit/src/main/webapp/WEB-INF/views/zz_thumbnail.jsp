<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>thumbnail|KeepFit</title>

    <script src="resources/js/jquery-3.4.1.js"></script>

    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.js"></script>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/thumbnail.css" rel="stylesheet">
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

<!--    맨 위 간격 맞추기 -->
<div class="container">
    <div class="row" style="margin-top: 53px"></div>
</div>

<!--  사진 리스트  -->
<div class="container" style="margin: 2px">
    <c:forEach var="lk" items="${likeUser}">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0;">
            <img src="resources/img/${lk.post_id}/thumb.jpg" width="100%" style="margin:0;">
                <%--                포스트 디테일로 가는 화면 만들기 --%>
        </div>
    </c:forEach>
</div>
</body>
</html>
