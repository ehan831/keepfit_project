<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>회원가입|KeepFit</title>

    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>
    <script src="resources/js/signUp.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>

</head>
<body>
<div style="font-size:30px; height: 150px; line-height: 150px; text-align: center;">
    회원가입 화면
</div>
<div class="container">
    <form class="form-group-lg" id="myForm" action="signUpExtra.do">
        <div>
            <input class="form-control" type="email" name="member_email" placeholder="이메일을 입력해주세요" required autofocus>
        </div>
        <div>
            <input class=form-control id="pass" type="password" name="member_pass" placeholder="비밀번호">
        </div>
        <div>
            <input class=form-control id="pass2" type="password" placeholder="비밀번호 확인">
            <span id="font" name="check" style="font-size: small; color: red;"></span>
        </div>
        <div>
            <input class="btn btn-lg btn-primary" type="submit" name="submit" value="회원가입"><br>
        </div>
    </form>

</div>
</body>
</html>