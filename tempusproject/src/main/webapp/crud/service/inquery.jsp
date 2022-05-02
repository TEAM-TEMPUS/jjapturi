<%@page import="java.util.List"%>
<%@page import="data.dao.service.ServiceDao"%>
<%@page import="java.util.Objects"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.service.ServiceInqueryDto"%>

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
ServiceDao dao= new ServiceDao();
request.setCharacterEncoding("utf-8");

Long serviceId = Long.parseLong(request.getParameter("serviceId"));
ServiceInqueryDto service = dao.findByServiceId(serviceId);

JSONObject ob = new JSONObject();
if(Objects.nonNull(service)){
	ob.put("types", service.getTypes());
	ob.put("title", service.getTitle());
	ob.put("types", service.getCategory());
	ob.put("types", service.getPlace());
	ob.put("types", service.getStartDate());
	ob.put("types", service.getEndDate());
	ob.put("types", service.getPrice());
	ob.put("types", service.getDescription());
}
%>

<%=ob.toString() %>
</body>
</html>