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
    [리다이렉트/포워딩 차이점]
    포워딩 - MVC패턴 개발
    
    1) /scott/dept URL-Pattern GET 요청
    2) ScottDept.java 서블릿 요청	doGet(){
    	-- 로직처리 --
    	SELECT 부서정보
    	ArrayList<DeptVO> list;
    	-- ***포워딩 --
    	ex01_dept.jsp
    }
    3) ex01_dept.jsp
    	부서정보 출력해서
    	클라이언트 응답
    	
    	//days02.ex01_emp.jsp
    	1) ex01_dept.jsp	select 태그에서 부서를 선택
    	2) /scott/emp -> ScottEmp.java 서블릿 요청	GET방식
    						doGet(){ 
    							파라미터로 넘어오는 부서번호(deptno)
    							해당 부서원들을 list
    							
    							// 포워딩 ex01_emp.jsp
    						}
    	3) ex01_emp.jsp
    		사원 정보를 출력.. 
  </xmp>
  
  <%
  	String contextPath = request.getContextPath();
  %>
  <a href="<%=contextPath %>/scott/dept">/scott/dept</a>
</div>
</body>
</html>