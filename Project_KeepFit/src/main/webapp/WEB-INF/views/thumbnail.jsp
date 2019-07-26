<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>thumbnail|KeepFit</title>

    <script src="resources/js/jquery-3.4.1.js"></script>

    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.js"></script>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/thumbnail.css" rel="stylesheet">
</head>
<body>

<c:forEach var="lk" items="${likeUser}">
    <img src="${lk.post_id}/thumb.jpg">
    <div>${lk.like_id}</div>
    <div>${lk.like_date}</div>
</c:forEach>

<div class="container text-left"
     style="background-color:#f9f9f9;height:40px;border-bottom:solid 1px #b2b2b2; top:22px; width:100%; z-index:2;">
    <h2 style="margin-top:9px; color:#00306a; font-size: 20px"><img src="resources/img/logo.PNG" width="15%"></h2>
</div>
<table border="1" style="width: 100%; margin-bottom: 2px">
    <tr>
        <td>&nbsp; &nbsp; 검색창이 들어갈 부분</td>
        <td style="text-align: center"><img src="resources/img/search-96.png" style="width: 30px; height: 30px;" alt="이미지 로딩 실패"></td>
    </tr>
</table>

<div class="container" style="margin: 2px">
    <div class="row">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0;">
            <img src="resources/img/1.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0;">
            <img src="resources/img/2.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0;">
            <img src="resources/img/3.jpg" width="100%" style="margin:0px;">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0px;">
            <img src="resources/img/4.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/5.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/1.jpg" width="100%" style="margin:0px;">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0px;">
            <img src="resources/img/2.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/3.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/4.jpg" width="100%" style="margin:0px;">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0px;">
            <img src="resources/img/5.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/1.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/2.jpg" width="100%" style="margin:0px;">
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0px;">
            <img src="resources/img/3.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/4.jpg" width="100%" style="margin:0px;">
        </div>
        <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0px;">
            <img src="resources/img/5.jpg" width="100%" style="margin:0px;">
        </div>
    </div>
</div>
</body>
</html>
