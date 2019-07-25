<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <meta name="google-signin-client_id"
          content="772327138445-78pbueovgk0989d6mbrfeu2plpks2t96.apps.googleusercontent.com">
    <title>로그인|KeepFit</title>

    <%-- 제이쿼리 --%>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%-- 부트스트랩 --%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/style/stylecss.css" type="text/css">
    <script src="resources/js/userInsert.js"></script>

    <!-- [KAKAO]계정 로그인 API -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type='text/javascript'>
        window.onload = function () {
            // 사용할 앱의 JavaScript 키를 설정해 주세요.
            Kakao.init('36d740d660cec30564912475ed6d3109');
            // 카카오 로그인 버튼을 생성합니다.
            Kakao.Auth.createLoginButton({
                container: '#kakao-login-btn',
                success: function (authObj) {
                    // 로그인 성공시, API를 호출합니다.
                    Kakao.API.request({
                        url: '/v1/user/me',
                        success: function (res) {
                            console.log(res);
                            var userID = res.id; //유저의 카카오톡 고유 id
                            var userEmail = res.kaccount_email; //유저의 이메일
                            var userNickName = res.properties.nickname; //유저가 등록한 별명

                            location.href = "login.do?member_email=" + userEmail + "&member_pass=" + userID + "&member_channel=1";
                        },
                        fail: function (err) {
                            alert(JSON.stringify(err));
                        }
                    });
                },
                fail: function (err) {
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

            location.href = "login.do?member_email=" + profile.getEmail() + "&member_pass=" + profile.getId() + "&member_channel=2";
        }
    </script>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>

	    <!-- 아이콘 제공 사이트 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
    </style>
    
</head>


<body>
<div class="container">
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">KEEP-FIT</h4>
            <h6 class="card-title mt-3 text-center">Just Be You</h6>
            <!--            <p class="text-center">간편 가입 하기</p>-->
            <div style="visibility: hidden;height: 20px;"></div>

            <div class="container">
                <!-- ******************************[ kakao 로그인 ] ******************************-->
                <div align="center">
                    <a id="kakao-login-btn"></a>
                </div>
                <!-- ******************************[ google 로그인 ] ******************************-->
                <!--                <div align="center">-->
                <!--                    <div class="g-signin2" data-onsuccess="onSignIn"></div>-->
                <!--                </div>-->
                <hr style="margin: 5px; visibility: hidden">
                <div >
                    <a class="g-signin2" data-onsuccess="onSignIn" style="width: 220px; height: 49px;"></a>
                </div>
            </div>

            <p class="divider-text" style="clear: both">
                <span class="bg-light">OR</span>
            </p>

            <!-- ******************************[ KeepFit 로그인 ] ******************************-->
            <form class="form-group-lg" action="login.do" method="get">
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                    </div>
                    <input class="form-control" name="member_email" placeholder="이메일" type="email">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input class="form-control" name="member_pass" placeholder="비밀번호" type="password">
                </div> <!-- form-group// -->

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> 로그인</button>
                </div> <!-- form-group// -->
            </form>
            <p class="text-center">계정이 없으신가요?<a href="signUp.do">&nbsp;가입하기</a></p>
        </article>
    </div> <!-- card.// -->
</div>

<%--<hr/>--%>
<%--<div style="font-size: 30px; height: 150px; line-height: 150px; text-align: center;">--%>
<%--    로그인 화면--%>
<%--</div>--%>
<%--<!-- ******************************[ 기존회원 로그인 ] ******************************-->--%>
<%--<hr/>--%>
<%--<div class="container">--%>
<%--    <form class="form-group-lg" action="login.do" method="get">--%>
<%--        <div>--%>
<%--            <input class="form-control" name="member_email" type="email"--%>
<%--                   placeholder="이메일을 입력해주세요" required autofocus>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <input class=form-control name="member_pass" type="password"--%>
<%--                   placeholder="비밀번호">--%>
<%--        </div>--%>
<%--        <div class="checkbox">--%>
<%--            <input type="checkbox" name="rm" value="Remember-me">Remember me--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <input class="btn btn-lg btn-primary" type="submit" name="submit" value="로그인"><br> <br>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>


<%--<!-- ******************************[ kakao 로그인 ] ******************************-->--%>
<%--<hr/>--%>
<%--<hr/>--%>
<%--<br>--%>
<%--<div align="center">--%>
<%--    <a id="kakao-login-btn"></a>--%>
<%--</div>--%>
<%--<br>--%>

<%--<!-- ******************************[ google 로그인 ] ******************************-->--%>
<%--<hr/>--%>
<%--<br>--%>
<%--<div align="center" class="g-signin2" data-onsuccess="onSignIn"></div>--%>
<%--<br>--%>
<%--<!-- ******************************[ KeepFit 로그인 ] ******************************-->--%>

<%--<hr/>--%>
<%--<br>--%>
<%--<div align="center">--%>
<%--    <input type="button" class="btn btn-lg btn-danger" value="회원가입하러 가기"--%>
<%--           onclick="location.href='signUp.do'">--%>
<%--</div>--%>
<%--<br>--%>
<%--<hr/>--%>
</body>
</html>