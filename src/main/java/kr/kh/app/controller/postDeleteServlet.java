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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		
		int num;
		
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		
		boolean res = postService.deletePost(num, user);
		
		if(res) {
			request.setAttribute("msg", "게시글을 삭제했습니다.");
			request.setAttribute("url", "post/list");
		} else {
			request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
			request.setAttribute("url", "post/detail?num="+num);
		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);		
	}

}
