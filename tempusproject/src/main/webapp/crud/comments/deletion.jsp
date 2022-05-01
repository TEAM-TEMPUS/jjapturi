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

Long commentId = Long.parseLong(request.getParameter("commentId"));


CommentDto dto = new CommentDto(commentId);
dao.deleteComment(commentId);
%>
</body>
</html>