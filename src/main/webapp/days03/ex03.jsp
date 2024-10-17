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
    [jsp 구성 요소]
    1. jsp 스크립트
      1) 스크립트릿 - 자바 코딩.
      2) 표현식 - 출력 스트림       표현언어(EL) X
      3) 선언문 - 변수, 메서드 선언

      
  </xmp>
  <%
  	String name = "홍길동";
  
  	for (int i = 1; i<=10; i++){
  %>
  		i=<%=i %> <br>
  <%
  	}
  %>
  
  이름 : <%= name %><br>
  나이 : <%= age %><br>
  메서드 : <%= getMessage("헬로") %><br>
  
  <%!
  	int age = 20;
  
  	public String getMessage(String message){
  		return "안녕 : " + message; 
  	}
  %>
  
  
</div>
</body>
</html>