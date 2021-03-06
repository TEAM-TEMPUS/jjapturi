<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/components/footer.css">
<link rel="stylesheet" href="css/components/header.css">
<link rel="stylesheet" href="css/components/modal.css">
<link rel="stylesheet" href="css/components/profileModal.css">
<link rel="stylesheet" href="css/components/reservationConfirmModal.css">
<link rel="stylesheet" href="css/components/startRatingModal.css">

</head>
<%
	String context="home.html";
	
	if(request.getParameter("home")!=null){
		context=request.getParameter("home");
	}
	
	Long signInMemberId = null;
	if (Objects.nonNull(session.getAttribute("signInMemberId"))) {
		signInMemberId = (Long)session.getAttribute("signInMemberId");
	}
	
	String[] whiteListPaths = new String[] {"serviceList.jsp", "home.html"}; 
	boolean needToLogin = true;
	for (String path : whiteListPaths) {
		if (context.startsWith(path)) {
			needToLogin = false;
			break;
		}
	}
	
	if (needToLogin && Objects.isNull(signInMemberId)) {
		response.sendRedirect("login.html");
		return;
	}
%>
<body>

<div>
  <jsp:include page="header.html"/>
</div>

<div>
	<jsp:include page="<%=context %>"/>
</div>

<div>
  <jsp:include page="footer.html"/>
</div>

<script src="js/default.js"></script>
</body>
</html>