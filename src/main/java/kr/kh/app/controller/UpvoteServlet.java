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

@WebServlet("/upvote/check")
public class UpvoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_id = 0;
		try {
			post_id = Integer.parseInt(request.getParameter("postId"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		int voteCount = postService.getVoteCount(post_id);
		
		response.getWriter().write("" + voteCount);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_id = 0, upvote = 0;
		
		try {
			post_id = Integer.parseInt(request.getParameter("postId"));
			upvote = Integer.parseInt(request.getParameter("upvote"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		System.out.println(post_id+ ", " + upvote);
		try {
			int result = postService.like(post_id, upvote, user);
			response.getWriter().write("" + result);
		} catch(Exception e) {
			response.getWriter().write("좋아요를 누를 수 없습니다.");
		}
		
	}

}