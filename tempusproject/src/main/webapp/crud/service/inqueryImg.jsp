<%@page import="data.dto.service.ServiceImgDto"%>
<%@page import="data.dao.service.ServiceImgDao"%>
<%@page import="java.util.Objects"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
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
ServiceImgDao dao=new ServiceImgDao();
request.setCharacterEncoding("utf-8");

Long serviceId = Long.parseLong(request.getParameter("serviceId"));
List<ServiceImgDto> serviceImg = dao.findByServiceImage(serviceId);


%>
</body>
</html>