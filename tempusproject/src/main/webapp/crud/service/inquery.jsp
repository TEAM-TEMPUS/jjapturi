<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.service.ServiceImageDto"%>
<%@page import="data.dao.service.ServiceImageDao"%>
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
ServiceDao serviceDao= new ServiceDao();
ServiceImageDao serviceImageDao = new ServiceImageDao();
request.setCharacterEncoding("utf-8");

Long serviceId = Long.parseLong(request.getParameter("serviceId"));
ServiceInqueryDto service = serviceDao.findByServiceId(serviceId);
List<ServiceImageDto> list = serviceImageDao.findAllByServiceId(serviceId);

JSONObject ob = new JSONObject();
if(Objects.nonNull(service)){
	
	List<String> storeImgNames = new ArrayList<>();
	for(int i=0; i<list.size(); i++){
			ServiceImageDto sid = list.get(i);
			sid.getStoreImageName();
	}
	
	ob.put("storeImgName", storeImgNames.add("storeImgName"));
	ob.put("types", service.getTypes());
	ob.put("title", service.getTitle());
	ob.put("category", service.getCategory());
	ob.put("place", service.getPlace());
	ob.put("startDate", service.getStartDate());
	ob.put("endDate", service.getEndDate());
	ob.put("price", service.getPrice());
	ob.put("description", service.getDescription());
}
%>

<%=ob.toString() %>
</body>
</html>