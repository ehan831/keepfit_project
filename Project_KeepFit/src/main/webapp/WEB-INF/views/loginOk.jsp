<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <script>
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count <= 0) {
                window.location.replace("feed.do");
            }
        }, 1000);
    </script>

 <meta charset="UTF-8">
<title>loginOk|KeepFit</title>
</head>
<body>

<hr/><hr/>
<h1 align="center">안녕하세요 <b>${member.member_email}</b>님 로그인에 성공하셨습니다.</h1><br/>
<hr/><hr/>
<h5 align="center">메인 화면으로 이동합니다..<div id="counter">5</div></h5>

<hr/><hr/>
</body>
</html>