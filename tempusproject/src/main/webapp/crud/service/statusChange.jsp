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

String status = request.getParameter("status");
Long serviceId = Long.parseLong(request.getParameter("serviceId"));

ServiceDto service = new ServiceDto(status, serviceId);

serviceDao.changeStatus(service);
%>
</body>
</html>