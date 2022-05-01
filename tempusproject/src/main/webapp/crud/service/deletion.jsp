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

ServiceDao dao = new ServiceDao();
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
ServiceDto service = new ServiceDto(serviceId);
dao.delete(serviceId);

%>
</body>
</html>