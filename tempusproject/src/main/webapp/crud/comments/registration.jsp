<%@page import="dto.CommentDto"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
CommentDao dao = new CommentDao();


request.setCharacterEncoding("UTF-8");

Long memberId = Long.parseLong(request.getParameter("memberId"));
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
String text = request.getParameter("text");

CommentDto dto = new CommentDto(memberId,serviceId,text);
dao.insertComment(dto);


%>
</body>
</html>