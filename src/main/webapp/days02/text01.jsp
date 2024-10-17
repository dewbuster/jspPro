<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<DeptVO> deptList = new ArrayList<>();
    ArrayList<EmpVO> empList = new ArrayList<>();

    // 부서 정보 가져오기
    String deptSql = "SELECT * FROM dept";
    try {
        conn = DBConn.getConnection();
        pstmt = conn.prepareStatement(deptSql);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            DeptVO vo = new DeptVO().builder()
                .deptno(rs.getInt("deptno"))
                .dname(rs.getString("dname"))
                .loc(rs.getString("loc"))
                .build();
            deptList.add(vo);
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        rs.close();
        pstmt.close();
    }

    // 선택된 부서의 직원 정보 가져오기
    String pDeptno = request.getParameter("deptno");
    int deptno = 0; // 기본값을 0으로 설정 (선택되지 않은 상태)
    try {
        if (pDeptno != null && !pDeptno.isEmpty()) {
            deptno = Integer.parseInt(pDeptno);
        }
    } catch (NumberFormatException e) {
        // 파싱 실패 시 기본값 유지
    }

    if (deptno != 0) {
        String empSql = "SELECT empno, ename, job, mgr, TO_CHAR(hiredate,'yyyy-MM-dd') hiredate, sal, comm, deptno " +
                        "FROM emp WHERE deptno = ?";
        try {
            pstmt = conn.prepareStatement(empSql);
            pstmt.setInt(1, deptno);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                EmpVO vo = new EmpVO().builder()
                    .empno(rs.getInt("empno"))
                    .ename(rs.getString("ename"))
                    .job(rs.getString("job"))
                    .mgr(rs.getInt("mgr"))
                    .hiredate(rs.getDate("hiredate"))
                    .sal(rs.getDouble("sal"))
                    .comm(rs.getDouble("comm"))
                    .deptno(rs.getInt("deptno"))
                    .build();
                empList.add(vo);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            pstmt.close();
            DBConn.close();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 및 직원 정보</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<style>
</style>
</head>
<body>
<header>
    <h1 class="main">부서 및 직원 정보</h1>
</header>
<div>
 <h2>부서 선택</h2>
<select name="deptno" onchange="location.href='?deptno=' + this.value">
    <option value="">부서를 선택하세요.</option>
    <% for(int i = 0; i < deptList.size(); i++) {
        DeptVO dept = deptList.get(i); %>
        <option value="<%= dept.getDeptno() %>" <%= (dept.getDeptno() == deptno) ? "selected" : "" %>>
            <%= dept.getDname() %>
        </option>
    <% } %>
</select>

<h2>직원 목록</h2>
<% if (deptno == 0) { %>
    <p>부서를 선택하세요.</p>
<% } else { %>
    <table>
        <thead>
            <tr>
                <th><input type="checkbox" id="checkAll" onclick="toggleCheckboxes(this)"></th>
                <th>empno</th>
                <th>ename</th>
                <th>job</th>
                <th>mgr</th>
                <th>hiredate</th>
                <th>sal</th>
                <th>comm</th>
                <th>deptno</th>
            </tr>
        </thead>
        <tbody>
        <% if(empList.isEmpty()) { %>
            <tr>
                <td colspan="9">해당 부서에 사원이 존재하지 않습니다.</td>
            </tr>
        <% } else {
            for(int i = 0; i < empList.size(); i++) {
                EmpVO emp = empList.get(i); %>
            <tr>
                <td><input type="checkbox" name="empCheck" value="<%= emp.getEmpno() %>" onclick="checkAllSelected()"></td>
                <td><%= emp.getEmpno() %></td>
                <td><%= emp.getEname() %></td>
                <td><%= emp.getJob() %></td>
                <td><%= emp.getMgr() %></td>
                <td><%= emp.getHiredate() %></td>
                <td><%= emp.getSal() %></td>
                <td><%= emp.getComm() %></td>
                <td><%= emp.getDeptno() %></td>
            </tr>
        <%  }
           } %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="9">
                    <span class="badge left red"><%= empList.size() %></span>명의 사원이 있습니다.
                </td>
            </tr>
            <tr>
                <td colspan="9">
                    <button onclick="submitCheckedEmployees()">확인</button>
                </td>
            </tr>
        </tfoot>
    </table>
<% } %>

</div>

<div id="output">
    <!-- 선택된 직원번호가 여기 출력됩니다 -->
</div>

<script>
// 전체 선택 체크박스 동작
function toggleCheckboxes(source) {
    const checkboxes = document.getElementsByName('empCheck');
    for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
}

// 체크박스가 하나씩 선택될 때 전체 선택 체크박스 상태 업데이트
function checkAllSelected() {
    const checkboxes = document.getElementsByName('empCheck');
    const checkAll = document.getElementById('checkAll');
    
    let allChecked = true;
    for (let i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }
    
    checkAll.checked = allChecked; // 모든 체크박스가 체크되면 전체 선택도 체크
}

// 선택된 직원 번호 출력하는 함수
function submitCheckedEmployees() {
    const checkboxes = document.getElementsByName('empCheck');
    const selectedEmployees = [];

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedEmployees.push(checkboxes[i].value);
        }
    }

    if (selectedEmployees.length > 0) {
        // 선택된 직원 번호들을 화면에 출력
        const outputDiv = document.getElementById('output');
        outputDiv.innerHTML = selectedEmployees.join('<br>');
    } else {
        alert('선택된 직원이 없습니다.');
    }
}
</script>

</body>
</html>