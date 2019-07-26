<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    #container{
        text-align: center;
    }
</style>

<title>댓글</title>
</head>
<body>
    
<section id="container">
    <div id="title">
        <h2>댓글</h2>
    </div>
    <table class="table table-hover">
        <tr>
            <td>댓글 번호</td>
            <td>작성자</td>
            <td>내용</td>
            <td>작성일</td>
        </tr>
        <c:forEach items="${commentList }" var="comment">
            <tr>
				<td>${comment.comment_id}</td>
				<td>${comment.comment_writer}</td>
				<td>${comment.comment_content}</td>
				<td><fmt:formatDate value="${comment.regDate }" pattern="yyyy-MM-dd"/></td>
                <td>
                <button data-toggle="modal" data-target="#updateComment" data-comment_id="${comment.comment_id}" data-comment_writer="${comment.comment_writer}" data-comment_content="${comment.comment_content}" class="btn btn-success">수정</button> &nbsp;
                <button data-toggle="modal" data-target="#deleteComment" data-comment_id="${comment.comment_id}" data-comment_writer="${comment.comment_writer}" data-comment_content="${comment.comment_content}" class="btn btn-danger">삭제</button></td>
            </tr>
        </c:forEach>
    </table>
<br>
    <div class="container">
        <label for="content">댓글달기</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${comment.comment_id}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button type="button" href="insertComment.do" class="btn btn-default" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
<br>
<!-- Modal -->
<div class="modal fade" id="updateComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">댓글 수정</h5>
      </div>
      <div class="modal-body">
       <textarea rows="5" cols="70" placeholder="내용을 입력하세요"></textarea>       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" href="updateComment.do" class="btn btn-primary" >확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="deleteComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      </div>
      <div class="modal-body">
        <h4 class="modal-title" id="myModalLabel">댓글을 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
        <button type="button" onclick="deleteComment.do" class="btn btn-primary" >예</button>
      </div>
    </div>
  </div>
</div>
  
</section>    
    


</body>
</html>