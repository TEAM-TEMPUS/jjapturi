<%@page import="data.dao.tradinginfo.TradingInfoDao"%>
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
TradingInfoDao tradingInfo = new TradingInfoDao();

String status = request.getParameter("status");
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
Long memberId = (Long)session.getAttribute("signInMemberId");

serviceDao.changeStatus(new ServiceDto(status, serviceId));

if (status.equals("basic")) {
	tradingInfo.deleteByMemberIdAndServiceId(memberId, serviceId);	
}

%>
</body>
</html>