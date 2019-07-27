<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <script>
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent - 1;
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

<div style="font-size: 30px; line-height: 10px; text-align: center; width:100%;">
<hr/>
<h5 align="center">안녕하세요 <b><%=session.getAttribute("userLogged")%></b>님 로그인에 성공하셨습니다.</h5><br/>
<hr/>
<h6 align="center">메인 화면으로 이동합니다..</h6>
<div id="counter">2</div>
</div>

</body>
</html>