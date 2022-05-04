<%@page import="data.dto.service.ServiceImageDto"%>
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
ServiceImageDao serviceImageDao = new ServiceImageDao();

Long serviceId = Long.parseLong(request.getParameter("serviceId"));
Long memberId = Long.parseLong(request.getParameter("memberId"));
String storeImageName = request.getParameter("storeImageName");
String types = request.getParameter("types");
String title = request.getParameter("title");
String category = request.getParameter("category");
String place = request.getParameter("place");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
int price = Integer.parseInt(request.getParameter("price"));
String description = request.getParameter("description");

ServiceDto service = new ServiceDto(memberId, types, title, category, place, startDate, endDate, price, description);
serviceDao.store(service);

ServiceImageDto serviceImage = new ServiceImageDto(serviceId, storeImageName);
ServiceImageDao.store(serviceImage);

response.sendRedirect("../../serviceRegistration.jsp");


%>
</body>
</html>