package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/delete")
public class postDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserVO user = (UserVO) request.getSession().getAttribute("user");

		boolean res;
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}

		// url에 따라서 다르게 처리

		String checkUrl = request.getParameter("checkUrl");

		if (checkUrl != null
				&& checkUrl.equals("/admin/boardReportedList")
				&& (user.getUser_role().equals("관리자") || user.getUser_role().equals("운영자"))) {
			res = postService.deletePost(num);
			System.out.println("이게 보여야 함 ");
			if (res) {
				request.setAttribute("msg", "게시글을 삭제했습니다.");
				request.setAttribute("url", "/admin/boardReport");
			} else {
				request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
				request.setAttribute("url", "/admin/boardReportedList?num=" + num);
			}

			request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
		}

		res = postService.deletePost(num, user);
		System.out.println("게시글 삭제 결과 : " + res);

		if (res) {
			request.setAttribute("msg", "게시글을 삭제했습니다.");
			request.setAttribute("url", "/board/list");
		} else {
			request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
			request.setAttribute("url", "post/detail?num=" + num);
		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}

}
