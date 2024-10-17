<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   //      "/jspPro"
   String contextPath = request.getContextPath();
%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   String sql = "SELECT * "
         + " FROM dept";
   ResultSet rs = null;
   int deptno;
   String dname, loc;
   DeptVO dvo = null;
   ArrayList<DeptVO> dlist = null;
   Iterator<DeptVO> dir = null;
   
   int p_deptno;
   
   try{
      conn = DBConn.getConnection();
      //System.out.println("> conn = " + conn);
      //System.out.println("> conn = " + conn.isClosed());
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if( rs.next() ){
         dlist = new ArrayList<>();
         do{
            deptno = rs.getInt("deptno");
            dname = rs.getString("dname");
            loc = rs.getString("loc");
            
            dvo = new DeptVO().builder().deptno(deptno).dname(dname).loc(loc).build();
            
            dlist.add(dvo);
         } while( rs.next() );
      }
   } catch(Exception e){
      e.printStackTrace();
   } finally{
      try{
         rs.close();
         pstmt.close();
         //DBConn.close();
      } catch(Exception e){
         e.printStackTrace();
      }
   }
%>
<%
   String pDeptno = request.getParameter("deptno");
   try{
      p_deptno = Integer.parseInt(pDeptno);      
   } catch(Exception e){
      p_deptno = 10;
   }
   
   sql = "SELECT empno, ename, job, mgr, "
            + " TO_CHAR(hiredate, 'yyyy-MM-dd') as hiredate, sal, comm, deptno "
         + " FROM emp"
         + " WHERE deptno = ? ";
   
   int empno, mgr;
   String ename, job;
   Date hiredate;
   double sal, comm;
   
   EmpVO evo = null;
   ArrayList<EmpVO> elist = null;
   Iterator<EmpVO> eir = null;
   
   try{
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, p_deptno);
      rs = pstmt.executeQuery();

      if( rs.next() ){
         elist = new ArrayList<>();
         do{
            empno = rs.getInt("empno");
            ename =rs.getString("ename");
            job =rs.getString("job");
            mgr =rs.getInt("mgr");
            hiredate =rs.getDate("hiredate");
            sal =rs.getDouble("sal");
            comm =rs.getDouble("comm");
            deptno = rs.getInt("deptno");
            
            evo = new EmpVO().builder()
                  .empno(empno).ename(ename).job(job).mgr(mgr)
                  .sal(sal).comm(comm).hiredate(hiredate).deptno(deptno)
                  .build();
            
            elist.add(evo);
         } while( rs.next() );
      }
   } catch(Exception e){
      e.printStackTrace();
   } finally{
      try{
         pstmt.close();
         rs.close();
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
        dir = dlist.iterator();
        while( dir.hasNext() ){
           dvo = dir.next();
           deptno = dvo.getDeptno();
           dname = dvo.getDname();
     %>
        <%-- <option value="<%= deptno%>" <%=p_deptno==deptno?"selected":"" %>><%= dname%></option> --%>
        <option value="<%= deptno%>"><%= dname%></option>
     <%
        } // while
     %>
  </select>
  <br>
  <br>
    <h2>emp list</h2>
  <table>
   <thead>
      <th><input type="checkbox" id="ckbAll" name = "ckbAll"></th>
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
        if(elist==null){
     %>
     <tr>
      <td colspan="9">사원존재 X</td>
   </tr>
   <%
        } else{
           eir = elist.iterator();
             while( eir.hasNext() ){
                evo = eir.next();
                empno = evo.getEmpno();
                ename = evo.getEname();
                job = evo.getJob();
                mgr = evo.getMgr();
                hiredate = evo.getHiredate();
                sal = evo.getSal();
                comm = evo.getComm();
                deptno = evo.getDeptno();
     %>
        <tr>
         <td><input type="checkbox" data-empno="<%= empno %>" id="ckb_" name = "ckb_"></td>
           <td><%=empno %></td><td><%=ename %></td><td><%=job %></td><td><%=mgr %></td>
           <td><%=hiredate %></td><td><%=sal %></td><td><%=comm %></td><td><%=deptno %></td>
        </tr>
     <%
             }
        } // while
     %>
   </tbody>
   <tfoot>
      <tr>
         <td colspan="9">
            <span class="badge left red"><%= elist==null?0:elist.size() %></span>명.
            <a href="javascript:history.back()">뒤로 가기</a>
            <button>선택한 empno 확인</button>
         </td>
      </tr>
   </tfoot>
  </table>
</div>
<script>
  $("#deptno").val(${param.deptno});
  $("#deptno").on("change", function(){
    let deptno = $(this).val();
    location.href = `<%=contextPath %>/days03/ex01.jsp?deptno=\${deptno}`;
  });
</script>
<script>
   // 모두 선택 체크 박스
   $("#ckbAll").on("click", function(event){
      $("table tbody tr")
         .find("td:first-child :checkbox")
         .prop("checked", $(this).prop("checked"));
   })
   // 각 사원들의 체크박스를 클릭할때 모두선택 체크박스 처리
   $("table tbody tr")
      .find("td:first-child :checkbox").on("click", function(){
         let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
         $("#ckbAll").prop("checked", ck);
      })
</script>
<script>
   /* 1. 풀이
   $("tfoot button").on("click",function(event){
      let empnos = [];
      $("tbody :checkbox:checked").each(function(index, element){
        // ck            td               td
        let empno = element.parentElement.nextElementSibling.innerText;
        empnos.push(empno);
      }); // each
      location.href = `ex01_ok.jsp?empnos=\${ empnos.join("/") }`;
   }); // button
   */
   
   $("tfoot button").on("click",function(event){
      let empnos = [];
      $("tbody :checkbox:checked").each(function(index, element){
           // data-empno
           let empno = $(element).data("empno");
           empnos.push(empno);
      }); // each
      location.href = `ex01_ok.jsp?empno=\${ empnos.join("&empno=")}`;
   });
 </script>
</body>
</html>