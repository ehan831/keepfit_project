<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta name="google-signin-client_id" content="772327138445-78pbueovgk0989d6mbrfeu2plpks2t96.apps.googleusercontent.com">
<title>로그인|KeepFit</title>

<link rel="stylesheet" href="resources/style/stylecss.css" type="text/css">
<script type="text/javascript" src="resources/js/jquery-1.7.1.js"></script>
<script  src="resources/js/userInsert.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">	
</script>



<!-- [KAKAO]계정 로그인 API -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
window.onload = function() {
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('36d740d660cec30564912475ed6d3109');

	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					console.log(res);

					var userID = res.id; //유저의 카카오톡 고유 id
					var userEmail = res.kaccount_email; //유저의 이메일
					var userNickName = res.properties.nickname; //유저가 등록한 별명
					
					location.href = "signUpExtra.jsp?member_email="+userEmail+"&member_pass="+userID;

				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
};
</script>

<!-- 구글계정 로그인 API -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>


<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<script src="resources/js/bootstrap.js"></script>
</head>
<body>

	<div
		style="font-size: 30px; height: 150px; line-height: 150px; text-align: center;">
		로그인 화면</div>
	<!-- ******************************[ 기존회원 로그인 ] ******************************-->
	<div class="container">
		<form class="form-group-lg" action="loginOk.html" method="get">
			<div>
				<input class="form-control" name="email" type="email"
					placeholder="이메일을 입력해주세요" required autofocus>
			</div>
			<div>
				<input class=form-control name="password" type="password"
					placeholder="비밀번호">
			</div>
			<div class="checkbox">
				<input type="checkbox" name="rm" value="Remember-me">Remember
				me
			</div>
			<div>
				<input class="btn btn-lg btn-primary" type="submit" name="submit"
					value="로그인"><br>
			</div>
		</form>
		</div>


	<!-- ******************************[ kakao 로그인 ] ******************************-->
	<hr />
	<div align="center">
		<a id="kakao-login-btn"></a>
	</div>


	<!-- ******************************[ google 로그인 ] ******************************-->
	<hr />
	<div align="center" class="g-signin2" data-onsuccess="onSignIn"></div>

	<!-- ******************************[ KeepFit 로그인 ] ******************************-->
	<hr />
	<div align="center">

		<input type="button" class="btn btn-lg btn-danger" value="회원가입하러 가기"
			onclick="location.href='signUp.html'">
	</div>




</body>
</html>