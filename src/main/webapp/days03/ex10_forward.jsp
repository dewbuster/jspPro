<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = "ex10_finish.jsp";
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
%>