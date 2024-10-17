<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String location;
	
	if (id.equals("admin") && passwd.equals("1234")){
		// 관리자 로그인 성공
		String name = "이시훈";
		location = "ex09.jsp?ok&name="+URLEncoder.encode(name, "UTF-8");
	} else if(id.equals("hong") && passwd.equals("1234")){
		// 일반 로그인 성공
		String name = "홍길동";
		location = "ex09.jsp?ok&name="+URLEncoder.encode(name, "UTF-8");
	} else{
		// 로그인 실패
		location = "ex09.jsp?error";
	}

	response.sendRedirect(location);
	
%>