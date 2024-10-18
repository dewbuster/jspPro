<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">ddd Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    
  </xmp>
  <%
  	String name = request.getParameter("name");
  	String age = request.getParameter("age");
  %>
  <form action="ex03_03.jsp">
    address : <input type="text" name="address" value="서울 역삼동"><br>
    tel : <input type="text" name="tel" value="010-1111-1111"><br>
    <input type="button" value="Prev" onclick="history.back();">
    <input type="submit" value="Next">
    
    <!-- 이전 페이지에서 전달된 파라미터를 저장할 input type=hidden -->
    <!--  
    <input type="hidden" name="name" value="<%=name%>">
    <input type="hidden" name="age" value="${param.age}">
	-->
		
  </form>
<%-- 	
	<c:forEach items="<%=request.getParameterNames() %>" var="pname">
		${pname}
	</c:forEach> 
--%>
  <script>

  	let hiddenElement;
	<%
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String pname = en.nextElement();
			String pvalue = request.getParameter(pname);
	%>
	hiddenElement = `<input type="hidden" name="<%=pname%>" value="<%=pvalue%>">`
	$("form").append(hiddenElement);
	<%	
		}
	%>    

  </script>
</div>
</body>
</html>