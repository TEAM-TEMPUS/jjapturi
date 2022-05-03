<%@page import="java.util.Objects"%>
<%@page import="data.dto.member.MemberDto"%>
<%@page import="data.dao.member.MemberDao"%>
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
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	MemberDao memberDao = new MemberDao();
	MemberDto findMember = memberDao.findById(id);

	if (Objects.isNull(findMember)) {
	%>
	<script type="text/javascript">
		alert("아이디가 일치하지 않습니다");
		history.back();
	</script>
	<%
	} else if (!findMember.getPassword().equals(password)) {
	%>
	<script type="text/javascript">
		alert("잘못된 비밀번호입니다.");
		history.back();
	</script>
	<%
	} else {
		session.setAttribute("signInMemberId", findMember.getMemberId());
		response.sendRedirect("../../index.jsp");
	}
	%>
</body>
</html>