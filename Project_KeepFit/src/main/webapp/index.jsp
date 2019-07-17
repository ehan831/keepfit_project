<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Home | Keep Fit</title>

<link rel="stylesheet" href="resources/style/stylecss.css" type="text/css">
<script type="text/javascript" src="resources/js/jquery-1.7.1.js"></script>
<script  src="resources/js/userInsert.js"></script>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta name="google-signin-client_id" content="772327138445-78pbueovgk0989d6mbrfeu2plpks2t96.apps.googleusercontent.com">
	
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript">

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	  alert(profile.getName() + '님 환영합니다.');	  
	  location.href="TEST-signup.do?member_email="+ profile.getEmail() + "&member_pass=" + profile.getId();
	}
/* 구글계정 로그아웃 */
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		setTimeout(function(){
			location.href="http://localhost:8080/Project_KeepFit/index.jsp"
		},1000);
		console.log('로그아웃 되었습니다.');
		alert('로그아웃 되었습니다.');
	});
	auth2.disconnect();
}
</script>


</head>
<body>
	<h3>Let's Keep Fit!</h3>
		
		<h5>just be you</h5>	

	<hr />
	<hr />

	<h1 align="center">TEST : 로그인</h1>
	<form action="login.do" method="get">
		<ul>
			<li>이메일 <input type="text" name="member_email">
			<li>비밀번호 <input type="text" name="member_pass">
			<li><input type="submit" value="TEST : login">
		</ul>
	</form>
<a id="kakao-login-btn"></a>
<div class="g-signin2" data-onsuccess="onSignIn"></div>

<hr/>
<hr/>
	<h1 align="center">TEST : 회원가입</h1>
<form method="get" action="TEST-signup.do" name="userInsert" id="userInsert">
<ul>

<li>이메일 : <input type="email" name="member_email" id="member_email" placeholder="이메일주소를 입력하세요" autofocus required>
<span id="idCheckResult" style="width:150px; color:red"></span>
<li>비밀번호 : <input type="password" name="member_pass" id="member_pass" placeholder="비밀번호 4자리 입력" required>
<li>비밀번호확인 : <input type="password" id="passCheck" placeholder="한번 더 입력" required>
<li><input type="submit" id="confirm" value="TEST : signup" >
</ul>
</form>


<!-- <form method="get" action="TEST-signupSimple.do" name="simpleLogin" id="simpleLogin"> -->
<!-- 카카오계정 로그인 API -->
<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
		
		<script type='text/javascript'>
		  //<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('36d740d660cec30564912475ed6d3109');
			
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
			  container: '#kakao-login-btn',
			  success: function(authObj) {
				// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url: '/v1/user/me',
						success: function(res) {
							console.log(res);
							
							var userID = res.id;						//유저의 카카오톡 고유 id
							var userEmail = res.kaccount_email;			//유저의 이메일
							var userNickName = res.properties.nickname;	//유저가 등록한 별명
												
							alert(userNickName + '님 환영합니다.');													
							location.href="TEST-signup.do?member_email="+ userEmail + "&member_pass=" + userID;							
						},
							
						fail: function(err) {
							 alert(JSON.stringify(err));							
						}
					});
				  },
				  fail: function(err) {
						 alert(JSON.stringify(err));
			  }
		});
			/* 카카오계정 로그아웃 */
			function kakaoLogout() {
				Kakao.Auth.logout(function(){
					setTimeout(function(){
						location.href="http://localhost:8080/Project_KeepFit/index.jsp"
					},1000);
					console.log('로그아웃 되었습니다.');
					alert('로그아웃 되었습니다.');
				});
			}
		  //]]>
		</script>
		<input type='button' value="카카오 로그아웃" onclick="kakaoLogout();">

<!-- 구글계정 로그인 API -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href='#' onclick="signOut();">구글 로그아웃</a>
<hr/>
<hr/>
	<h1 align="center">TEST : 댓글</h1>
	<form action="insertComment.do" method="get">
		<ul>
			<li>게시물 번호 <input type="text" name="post_id">
			<li>댓글 번호 <input type="text" name="comment_id">
			<li>작성자 <input type="text" name="comment_writer">
			<li>댓글 <input type="text" name="comment_content">
			<li><input type="submit" value="TEST : 댓글작성">
		</ul>
	</form>
	<hr />
	
	<div>
		<a href="getCommentList.do">TEST : 댓글 모두 조회</a>
	</div>
	<hr />	<hr />

</body>
</html>
