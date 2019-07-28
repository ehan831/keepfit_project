<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원가입|KeepFit</title>


<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">
	
</script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<script src="resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('#pass').keyup(function() {
			// $('#lblError').remove(); // 제거
			$('#font').text(''); // 클리어
		});

		//[2] 암호 확인 기능 구현
		$('#pass2').keyup(function() {
			if ($('#pass').val() != $('#pass2').val()) {
				$('#font').text(''); // 클리어
				$('#font').html("<b> 암호가 일치하지 않습니다. </b>").css('color', 'red'); // 레이어에 HTML 출력
			} else {
				$('#font').text(''); // 클리어
				$('#font').html("<b> 일치 :) </b>").css('color', 'blue'); // 레이어에 텍스트 출력
			}
		});
	});
</script>

</head>
<body>
	<div
		style="font-size: 30px; height: 150px; line-height: 150px; text-align: center;">
		회원가입 화면</div>
	<div class="container">
		<form class="form-group-lg" id="myForm" action="login.do">
			<input type="hidden" name="signup" value="1">
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input class="form-control" name="member_email" placeholder="이메일"
					type="email">
			</div>
			<!-- form-group// -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="pass" name="member_pass"
					placeholder="비밀번호" type="password">
			</div>
			<!-- form-group// -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="pass2" placeholder="비밀번호 확인"
					type="password"> <span id="font" name="check"
					style="font-size: small; color: red;"></span>
			</div>
			<!-- form-group// -->
			<div class="form-group">
				<input class="btn btn-lg btn-primary" type="submit" value="로그인">
			</div>
			<!-- form-group// -->
		</form>
	</div>
	<!--container end.//-->
</body>
</html>