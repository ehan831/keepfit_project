<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>피드 공유</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

<hr />
	<div style="font-size: 30px; height: 150px; line-height: 150px; text-align: center;">
		공유하기</div>

<a id="kakao-link-btn" href="javascript:sendLink()" >
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>
<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('36d740d660cec30564912475ed6d3109');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: '도심러닝',
          description: '#강남 #양재 #1.45km',
          imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
          link: {
            mobileWebUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do',
            webUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do'
          }
        },
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do',
              webUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do'
            }
          },
          {
            title: '앱으로 보기',
            link: {
              mobileWebUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do',
              webUrl: 'http://localhost:8080/Project_KeepFit/getPostList.do'
            }
          }
        ]
      });
    }
  //]]>
</script> 

<a href="javascript:shareStory()">
<img src="https://developers.kakao.com/sdk/js/resources/story/icon_small.png"/>
</a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('36d740d660cec30564912475ed6d3109');
    function shareStory() {
      Kakao.Story.share({
        url: 'https://developers.kakao.com',
        text: '카카오 개발자 사이트로 놀러오세요! #개발자 #카카오 :)'
      });
    }
  //]]>
</script>

</body>
</html>