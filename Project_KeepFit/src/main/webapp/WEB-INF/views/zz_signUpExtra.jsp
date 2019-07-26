<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>추가정보|KeepFit</title>

    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <script src="https://kit.fontawesome.com/0c46a3b816.js"></script>

    <style>
        .divider-text {
            position: relative;
            text-align: center;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .divider-text span {
            padding: 7px;
            font-size: 12px;
            position: relative;
            z-index: 2;
        }

        .divider-text:after {
            content: "";
            position: absolute;
            width: 100%;
            border-bottom: 1px solid #ddd;
            top: 55%;
            left: 0;
            z-index: 1;
        }

        .btn-2 {
            background-color: #405D9D;
            color: #fff;
        }

        .btn-1 {
            background-color: #42AEEC;
            color: #fff;
        }
    </style>

    <script src="resources/js/signUp.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>


</head>
<body>
<hr style="visibility: hidden">

<form class="form-group-lg" action="zz_feed.do" method="get" style="">
    <input type="hidden" name="member_email" value="${member.member_email}">
    <input type="hidden" name="member_pass" value="${member.member_pass}">
    <input type="hidden" name="member_channel" value="${member.member_channel}">

    <section class="" id="form">
        <div class="container">
            <div class="input-wrap">
                <label class="form-label-outside mbr-lighter" for="member_nick">닉네임</label>
                <input type="text" class="form-control" name="member_nick" required id="member_nick">
            </div>

            <div style="text-align: center; margin: 20px;">
                <label for="weight1">현재 몸무게 :</label> <input type="number"
                                                             id="weight1" name="now_weight" min="30" max="120"
                                                             style="border: 1px solid black">

                &nbsp;~&nbsp;

                <label for="weight2">목표 몸무게 :</label>
                <input type="number"
                       id="weight2" name="goal_weight" min="30" max="120" style="border: 1px solid black">
            </div>

            <div class="input-wrap">
                <label class="form-label-outside mbr-lighter" for="sport1">스포츠 1</label>
                <input type="text" class="form-control" name="sport1" required id="sport1">
            </div>
            <div class="input-wrap">
                <label class="form-label-outside mbr-lighter" for="sport2">스포츠 2</label>
                <input type="text" class="form-control" name="sport2" required id="sport2">
            </div>
            <div class="input-wrap">
                <label class="form-label-outside mbr-lighter" for="sport3">스포츠 3</label>
                <input type="text" class="form-control" name="sport3" required id="sport3">
            </div>
            <hr>
            <span class="input-group-btn"><button type="submit"
                                                  class="btn btn-lg btn-form btn-info display-4">가입 완료</button></span>
        </div>
    </section>
</form>
</body>
</html>