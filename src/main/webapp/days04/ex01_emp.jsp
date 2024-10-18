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
<%
	ArrayList<EmpVO> list = (ArrayList<EmpVO>)request.getAttribute("list");
	EmpVO vo = null;
	Iterator<EmpVO> ir = null;
%>
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
  	<%
  		if(list==null){
  	%>
  	<tr>
		<td colspan="8">사원존재 X</td>
	</tr>
	<%
  		} else{
  			ir = list.iterator();
  	        while( ir.hasNext() ){
  	           vo = ir.next();
  	%>
        <tr>
        	<td><%=vo.getEmpno() %></td><td><%=vo.getEname() %></td><td><%=vo.getJob() %></td>
        	<td><%=vo.getMgr() %></td>
        	<td><%=vo.getHiredate() %></td><td><%=vo.getSal() %></td><td><%=vo.getComm() %></td>
        	<td><%=vo.getDeptno() %></td>
        </tr>
     <%
  	        }
        } // while
     %>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<span class="badge left red"><%= list==null?0:list.size() %></span>명.
				<a href="javascript:history.back()">뒤로 가기</a>
			</td>
		</tr>
	</tfoot>
  </table>
</div>
</body>
</html>