package days03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "서블릿 get/post 방식 요청 테스트", urlPatterns = { "/method/info.htm" })
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Info() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">Info.doGet()...");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.printf("Get: name=%sm age=%d\n", name, age);
		
		out.print("> 이름: "+ name + "<br>");
		out.print("> 나이: "+ age + "<br>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">Info.doPost()...");
		// request.setCharacterEncoding("utf-8"); 받을때 utf-8로
		// response.setContentType("text/html; charset=UTF-8"); 보낼때 utf-8로
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));

		System.out.printf("Post: name=%sm age=%d\n", name, age);
		
		out.print("> 이름: "+ name + "<br>");
		out.print("> 나이: "+ age + "<br>");
	}

}
