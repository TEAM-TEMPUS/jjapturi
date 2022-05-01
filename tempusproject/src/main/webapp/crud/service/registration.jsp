<%@page import="data.dao.service.ServiceImageDao"%>
<%@page import="data.dto.service.ServiceDto"%>
<%@page import="data.dao.service.ServiceDao"%>
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
request.setCharacterEncoding("UTF-8");
ServiceDao serviceDao = new ServiceDao();

String types = request.getParameter("types");
String title = request.getParameter("title");
String category = request.getParameter("category");
String place = request.getParameter("place");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
int price = Integer.parseInt(request.getParameter("price"));
String description = request.getParameter("description");

ServiceDto service = new ServiceDto(types, title, category, place, startDate, endDate, price, description);

serviceDao.store(service);
%>
</body>
</html>