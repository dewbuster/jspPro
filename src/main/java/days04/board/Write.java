package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

@WebServlet("/cstvsboard/wirte.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Write.doGet()...");


		String path = "/days04/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Write.doPost()...");
		request.setCharacterEncoding("UTF-8");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt( request.getParameter("tag") );

		// DB 글작성 insert
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		int rowCount = 0;
		BoardDTO dto = 
				new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);

		try {
			rowCount = dao.insert(dto);
		} catch (SQLException e) { 
			System.out.println("> Write.doPost() Exception...");
			e.printStackTrace();
		}

		DBConn.close();

		// 목록 페이지로 리다이렉트
		String location = "/jspPro/cstvsboard/list.htm";
		location += rowCount == 1 ? "?write=success":"?write=fail";
		response.sendRedirect(location);
	}

}
