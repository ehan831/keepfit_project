<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
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

//포스팅 url 주소값 가져오기
var postURL = document.referrer;

////사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('36d740d660cec30564912475ed6d3109');
//// 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
function sendLink() {
  Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: '도심러닝',
      description: '#강남 #양재 #1.45km',
      imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
      link: {
        mobileWebUrl: postURL,
        webUrl: postURL
      }
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845
    },
    buttons: [
      {
        title: '피드 확인하기',
        link: {
          mobileWebUrl: postURL,
          webUrl: postURL
        }
      }
    ]
  });
}
</script>
</head>
<body style="overflow:hidden;background-color:#ffffff;">

<hr />
	<div style="font-size: 40px; height: 120px; line-height: 150px; text-align: center;">
		SNS 공유</div>

<div class="sns_wrap" align="center">

<a href="javascript:sendLink();" title="KakaoTalk">
<img src="resources/img/kakaotalk.png">
</a>
<a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(postURL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=500,width=600');return false;" title="KakaoStory" target="_blank" alt="Share on kakaostory"> 
<img src="resources/img/kakaostory.png">
</a>
<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(postURL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');return false;" title="Naver" target="_blank" alt="Share on Naver" >
<img src="resources/img/blog.png">
</a>
<a href="#" onclick="javascript:window.open('http://line.me/R/msg/text/?' +encodeURIComponent(postURL), 'pinterestsharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=500,width=600');return false;" title="Line" target="_blank" alt="Share on Line">
<img src="resources/img/line.png">
</a>
<br>
<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(postURL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');return false;" title="Twitter" target="_blank" alt="Share on Twitter" >
<img src="resources/img/twitter.png">
</a>
<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(postURL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');return false;" title="Facebook" target="_blank" alt="Share on Facebook" >
<img src="resources/img/facebook.png">
</a>
<a href="#" onclick="javascript:window.open('https://plus.google.com/share?url=' +encodeURIComponent(postURL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=500,width=600');return false;" title="Google+" target="_blank" alt="Share on Google+">
<img src="resources/img/google.png">
</a>
<a href="#" onclick="javascript:window.open('https://www.pinterest.com/pin/create/button/?url=' +encodeURIComponent(postURL), 'pinterestsharedialog','menubar=no,toolbar=no,resizable=yes, scrollbars=yes,height=500,width=600');return false;" title="Pinterest" target="_blank" alt="Share on Pinterest">
<img src="resources/img/pinterest.png">
</a>
<br><br><br>

<input type="text" id='url' size=50 readonly>
<button type="button" id='btn1' class="btn btn-primary" align='center'>링크복사</button>
<script>
function copyToClipboard(val) {
	  var t = document.createElement("textarea");
	  document.body.appendChild(t);
	  t.value = val;
	  t.select();
	  document.execCommand('copy');
	  document.body.removeChild(t);
	}
	$('#btn1').click(function() {
	  var postURL = document.referrer;
	  copyToClipboard(postURL);
	  alert('링크가 복사되었습니다!');
	});
	$(document).ready(function() {
        $('#url').val(postURL);
    });
	
</script>

</div>
</body>
</html>