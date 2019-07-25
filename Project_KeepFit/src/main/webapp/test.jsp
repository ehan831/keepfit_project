<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta name="google-signin-client_id" content="772327138445-78pbueovgk0989d6mbrfeu2plpks2t96.apps.googleusercontent.com">
<title>test page - for all</title>

<link rel="stylesheet" href="resources/style/stylecss.css" type="text/css">
<script  src="resources/js/userInsert.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">	
</script>

<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<script src="resources/js/bootstrap.js"></script>

</head>


<body>
	<h1>go go go go go !!!</h1>

	<form class="form-control" action="posting_test.do" method="get">
		<input id="post_id" name="post_id" class="text-primary" placeholder="포스트 아이디를 입력해주세요" type="text">
		<input id="post_writer" name="post_writer" class="text-primary" placeholder="멤버 아이디를 입력해주세요" type="text">
		<input id="submit" class="btn btn-lg btn-primary" type="submit" value="글쓰러 가기">
	</form>

	<form action="feed_test2.do" method="get">
		<input id="submit2" class="btn btn-lg btn-danger" type="submit" value="피드 보러 가기">
	</form>


	<form action="getLikeList.do" method="get">
		<input id="submit3" class="btn btn-lg btn-danger" type="submit" value="피드 보러 가기">
	</form>

</body>
</html>