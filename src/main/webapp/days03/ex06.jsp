<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    [헤더 정보 관련 메서드]
    request.getHeader(String name)
    	request.getHeaders(String name)
    request.getHeaderNames(String name)
    	request.getIntHeader(String name)
    	request.getDateHeader(String name)

      [헤더 정보 설정]
      addHeader(name, value)
      addIntHeader(name, value)
      addDateHeader(name, value)  
      
      setHeader()
      setIntHeader()
      setDateHeader()  
  </xmp>
  <h3>요청 헤더 정보 조회</h3>
  <%
  		Enumeration<String> en = request.getHeaderNames();
  		while( en.hasMoreElements() ){
  			String hname = en.nextElement();
  			String hvalue = request.getHeader(hname);
  %>
  		<li><%=hname %> : <%=hvalue %></li>			
  <%
  		}
  %>
</div>
</body>
</html>