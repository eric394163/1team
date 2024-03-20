package kr.kh.app.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//마이페이지 - 내가 댓글 쓴 게시글 확인 서블릿
@WebServlet("/mypage/commentlist")
public class MyCommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/mypage/myCommentList.jsp").forward(request, response);
	}
}
