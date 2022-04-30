<%@page import="java.util.Objects"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.member.MemberDto"%>
<%@page import="data.dao.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
MemberDao dao = new MemberDao();
request.setCharacterEncoding("UTF-8");

Long memberId = Long.parseLong(request.getParameter("memberId"));
MemberDto member = dao.findByMemberId(memberId);

JSONObject ob = new JSONObject();
if (Objects.nonNull(member)) {
	ob.put("nickname", member.getNickname());
	ob.put("id", member.getId());
	ob.put("password", member.getPassword());
	ob.put("address", member.getAddress());
	ob.put("email", member.getEmail());
	ob.put("phoneNumber", member.getPhoneNumber());
}
%>

<%=ob.toString()%>