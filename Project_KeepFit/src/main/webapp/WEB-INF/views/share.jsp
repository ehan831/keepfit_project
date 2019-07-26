<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>피드 공유</title>

	<script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

<!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>
    
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">

//// 사용할 앱의 JavaScript 키를 설정해 주세요.
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

function shareStory() {
    Kakao.Story.share({
      url: 'https://developers.kakao.com',
      text: '카카오 개발자 사이트로 놀러오세요! #개발자 #카카오 :)'
    });
  }

// send to SNS
function toSNS(sns, strTitle, strURL) {
    var snsArray = new Array();
    var strMsg = strTitle + " " + strURL;
	var image = "이미지경로";

    snsArray['twitter'] = "http://twitter.com/home?status=" + encodeURIComponent(strTitle) + ' ' + encodeURIComponent(strURL);
    snsArray['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent(strURL);
	snsArray['pinterest'] = "http://www.pinterest.com/pin/create/button/?url=" + encodeURIComponent(strURL) + "&media=" + image + "&description=" + encodeURIComponent(strTitle);
	snsArray['band'] = "http://band.us/plugin/share?body=" + encodeURIComponent(strTitle) + "  " + encodeURIComponent(strURL) + "&route=" + encodeURIComponent(strURL);
    snsArray['blog'] = "http://blog.naver.com/openapi/share?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
    snsArray['line'] = "http://line.me/R/msg/text/?" + encodeURIComponent(strTitle) + " " + encodeURIComponent(strURL);
	snsArray['pholar'] = "http://www.pholar.co/spi/rephol?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
	snsArray['google'] = "https://plus.google.com/share?url=" + encodeURIComponent(strURL) + "&t=" + encodeURIComponent(strTitle);
    window.open(snsArray[sns]);
}

function copy_clip(url) {
    var IE = (document.all) ? true : false;
    if (IE) {
        window.clipboardData.setData("Text", url);
        alert("이 글의 url이 클립보드에 복사되었습니다.");
    } else {
        temp = prompt("이 글의 url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
    }
}
</script>
</head>
<body style="overflow:hidden;background-color:#ffffff;">

<hr />
	<div style="font-size: 30px; height: 120px; line-height: 150px; text-align: center;">
		SNS 공유</div>

<div class="sns_wrap" align="center">

<a href="javascript:toSNS('facebook','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Facebook"><img src="resources/img/facebook.png"></a>
<a href="javascript:toSNS('twitter','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Twitter"><img src="resources/img/twitter.png"></a>
<a href="javascript:toSNS('line','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Line"><img src="resources/img/line.png"></a>
<a href="javascript:sendLink();" title="KakaoTalk"><img src="resources/img/kakaotalk.png"></a>
<a href="javascript:shareStory();" title="KakaoStory"><img src="resources/img/kakaostory.png"></a>
<br>

<a href="javascript:toSNS('pholar','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Pholar"><img src="resources/img/pholar.png"></a>
<a href="javascript:toSNS('pinterest','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Pinterest"><img src="resources/img/pinterest.png"></a>
<a href="javascript:toSNS('band','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="NaverBand"><img src="resources/img/band.png"></a>
<a href="javascript:toSNS('google','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="Google+"><img src="resources/img/google.png"></a>
<a href="javascript:toSNS('blog','공유제목!','http://localhost:8080/Project_KeepFit/getPostList.do')" title="NaverBlog"><img src="resources/img/blog.png"></a>
<br><br><br>

<input type="text" value="http://localhost:8080/Project_KeepFit/index.jsp" size="50" readonly>
<a href="javascript:copy_clip('http://localhost:8080/Project_KeepFit/getPostList.do')">
<button type="button" class="btn btn-primary">
링크복사
</button>
</a>
</div>

</body>
</html>