$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#member_email").val()) == '' ){
            alert("이메일을 입력해주세요.");
            $("#member_email").focus();
            return;
        }
    	
    	if($.trim($('#member_pass').val())==''){
    		alert("비밀번호를 입력해주세요.");
    		$('#member_pass').focus();
    		return;
    	}
    	
    	if($.trim($('#member_pass').val()) != $.trim($('#passCheck').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#passCheck').focus();
    		return;
    	}
    	
    	if($.trim($('#member_pass').val()) == $.trim($('#passCheck').val())){
            // 자료를 전송합니다.
            document.userInsert.submit();
    	}
    	
	});
	
	//아이디 중복체크
	$('#member_email').keyup(function(){
        $.ajax({ 
        	type : 'post',
        	//async : true,	 비동기 방식
        	url : 'idCheck.do',
        	contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
        	data : "member_email=" + $('#member_email').val(),	// userId = 입력값
        	success : function(resultData) {			// resultData 결과받아 출력
        		$('#idCheckResult').text(resultData);
        	}
        });
		
	})
})
	
	
	
	
	
	
	
	
	