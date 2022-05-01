<%@page import="datadao.GradeDao"%>
<%@page import="datadto.GradeDto"%>
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
GradeDao gradeDao = new GradeDao();
request.setCharacterEncoding("utf-8");

Long memberId = Long.parseLong("memberId");
Long serviceId = Long.parseLong("serviceId");
int price=Integer.parseInt("price");

GradeDto grade = new GradeDto(memberId, serviceId, price);

gradeDao.insertGrade(grade);

%>
</body>
</html>