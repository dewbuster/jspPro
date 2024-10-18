<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
  <h2>emp list</h2>
  <table>
	<thead>
		<th>empno</th>
		<th>ename</th>
		<th>job</th>
		<th>mgr</th>
		<th>hiredate</th>
		<th>sal</th>
		<th>comm</th>
		<th>deptno</th>
	</thead>
  	<tbody>
  	<%-- <c:if test="${list == null}">
  	</c:if>
  	<c:if test="${list != null}">
  	</c:if> --%>
  	<!-- empty : EL 연산자 -->
  	<c:if test="${empty list}">
  		<tr>
          <td colspan="8">사원이 존재 X</td>
         </tr>
  	</c:if>
  	<!-- ! == not : EL 연산자 -->
  	<c:if test="${not empty list}">
		<c:forEach items="${ list }" var="vo">
	        <tr>
	        	<td>${vo.empno}</td><td>${vo.ename}</td><td>${vo.job}</td>
	        	<td>${vo.mgr}</td>
	        	<td>${vo.hiredate}</td><td>${vo.sal}</td><td>${vo.comm}</td>
	        	<td>${vo.deptno}</td>
	        </tr>
	        <!-- vo.empno => vo.getEmpno() getter 가 존재해야함 -->
	  	</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<span class="badge left red">${empty list ? 0 : list.size()}</span>명.
				<a href="javascript:history.back()">뒤로 가기</a>
			</td>
		</tr>
	</tfoot>
  </table>
</div>
</body>
</html>