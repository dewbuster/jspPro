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
    list.jsp
  </xmp>
  <h2>목록 보기</h2>
  <a href="<%=contextPath %>/cstvsboard/wirte.htm">글쓰기</a>
  
  <table>
  	<thead>
     <tr>
        <th width="10%">번호</th>
        <th width="45%">제목</th>
        <th width="17%">작성자</th>
        <th width="20%">등록일</th>
        <th width="10%">조회</th>
      </tr>
   </thead>
   <tbody>
   	<c:choose>
   		<c:when test="${empty list}">
   			<td colspan="5">동록된 게시글이 없습니다.</td>
   		</c:when>
   		<c:otherwise>
   			<c:forEach items="${ list }" var="dto">
   			<tr>
   				<td>${dto.seq}</td>
   				<td>${dto.title}</td>
   				<td>${dto.writer}</td>
   				<td>${dto.writedate}</td>
   				<td>${dto.readed}</td>
   			</tr>
   			</c:forEach>
   		</c:otherwise>
   	</c:choose>
   </tbody>
   <tfoot>
   	<tr>
   		<td colspan="5" align="center">prev [1start] 2 3 4 5 6 7 8 9 10 next</td>
   	</tr>
   </tfoot>
  </table>
</div>
</body>
</html>