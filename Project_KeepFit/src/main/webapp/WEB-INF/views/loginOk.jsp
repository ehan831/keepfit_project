<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<<<<<<< HEAD
  <script>
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count <= 0) {
                window.location.replace("feed2.do");
            }
        }, 1000);
    </script>
=======
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
>>>>>>> 889d93be308d567a39f8506a23105447b8c0a8bb

<meta charset="UTF-8">
<title>loginOk|KeepFit</title>
</head>
<body>

<<<<<<< HEAD
<hr/><hr/>
<h1 align="center">안녕하세요 <b>${member.member_nick}</b>님 로그인에 성공하셨습니다.</h1><br/>
<hr/><hr/>
<h5 align="center">메인 화면으로 이동합니다..<div id="counter">2</div></h5>
=======
	<hr />
	<hr />
	<h1 align="center">
		안녕하세요 <b><%=session.getAttribute("logUser")%></b>님 :)
	</h1>
	<br />
	<hr />
	<hr />
	<h5 align="center">
		메인 화면으로 이동합니다..
		<div id="counter">3</div>
	</h5>
>>>>>>> 889d93be308d567a39f8506a23105447b8c0a8bb

	<hr />
	<hr />
</body>
</html>