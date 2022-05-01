<%@page import="data.dao.member.MemberImageDao"%>
<%@page import="data.dao.member.MemberDao"%>
<%@page import="data.dto.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
MemberDao memberDao = new MemberDao();
MemberImageDao memberImageDao = new MemberImageDao();
request.setCharacterEncoding("UTF-8");

String nickname = request.getParameter("nickname");
String id = request.getParameter("id");
String password = request.getParameter("password");
String address = request.getParameter("address");
String email = request.getParameter("email");
String phoneNumber = request.getParameter("phoneNumber");

MemberDto member = new MemberDto(nickname, id, password, address, email, phoneNumber);

memberDao.save(member);
memberImageDao.save(memberDao.findById(id).getMemberId()); // 기본 이미지 등록
%>
</body>
</html>