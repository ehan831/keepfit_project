<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding( "utf-8" );%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="UTF-8">
    <title>posting</title>

    <!-- 아이콘 제공 사이트, https://fontawesome.com-->
    <script src="https://kit.fontawesome.com/0c46a3b816.js"></script>

    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>

    <!--    Bootstrap toggle-->
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

    <!--    date picker -->
    <script src="resources/js/bootstrap-datepicker.js"></script>
    <script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
    <link rel="stylesheet" href="resources/css/bootstrap-datepicker3.css">

    <style>
        .input-icon-wrap {
            border: 1px solid #ddd;
            display: flex;
            flex-direction: row;
        }

        .input-icon {
            background: #ddd;
        }

        .input-with-icon {
            border: none;
            flex: 1;
        }

        .input-icon, .input-with-icon {
            padding: 10px;
        }

        .effect img {
            border-radius: 20px;
            padding: 2px;
        }
    </style>

    <!--    https://jskimmail.blog.me/221586960416-->
    <script>
        $(function () {

            $("#btnSearchDate").click(function () {
                xShowCalendar("txtDate");
            });


            xShowCalendar = function (_controlId) {
                var controlDate = $("#" + _controlId);

                controlDate.datepicker({
                    assumeNearbyYear: false,
                    autoclose: "true", // 자동으로 창을 닫는다
                    format: "yyyy-mm-dd", // 일자 형식
                    language: "ko", // 언어코드 ( 한국어 )
                    // todayBtn: true, // 오늘 버튼
                    todayHighlight: true, // 오늘에 하이라이트
                    clearBtn: true, // 닫기 버튼
                    clear: "삭제하기"
                });

                var ctrl = document.getElementById(_controlId); // 컨트롤을 찾는다.
                if (ctrl != null) {
                    $(ctrl).datepicker('show');// 달력을 보인다.
                }
                //return false;
            };

        	//		android으로 메시지 보내기
        	$("#submit").click(function () {
//             	function () {
        		var broswerInfo = navigator.userAgent;
        		if (broswerInfo.indexOf("Android") > -1) {
        			window.MyTestApp.AlertMsg("웹뷰에서 호출된 메시지입니다");
        		}

//         		var imgSrc = $('#img').attr('src');
//                 $('#imgSrc').val(imgSrc);
//         		$('#submit').submit();
        	});
        	
            
        });
    </script>
</head>
<body>

<div class="container">
    <form class="form-group-lg" id="myForm" action="insertPost.do" method="get">
    <input type="hidden" name="post_id" value="${post.post_id }">
    <input type="hidden" name="path_pic" value="${post.path_pic }">
    <input type="hidden" name="post_writer" value="<%=session.getAttribute("userLogged")%>">
        <!-- 썸네일 -->
        <div class="row effect" style="margin: 10px">
            <p style="margin: 5px"><b>선택된 사진</b></p>
            <div class="col-xs-4" style="border: solid 1px #fffdff; padding:0;">
                <img src="resources/postImgs/${post.post_id }/thumb.jpg" width="100%" style="margin:0px;">
            </div>
<!--             <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0;"> -->
<!--                 <img src="https://via.placeholder.com/100" width="100%" style="margin:0px;"> -->
<!--             </div> -->
<!--             <div class="col-xs-4" style="border: solid 1px #fffdff;padding:0;"> -->
<!--                 <img src="https://via.placeholder.com/100" width="100%" style="margin:0px;"> -->
<!--             </div> -->
        </div>
        <!--데이트 픽커-->
        <hr>
        <div class="row" style="margin: 10px">
            <p style="margin: 5px"><b>정보 입력</b></p>
            <div class="input-group">
                <input name="selected_date" type="text" class="form-control" id="txtDate" maxlength="8"
                       placeholder="날짜 선택">
                <div class="input-group-addon">
                    <a href="#" id="btnSearchDate"><i class="far fa-calendar-alt"
                                                      style="font-size: 200%; color: #000;"></i></a>
                </div>
            </div>

            <div class="input-icon-wrap" style="margin: 1px 0px;">
            <span class="input-icon col-xs-2" style="text-align:center">
                <i class="fas fa-user-tag" style="font-size: 200%"></i>
            </span>
                <input name="member_tag" type="text" class="input-with-icon col-xs-10" id="form-name1" placeholder="사람 태그하기">
            </div>

            <div class="input-icon-wrap" style="margin: 1px 0px;">
            <span class="input-icon col-xs-2" style="text-align: center">
                <i class="fas fa-cloud-sun-rain" style="font-size: 200%"></i>
            </span>
                <input name="post_mood" type="text" class="input-with-icon" id="form-name2" placeholder="기분 선택하기">
            </div>

            <div class="input-icon-wrap" style="margin: 1px 0px;">
            <span class="input-icon col-xs-2" style="text-align: center">
                <i class="fas fa-biking" style="font-size: 200%"></i>
            </span>
                <input name="sport_name" type="text" class="input-with-icon" id="form-name3" placeholder="운동 선택하기">
            </div>

            <div class="input-icon-wrap" style="margin: 1px 0px;">
            <span class="input-icon col-xs-2" style="text-align: center">
                <i class="fas fa-map-marked-alt" style="font-size: 200%"></i>
            </span>
                <input name="place_tag" type="text" class="input-with-icon" id="form-name4" placeholder="위치 추가하기">
            </div>

            <div class="input-icon-wrap" style="clear: both;">
            <textarea name="content" class="text-justify" placeholder="내용을 입력해주세요." rows="5"
                      style="width: 100%;"></textarea>
            </div>
            <hr style="margin: 5px">
            <div>
                <input id="submit" class="btn btn-primary" type="submit" name="submit" value="글쓰기">
                <label class="checkbox-inline" style="float: right">
                    <span>공유 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <input name="privacy" type="checkbox" checked data-toggle="toggle">
                </label>
            </div>
            <hr style="margin: 10px">
        </div>
    </form>
</div>

    <%--    old ver--%>
    <%--<div class="container">--%>
    <%--    <form class="form-group-lg" id="myForm" action="feed_test.do" method="post">--%>
    <%--        <!--데이트 픽커-->--%>
    <%--        <div class="input-group">--%>
    <%--            <input name="selected_date" type="text" class="form-control" id="selected_date" value="" maxlength="8">--%>
    <%--            <div class="input-group-addon">--%>
    <%--                <a href="#" id="btnSearchDate"><i class="far fa-calendar-alt" style="font-size: 200%; color: #000;"></i></a>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <!-- 썸네일 -->--%>
    <%--        <div class="input-group" style="float: right; align-content: baseline">--%>
    <%--            <img id="img" src="//via.placeholder.com/150x200" alt="150x200" class="img-thumbnail">--%>
    <%--            
    <%--        </div>--%>

    <%--        <!-- 1번 태그 -->--%>
    <%--        <div class="input-icon-wrap" style="margin: 1px 0px;">--%>
    <%--            <span class="input-icon col-xs-1" style="text-align:center">--%>
    <%--                <i class="fas fa-user-tag" style="font-size: 200%"></i>--%>
    <%--            </span>--%>
    <%--            <input name="member_tag" type="text" class="input-with-icon" id="member_tag" placeholder="사람 태그하기 // 띄어쓰기로 구분">--%>
    <%--        </div>--%>
    <%--        <!--2 -->--%>
    <%--        <div class="input-icon-wrap" style="margin: 1px 0px;">--%>
    <%--            <span class="input-icon col-xs-1" style="text-align: center">--%>
    <%--                <i class="fas fa-cloud-sun-rain" style="font-size: 200%"></i>--%>
    <%--            </span>--%>
    <%--            <input name="post_mood" type="text" class="input-with-icon" id="post_mood" placeholder="기분 선택하기">--%>
    <%--        </div>--%>

    <%--        <div class="input-icon-wrap" style="margin: 1px 0px;">--%>
    <%--            <span class="input-icon col-xs-1" style="text-align: center">--%>
    <%--                <i class="fas fa-biking" style="font-size: 200%"></i>--%>
    <%--            </span>--%>
    <%--            <input name="sport_name" type="text" class="input-with-icon" id="sport_name" placeholder="운동 선택하기">--%>
    <%--        </div>--%>

    <%--        <div class="input-icon-wrap" style="margin: 1px 0px;">--%>
    <%--            <span class="input-icon col-xs-1" style="text-align: center">--%>
    <%--                <i class="fas fa-map-marked-alt" style="font-size: 200%"></i>--%>
    <%--            </span>--%>
    <%--            <input name="place_tag" type="text" class="input-with-icon" id="place_tag" placeholder="위치 추가하기">--%>
    <%--        </div>--%>

    <%--        <div class="input-icon-wrap" style="clear: both;">--%>
    <%--            <textarea name="content" id="content" class="text-justify" placeholder="내용을 입력해주세요." rows="10"--%>
    <%--                      style="width: 100%;"></textarea>--%>
    <%--        </div>--%>

    <%--        <div>--%>
    <%--            <input type="hidden" name="post_id" value="<%=post_id%>">--%>
    <%--            <input type="hidden" name="post_writer" value="<%=post_writer%>">--%>
    <%--            <input id="submit" class="btn btn-lg btn-primary" type="submit" value="글쓰기">--%>
    <%--            <label class="checkbox-inline" style="float: right">--%>
    <%--                <span>공유 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>--%>
    <%--                <input name="privacy" type="checkbox" checked data-toggle="toggle">--%>
    <%--            </label>--%>
    <%--        </div>--%>
    <%--    </form>--%>
    <%--</div>--%>
</body>
</html>