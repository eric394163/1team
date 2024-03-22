package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/comment/insert")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
    	int post_num = 0;
    	try {
    		post_num = Integer.parseInt(request.getParameter("num"));
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	//댓글 작성자를 가져옴 => 회원 정보를 가져옴 
    	UserVO user = (UserVO)request.getSession().getAttribute("user");
    	//댓글 등록하라고 시킴
    	CommentVO comment = new CommentVO(post_num, content, user.getUser_id());
    	boolean res = postService.insertComment(comment);
    	response.getWriter().write(res?"ok":"");
	}

}
