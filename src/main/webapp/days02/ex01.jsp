<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "SELECT * "
	      + " FROM dept";
	ResultSet rs = null;
	int deptno;
	String dname, loc;
	DeptVO vo = null;
	ArrayList<DeptVO> list = null;
	Iterator<DeptVO> ir = null;

	
	try{
		conn = DBConn.getConnection();
		//System.out.println("> conn = " + conn);
		//System.out.println("> conn = " + conn.isClosed());
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if( rs.next() ){
			list = new ArrayList<>();
			do{
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = new DeptVO().builder().deptno(deptno).dname(dname).loc(loc).build();
				
				list.add(vo);
			} while( rs.next() );
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			pstmt.close();
			DBConn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
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
  
  <select id="deptno" name="deptno">
  	<option>부서 선택하세요</option>
  	<%
        ir = list.iterator();
        while( ir.hasNext() ){
           vo = ir.next();
           deptno = vo.getDeptno();
           dname = vo.getDname();
     %>
        <option value="<%= deptno%>"><%= dname%></option>
     <%
        } // while
     %>
  </select>
</div>
<script>
  $("#deptno").on("change", function(){
    // alert("test");
    let deptno = $(this).val();
    location.href = `ex01_emp.jsp?deptno=\${deptno}`;
  });
</script>
</body>
</html>