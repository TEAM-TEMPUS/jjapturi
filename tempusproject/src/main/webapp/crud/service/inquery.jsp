<%@page import="java.util.Objects"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="datadto.ServiceInqueryDto"%>
<%@page import="datadao.ServiceInqueryDao"%>
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
ServiceInqueryDao dao= new ServiceInqueryDao();
request.setCharacterEncoding("utf-8");

Long serviceId = Long.parseLong(request.getParameter("serviceId"));
ServiceInqueryDto service = dao.findInqueryServiceId(serviceId);

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