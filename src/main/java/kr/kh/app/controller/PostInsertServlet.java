package kr.kh.app.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/insert")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 10 * 3,
		fileSizeThreshold = 1024 * 1024
		
)

public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시판 전체 가져옴
		ArrayList<BoardVO> list = postService.getBoardList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user") ;
		int postBoardNum = Integer.parseInt(request.getParameter("board"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = user.getUserId();
		
		
		PostVO post = new PostVO(postBoardNum, title, content, writer);
		
		if(postService.insertPost(post)) {
			response.sendRedirect(request.getContextPath() + "/board/list");
		} else {
			response.sendRedirect(request.getContextPath() + "/board/insert");
		}
		
	}

}
