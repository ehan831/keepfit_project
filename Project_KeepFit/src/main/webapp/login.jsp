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
    �α��� ȭ��
</div>
<div class="container">
    <form class="form-group-lg" action="loginOk.html" method="get">
        <div>
            <input class="form-control" name="email" type="email" placeholder="�̸����� �Է����ּ���" required autofocus>
        </div>
        <div>
            <input class=form-control name="password" type="password" placeholder="��й�ȣ">
        </div>
        <div class="checkbox">
            <input type="checkbox" name="rm" value="Remember-me">Remember me
        </div>
        <div>
            <input class="btn btn-lg btn-primary" type="submit" name="submit" value="�α���"><br>
        </div>
    </form>
    <div style="height: 300px"></div>

    <input type="button" class="btn btn-lg btn-danger" value="ȸ�������Ϸ� ����" onclick="location.href='signUp.html'">
</div>

</body>
</html>