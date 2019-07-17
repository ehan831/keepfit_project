<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>Login | KeepFit</title>

    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
</head>
<body>

<div style="font-size:30px; height: 150px; line-height: 150px; text-align: center;">
    로그인 화면
</div>
<div class="container">
    <form class="form-group-lg" action="loginOk.html" method="get">
        <div>
            <input class="form-control" name="email" type="email" placeholder="이메일을 입력해주세요" required autofocus>
        </div>
        <div>
            <input class=form-control name="password" type="password" placeholder="비밀번호">
        </div>
        <div class="checkbox">
            <input type="checkbox" name="rm" value="Remember-me">Remember me
        </div>
        <div>
            <input class="btn btn-lg btn-primary" type="submit" name="submit" value="로그인"><br>
        </div>
    </form>
    <div style="height: 300px"></div>

    <input type="button" class="btn btn-lg btn-danger" value="회원가입하러 가기" onclick="location.href='signUp.html'">
</div>

</body>
</html>