<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous">
    </script>

    <!--bx slider-->
    <link rel="stylesheet" href="resources/css/jquery.bxslider.css">
    <script src="resources/js/jquery.bxslider.js"></script>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <script src="resources/js/bootstrap.js"></script>

<script>
var post_id = 1; //게시글 번호
 
$('#commentInsertBtn').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('#commentInsertForm').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
}); 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : 'comment3.do',
        type : 'get',
        data : {'post_id':post_id},
        success : function(data){
            var a =''; 
            $.each(data, function(key, comment){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+comment.comment_id+'">'+'댓글번호 : '+comment.comment_id+' / 작성자 : '+comment.comment_writer;
                a += '<a onclick="commentUpdate('+comment.comment_id+',\''+comment.comment_content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+comment.comment_id+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+comment.comment_id+'"> <p> 내용 : '+comment.comment_content+'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(comment_id, comment_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+comment_id+'" value="'+comment_content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comment_id+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+comment_id).html(a);   
}
 
//댓글 수정
function commentUpdateProc(comment_id){
    var updateContent = $('[name="content_'+comment_id+'"]').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'comment_id' : comment_id},
        success : function(data){
            if(data == 1) commentList(post_id); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(comment_id){
    $.ajax({
        url : '/comment/delete/'+comment_id,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(post_id); //댓글 삭제후 목록 출력 
        }
    });
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>

</head>	
<body>

</body>
</html>