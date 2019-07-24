<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 생성될 post_id = [post_id] sequence.nextval
	int postId = (Integer) request.getAttribute("postId");
// 	int postId = 80;
	System.out.println("posting.jsp: "+postId);


	// post_id의 이름으로 폴더를 지정한다
	String path = "C:/PostPics/" + postId; //폴더 경로
	System.out.println(path);
	File folder = new File(path);
	File[] deleteFolderFiles = folder.listFiles();

	
	// 해당 디렉토리가 존재하지 않을 경우 해당 디렉토리를 생성합니다.
	if (!folder.exists()) {
		try {
			folder.mkdir(); //폴더 생성합니다.
			System.out.println("폴더가 생성되었습니다.");
		} catch (Exception e) {
			e.getStackTrace();
		}

	// 해당 디렉토리가 존재할 경우 해당 디렉토리 내용을 정리하여 삭제합니다.
	} else {
		for (int i = 0; i < deleteFolderFiles.length; i++) {
			deleteFolderFiles[i].delete(); // 파일을 삭제합니다
		}
	System.out.println("이미 폴더가 존재하여 내용을 삭제합니다.");
		
		
	}

	int sizeLimit = 30 * 1024 * 1024; // 5메가까지 제한 넘어서면 예외발생
	int nameSeq = 0;
	try {
		// 생성된 폴더를 업로드 경로로 지정
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();		
		

		// 파일 있다면
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
		
		// post_id 경로안에 파일들 조회
		File folder2 = new File(path);
		File[] renameFolderFiles = folder2.listFiles();
		
		// 각 파일마다 이름을 "1"부터 바꾼다
			int j = 0;
		    for(File file:renameFolderFiles) {
		        j++;
		        String names = file.getName();
		        String newName = j + ".jpg";
		        String newPath = path + "\\" + newName;
		        file.renameTo(new File(newPath));
		        System.out.println(name + " changed to " + newName);
		    }			 		
		}
	} catch (IOException e) {
		e.printStackTrace();
		System.out.println("Exception: 안드로이드 부터 이미지가 전송되지 않았습니다.");
	}	
	
	
	String inputImagePath = path + "1.jpg";
	String thumbPath = path + "thumb.jpg";
	 
	        try {
	            // resize to a fixed width (not proportional)
	            int scaledWidth = 1024;
	            int scaledHeight = 768;
	            ImageResizer.resize(inputImagePath, outputImagePath1, scaledWidth, scaledHeight);
	 
	            // resize smaller by 50%
	            double percent = 0.5;
	            ImageResizer.resize(inputImagePath, outputImagePath2, percent);
	 
	            // resize bigger by 50%
	            percent = 1.5;
	            ImageResizer.resize(inputImagePath, outputImagePath3, percent);
	 
	        } catch (IOException ex) {
	            System.out.println("Error resizing the image.");
	            ex.printStackTrace();
	        }
	
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>새 게시물|KeepFit</title>

<!-- 아이콘 제공 사이트, https://fontawesome.com-->
<script src="https://kit.fontawesome.com/0c46a3b816.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">
	
</script>

<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<script src="resources/js/bootstrap.js"></script>

<!--    Bootstrap toggle-->
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

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
</style>

<!--    https://jskimmail.blog.me/221586960416-->
<script>
	$(function() {

		$("#btnSearchDate").click(function() {
			xShowCalendar("txtDate");
		});

		xShowCalendar = function(_controlId) {
			var controlDate = $("#" + _controlId);

			controlDate.datepicker({
				assumeNearbyYear : false,
				autoclose : "true", // 자동으로 창을 닫는다
				format : "yyyy-mm-dd", // 일자 형식
				language : "ko", // 언어코드 ( 한국어 )
				// todayBtn: true, // 오늘 버튼
				todayHighlight : true, // 오늘에 하이라이트
				clearBtn : true, // 닫기 버튼
				clear : "삭제하기"
			});

			var ctrl = document.getElementById(_controlId); // 컨트롤을 찾는다.
			if (ctrl != null) {
				$(ctrl).datepicker('show');// 달력을 보인다.
			}
			//return false;
		};

		$('#submit').click(function() {
			var imgSrc = $('#img').attr('src');
			console.log(imgSrc);
			alert(imgSrc);
		})
	});
</script>
</head>
<body>

	<div
		style="font-size: 30px; height: 150px; line-height: 150px; text-align: center;">
		글쓰기 화면</div>

	<div class="container">
		<form class="form-group-lg" id="myForm" action="getPostList.do"
			method="post">
			<!--     게시물 작성 status-->
			<input name="posting" type="hidden" value="1" />
			<!--     게시물 작성자 nickname -->
			<input name="post_writer" type="hidden"
				value="<%=session.getAttribute("logUser")%>" />
			<!--     게시물 사진 경로 ********* [ 수정필요 ] ***************-->
			<input name="path_pic" type="hidden" value="" />
			<!--데이트 픽커-->
			<div class="input-group">
				<input name="selected_date" type="text" class="form-control"
					id="txtDate" value="" maxlength="8">
				<div class="input-group-addon">
					<a href="#" id="btnSearchDate"><i class="far fa-calendar-alt"
						style="font-size: 200%; color: #000;"></i></a>
				</div>
			</div>
			<!-- 썸네일 -->
			<div class="input-group"
				style="float: right; align-content: baseline">
				<!-- 				<img id="img" src="//via.placeholder.com/150x200" alt="150x200" -->
				<img id="img" src="resources/img/1.jpg" class="img-thumbnail">
				<input type="hidden" id="imgSrc" name="imgSrc" value="">
			</div>

			<div class="input-icon-wrap" style="margin: 1px 0px;">
				<span class="input-icon col-xs-1" style="text-align: center">
					<i class="fas fa-user-tag" style="font-size: 200%"></i>
				</span> <input name="member_tag" type="text" class="input-with-icon"
					id="form-name1" placeholder="사람 태그하기">
			</div>

			<div class="input-icon-wrap" style="margin: 1px 0px;">
				<span class="input-icon col-xs-1" style="text-align: center">
					<i class="fas fa-cloud-sun-rain" style="font-size: 200%"></i>
				</span> <input name="post_mood" type="text" class="input-with-icon"
					id="form-name2" placeholder="기분 선택하기">
			</div>

			<div class="input-icon-wrap" style="margin: 1px 0px;">
				<span class="input-icon col-xs-1" style="text-align: center">
					<i class="fas fa-biking" style="font-size: 200%"></i>
				</span> <input name="sport_name" type="text" class="input-with-icon"
					id="form-name3" placeholder="운동 선택하기">
			</div>

			<div class="input-icon-wrap" style="margin: 1px 0px;">
				<span class="input-icon col-xs-1" style="text-align: center">
					<i class="fas fa-map-marked-alt" style="font-size: 200%"></i>
				</span> <input name="place_tag" type="text" class="input-with-icon"
					id="form-name4" placeholder="위치 추가하기">
			</div>

			<div class="input-icon-wrap" style="clear: both;">
				<textarea name="content" class="text-justify"
					placeholder="내용을 입력해주세요." rows="10" style="width: 100%;"></textarea>
			</div>

			<div>
				<input id="submit" class="btn btn-lg btn-primary" type="submit"
					name="submit" value="글쓰기">

				<!-- 					privacy 레벨 toggle -->
				<label class="checkbox-inline" style="float: right"> <span>공유
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <input name="privacy"
					type="checkbox" checked data-toggle="toggle">
				</label>
			</div>

		</form>


	</div>

</body>
</html>