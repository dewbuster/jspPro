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
    1. request.getParameter()
    2. request.getParameterValues()
    3. request.getParameterNames()
    4. request.getParameterMap()	key-value Entry
  </xmp>
    <form action="ex05_ok.jsp" method="get"> 
      이름 : <input type="text" name="name" value="홍길동" placeholder="이름을 입력하세요">
      <br>
      성별 : 
        <input type="radio" name="gender"  value="m" checked="checked"> 남자
        <input type="radio" name="gender"  value="f">여자
        <br>
       
      좋아하는 동물 :
         <input type="checkbox" name="pet" value="dog" checked="checked">개  
         <input type="checkbox" name="pet" value="cat">고양이  
         <input type="checkbox" name="pet" value="pig" checked> 돼지
         <br>    
      <input type="submit">
  </form>  
</div>
</body>
</html>