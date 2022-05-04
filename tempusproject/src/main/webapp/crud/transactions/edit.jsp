<%@page import="data.dao.tradinginfo.TradingInfoDao"%>
<%@page import="data.dto.tradinginfo.TradingInfoDto"%>

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
	TradingInfoDao dao = new TradingInfoDao();
	request.setCharacterEncoding("utf-8");

	
	Long memberId = Long.parseLong(request.getParameter("memberId"));
	Long serviceId = Long.parseLong(request.getParameter("serviceId"));
	int grade = Integer.parseInt(request.getParameter("grade"));

	TradingInfoDto tradingInfo = new TradingInfoDto(memberId, serviceId, grade);

	dao.updateGrade(tradingInfo);
	
	response.sendRedirect("../../index.jsp?home=transaction.jsp");
	%>
</body>
</html>