package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/comment/block")
public class CommentBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String blocked_user_id = request.getParameter("blocked_user_id");
		String blocking_user_id = request.getParameter("blocking_user_id");
		
		System.out.println(blocked_user_id);
		
		BlockedVO blocked = new BlockedVO(blocking_user_id, blocked_user_id);
		
		boolean res = postService.insertuserBlocked(blocked);
    	response.getWriter().write(res?"ok":"");
	}

}
