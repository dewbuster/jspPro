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
   int deptno;
   String pDeptno = request.getParameter("deptno");
   try{
      deptno = Integer.parseInt(pDeptno);
   }catch(Exception e){
      deptno = 10;
   }

   Connection conn = null;
   PreparedStatement pstmt = null;
   String sql = "SELECT empno, ename, job, mgr, "
         + " TO_CHAR(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno"
         + " FROM emp "
         + " WHERE deptno = ? ";
   ResultSet rs = null;

   int empno, mgr;
   String ename, job;
   Date hiredate;
   double sal, comm;
      
   EmpVO vo = null;
   ArrayList<EmpVO> list = null;
   Iterator<EmpVO> ir = null;
   
   try{
      conn = DBConn.getConnection();
      // System.out.println("> conn = " + conn);
      // System.out.println("> isClosed = " + conn.isClosed());
      pstmt = conn.prepareStatement(sql);
      
      // ?
      pstmt.setInt(1,deptno);
      
      rs = pstmt.executeQuery();
      if( rs.next() ){
         list = new ArrayList<>();
         do{
            empno = rs.getInt("empno");
            ename = rs.getString("ename");
            job = rs.getString("job");
            mgr = rs.getInt("mgr");
            hiredate = rs.getDate("hiredate");
            sal = rs.getDouble("sal");
            comm = rs.getDouble("comm");
            
            vo = new EmpVO().builder()
                  .empno(empno).ename(ename).job(job).mgr(mgr)
                  .hiredate(hiredate).sal(sal).comm(comm)
                  .build();
            
            list.add(vo);
            
         }while( rs.next() );
      } // if
      
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      try{
         pstmt.close();
         DBConn.close();
      }catch(Exception e){
         e.printStackTrace();
      }
   } // try catch
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Jam HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
     ex01_emp.jsp     
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
     <%-- for each 문으로 
     <tbody>
  <%
    if (list == null) {
  %>
      <tr>
        <td colspan="8">사원이 존재 X</td>
      </tr>
  <%
    } else {
      for (EmpVO evo : list) {  // YourVOType을 실제 VO 클래스명으로 바꾸세요
  %>
      <tr>
        <td><%= evo.getEmpno() %></td>
        <td><%= evo.getEname() %></td>
        <td><%= evo.getJob() %></td>
        <td><%= evo.getMgr() %></td>
        <td><%= evo.getHiredate() %></td>
        <td><%= evo.getSal() %></td>
        <td><%= evo.getComm() %></td>
        <td><%= evo.getDeptno() %></td>
      </tr>
  <%
      }
    }
  %>
</tbody> --%>
<tbody>
      <%
         if(list == null){
      %>
         <tr>
          <td colspan="8">사원이 존재 X</td>
         </tr>
      <%
         }else{
            ir = list.iterator();
            while(ir.hasNext()){
               vo=ir.next();
      %>
         <tr>
          <td><%= vo.getEmpno() %></td>
          <td><%= vo.getEname() %></td>
          <td><%= vo.getJob() %></td>
          <td><%= vo.getMgr() %></td>
          <td><%= vo.getHiredate() %></td>
          <td><%= vo.getSal() %></td>
          <td><%= vo.getComm() %></td>
          <td><%= vo.getDeptno() %></td>
         </tr>
      <%
            }
         };
      %>
</tbody>
     <tfoot>
      <tr>
       <td colspan="8">
        <span class="badge left red"><%= list==null?0:list.size() %></span>명.
        <a href="javascript:history.back()">뒤로가기</a>
       </td>
      </tr>
     </tfoot>
  </table>
</div> 
</body>
</html>