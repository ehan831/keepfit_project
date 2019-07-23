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
                window.location.replace("getPostList.do");
            }
        }, 1000);
    </script>

<meta charset="UTF-8">
<title>loginOk|KeepFit</title>
</head>
<body>

<div style="font-size: 30px; line-height: 10px; text-align: center;">
<hr/>
<h5 align="center">안녕하세요 <b>${member.member_nick}</b>님 로그인에 성공하셨습니다.</h5><br/>
<hr/>
<h6 align="center">메인 화면으로 이동합니다..</h6>
<div id="counter">5</div>
</div>

</body>
</html>