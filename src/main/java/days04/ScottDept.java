package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;

import com.util.DBConn;

//@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScottDept() {
		super();
	}
	// post요청, get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottDept.doGet()...");
		// 로직 처리 부분
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

		//ex01_dept.jsp 포워딩
		// 1) jsp페이지에 데이터 전달 + request 객체에 저장.
		request.setAttribute("list", list);
		
		String path = "/days04/ex01_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}