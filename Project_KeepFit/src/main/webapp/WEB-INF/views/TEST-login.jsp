<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>TEST-login</title>
</head>
<body>


<hr/><hr/><hr/><hr/>

<c:set var="logged" value="${logged}" />

<c:choose>
    <c:when test="${logged eq '1'}">
        <h1 align="center"> ${member.member_email} �� : �α��� TEST ����!! </h1>
    </c:when>

    <c:when test="${logged eq '0'}">
         <h1 align="center"> ${member.member_email} �� : email �Ǵ� pw �� ��ġ���� �ʽ��ϴ�.. </h1>
    </c:when>
    <c:otherwise>
        ����� �����ϴ� �̤�
    </c:otherwise>
</c:choose>





<hr/><hr/><hr/><hr/>

</body>
</html>