<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>TEST|search</title>

<!--     [AUTO COMPLETE] src='jQuery UI' -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!--아이콘-->
<script src="https://kit.fontawesome.com/0c46a3b816.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<!-- *************************************************************************** -->
<!-- *							[AUTO COMPLETE]									*-->
<!-- *************************************************************************** -->
<script type="text/javascript">
//<![CDATA[

$(function() {
		var option = 0;
		var src = "";
		
			option = $("#option option:selected").val();
			switch (option) {
			// "NICKNAME"
			case 0:
			   src = ["a","aa","aaa","aaaa"];
				break;
			// "SPORT"
			case 1:
				src = ["b","bb","bbb","bbbb"];
				break;
			// "PLACE"
			case 2:
				src = ["c","cc","ccc","cccc"];
				break;
			}
			
			   $("#searchBox").autocomplete({
			        source: function(request, response) {
			               $.ajax({
			                    url : "searchAutocomple.do",
			                    type : "GET",
			                    data : {
			                           term : request.term
			                    },
			                    dataType : "json",
			                    success : function(data) {
			                          response(data);
			                    }
			             });
			          }
			    });
	
	});
	


 
});
//]]>
</script>




<style>
.search {
	padding: 80px 0;
	background: #fa7268;
}

.search .content {
	max-width: 650px;
	margin: 0 auto;
	text-align: center;
	position: relative;
	z-index: 2;
}

.search .content h2 {
	color: #f3edff;
	margin-bottom: 40px;
}

.search .content .form-control {
	height: 50px;
	border-color: #ffffff;
	border-radius: 0;
}

.search .content.form-control:focus {
	box-shadow: none;
	border: 2px solid #243c4f;
}

.search .content .btn {
	min-height: 50px;
	border-radius: 0;
	background: #243c4f;
	color: #fff;
	font-weight: 600;
}
</style>
</head>
<body>
	<form>
		<section class="search">

			<div class="container">
				<div class="row">
					<div class="col-sm-12" style="margin-bottom: 10px">
						<div class="content">
							<h2>SEARCH 검색</h2>
							<select id="option" class="form-control custom-select-sm" name="selected">
								<option value="0">닉네임</option>
								<option value="1">운 동</option>
								<option value="2">장 소</option>
							</select>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="content">
							<div class="input-group">
								<input type="text" id="searchBox" class="form-control"
									placeholder="검색어를 입력해주세요"> <span
									class="input-group-btn"><button class="btn"
										type="submit">검색</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
</body>
</html>