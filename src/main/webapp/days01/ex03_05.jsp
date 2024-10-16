<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = request.getParameter("num")==null?0:
		request.getParameter("num").equals("")?0:Integer.parseInt(request.getParameter("num"));
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
  <%-- 정수 : <input type="text" id="num" name="num" value="<%=num %>" autofocus><br> --%>
  정수 : <input type="text" id="num" name="num" autofocus><br>
  <p id="demo">
			<%
			if (num != 0){
            	int sum = 0;
            	for(int i=1; i<=num; i++){
            		sum+=i;
          	%><%=i %>+<%
          	}
          	%>=<%=sum %>
          	<% } %>
  </p>
</div>
<script>
    $("#num")
      .css("text-align","center")
      <%-- .val('<%=num%>') --%>
      .val('${param.num}')
      .on({
         "keydown":function (e){
            if ( !(e.which >= 48 && e.which <= 57
                     || e.which == 8
                     || e.which == 13
                     || e.which == 229
                 )){
               alert("숫자만 입력하세요.");
               e.preventDefault();
            } // if
         },
         "keyup":function (event){
           if( $("#num").val() && event.which == 13){
        	   // $("form").submit();
              // js BOM
              let numValue = $("#num").val();
              location.href = `ex03_05.jsp?num=\${numValue}`;

           } // if
         }
      })
      .select();
  </script>
</body>
</html>