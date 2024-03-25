package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/insert")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 10 * 3, fileSizeThreshold = 1024 * 1024

)

public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MainServlet.commonAsideInfo(request);
		// 게시판 전체 가져옴
		ArrayList<BoardVO> list = postService.getBoardList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("user");

		int post_board_num = Integer.parseInt(request.getParameter("board"));
		String post_title = request.getParameter("title");
		String post_content = request.getParameter("content");
		String post_user_id = user.getUser_id();
		Date post_date = new Date();

		PostVO post = new PostVO(post_board_num, post_title, post_content, post_user_id, post_date);

		// 첨부파일 가져오기
		ArrayList<Part> partList = (ArrayList<Part>) request.getParts();
		
		int post_id = post.getPost_id();
		// 주소 가져오기
		String link = request.getParameter("link");
		AttachVO attach = new AttachVO(post_id, link);

		// 서비스에게 게시글 객체를 주면서 등록하라고 시킴

		if (postService.insertPost(post, partList, attach)) {
			response.sendRedirect(request.getContextPath() + "/post/detail?num=" + post.getPost_id());
		} else {
			response.sendRedirect(request.getContextPath() + "/post/insert");
		}

	}

}