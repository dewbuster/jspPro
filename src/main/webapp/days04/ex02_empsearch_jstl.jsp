<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
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
    ex02_empsearch_jstl.jsp
  </xmp>
  
    <form action="<%=contextPath%>/days04/empsearch.htm">
      <fieldset>
        <legend>부서 선택</legend>
		<c:forEach items="${dlist}" var="vo">
			<input type="checkbox" id="deptno-${vo.deptno}" 
			name="deptno" value="${vo.deptno}">
			<label for="deptno-${vo.deptno}">${vo.dname}</label>
		
		</c:forEach>
      </fieldset>
       <fieldset>
        <legend>잡(job) 선택</legend>
		<c:forEach items="${jlist}" var="job">
			<input type="checkbox" id="job-${job}"
			name="job" value="${job}">
			<label for="job-${job}">${job}</label>
		
		</c:forEach>
      </fieldset>
      
      <input type="submit" value="search">
      <input type="button" value="emp delete">
		
    </form>
    
    <!-- ex01_emp_jstl.jsp -->
    <h2>emp search list</h2>
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

  	<c:if test="${empty elist}">
  		<tr>
          <td colspan="8">사원이 존재 X</td>
         </tr>
  	</c:if>
  	<!-- ! == not : EL 연산자 -->
  	<c:if test="${not empty elist}">
		<c:forEach items="${ elist }" var="vo">
	        <tr>
	        	<td>${vo.empno}</td>
	        	<td>${vo.ename}</td>
	        	<td>${vo.job}</td>
	        	<td>${vo.mgr}</td>
	        	<td>${vo.hiredate}</td>
	        	<td>${vo.sal}</td>
	        	<td>${vo.comm}</td>
	        	<td>${vo.deptno}</td>
	        </tr>
	        <!-- vo.empno => vo.getEmpno() getter 가 존재해야함 -->
	  	</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<span class="badge left red">${empty elist ? 0 : elist.size()}</span>명.
				<a href="javascript:history.back()">뒤로 가기</a>
				<button>선택한 empno 확인</button>
			</td>
		</tr>
	</tfoot>
  </table>
  <script>
  	// 체크박스 체크유지 상태관리
  	// http://localhost/jspPro/days04/empsearch.htm?deptno=10&deptno=20&deptno=30&job=CLERK
  	let url = location.href;
  	//alert(url);
  	$(":checkbox[name=deptno]").each(function(index, element){
  		let v = $(element).val();
  		if (url.includes(`deptno=\${v}`)){
        $(element).prop("checked", true);
      }
  	});
  	$(":checkbox[name=job]").each(function(index, element){
  		let v = $(element).val();
  		if (url.includes(`job=\${v}`)){
        $(element).prop("checked", true);
      }
  	});
  </script>
</div>
</body>
</html>