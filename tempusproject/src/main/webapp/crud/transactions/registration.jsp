<%@page import="data.dao.grade.GradeDao"%>
<%@page import="data.dto.tradinginfo.TradingInfoDto"%>

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
GradeDao gradeDao = new GradeDao();
request.setCharacterEncoding("utf-8");

Long memberId = Long.parseLong("memberId");
Long serviceId = Long.parseLong("serviceId");
int price=Integer.parseInt("price");

TradingInfoDto grade = new TradingInfoDto(memberId, serviceId, price);

gradeDao.insertGrade(grade);
%>
</body>
</html>