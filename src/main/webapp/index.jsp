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
    https://tomcat.apache.org/tomcat-9.0-doc/index.html
    1. JSP/Servlet
    	ㄴ Java 웹 기술
    	1) Servlet
    	2) JSP = Java Server Page
    			자바언어 + 서버에서 실행되는 페이지
    2. 처리과정							아파치		톰캣
    	클(브)  ->  request  ->	 웹서버(아파치)  -> WAS(웹 어플리케이션 서버)
    			url:index.jsp						index.jsp + Java + 컴파일,실행 => html
    			url:index.html
    			<- 응답(response)<-
    3. WebSocket 1.1
    
    4. [ 2주 JSP 수업 내용 ]
     1. JSP 페이지의 구성요소 
     2. JSP 3가지 지시자 - 
        1) page, 	지시자
        2) include, 지시자
        3) taglib	지시자
        
     3. JSP 스크립트(script) - 
        1) 스크립트릿, 
        2) 표현식, 
        3) 선언문
     4. JSP 처리 과정
     5. 웹 어플리케이션 배포
     6. 페이지 모듈화
     7. 자바빈(java bean)과 액션태그
     8. JSP 쿠키, 세션 - 상태관리
     9. EL 3.0 (표현언어)
        Expression Language
     10. JSTL( 표준 태그 라이브러리)
     11. 커넥션풀( Connection Pool )
     12. 서블릿(Servlet)
     13. ***  MVC 패턴  ***
     14. 필터(Filter)
     15. ServletContextListener 구현
     
     16. 실습 예제
        방명록
        게시판
        답변형 게시판
        파일 첨부 게시판(자료실)
        회원가입 + 인증처리
        등등
        
        차트
        Ajax
        구글맵
        OPEN API (다음 카카오 우편번호 검색 API)
        등등
     5. 정적 페이지 / 동적 페이지
  </xmp>
</div>
</body>
</html>