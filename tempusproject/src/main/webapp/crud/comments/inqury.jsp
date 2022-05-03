<%@page import="data.dto.comment.CommentListDto"%>
<%@page import="data.dao.comment.CommentListDao"%>
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
CommentListDao dao = new CommentListDao();
request.setCharacterEncoding("UTF-8");

Long commentId = Long.parseLong(request.getParameter("commentId"));
Long memberId = Long.parseLong(request.getParameter("memberId"));
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
String text = request.getParameter("text");
String nickname =  request.getParameter("nickname");
String store_img_name =  request.getParameter("store_img_name");
//댓글 조인한 테이블 dao통해 댓글 정보 dto획득
//CommentListDto dto = dao.findcommentlist(dto);
%>
</body>
</html>