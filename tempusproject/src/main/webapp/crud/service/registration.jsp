<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
ServiceDao serviceDao = new ServiceDao();
ServiceImageDao serviceImageDao = new ServiceImageDao();

Long signInMemberId = (Long)session.getAttribute("signInMemberId");

String realPath=getServletContext().getRealPath("/img");
System.out.println(realPath);

int uploadSize=1024*1024*100;

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());

String storeImageName = multi.getFilesystemName("uploadFileNames");
String types = multi.getParameter("types");
String title = multi.getParameter("title");
String category = multi.getParameter("category");
String place = multi.getParameter("place");
String startDate = multi.getParameter("startDate");
String endDate = multi.getParameter("endDate");
int price = Integer.parseInt(multi.getParameter("price"));
String description = multi.getParameter("description");

ServiceDto service = new ServiceDto(signInMemberId, types, title, category, place, startDate, endDate, price, description);
Long serviceId = serviceDao.store(service);

ServiceImageDto serviceImage = new ServiceImageDto(serviceId, storeImageName);
ServiceImageDao.store(serviceImage);

response.sendRedirect("../../index.jsp");
}catch(Exception e){
	
}
%>
</body>
</html>