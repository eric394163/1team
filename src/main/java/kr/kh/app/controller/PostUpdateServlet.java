package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/update")
@MultipartConfig (
		maxFileSize = 1024 * 1024 * 10,	// 10Mb
		maxRequestSize = 1024 * 1024 * 10 * 3,	// 10Mb 최대 3개
		fileSizeThreshold = 1024 * 1024 	// 1Mb : 파일 업로드 시 메모리에 저장되는 임시 파일 크기
)

public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num;	
		
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch(Exception e) {
			num = 0;
		}
		
		PostVO post = postService.getPost(num);
		request.setAttribute("post", post);
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		
		if(post == null || user == null || !post.getPost_user_id().equals(user.getUser_id())) {
			request.setAttribute("msg", "작성자가 아닙니다.");
			request.setAttribute("url", "post/detail?num="+num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		ArrayList<AttachVO> fileList = postService.getFile(num);
		request.setAttribute("fileList", fileList);
		
		ArrayList<BoardVO> list = postService.getBoardList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		
		int num, board;
		
		try {
			num = Integer.parseInt(request.getParameter("num"));
			board = Integer.parseInt(request.getParameter("board"));
		} catch(Exception e) {
			num = 0;
			board = 0;
		}
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostVO post = new PostVO(num, title, content, board);
		
		ArrayList<Part> fileList = (ArrayList<Part>)request.getParts();
		
		String numsStr [] = request.getParameterValues("fi_num");
		ArrayList<Integer> nums = new ArrayList<Integer>();
		
		if (numsStr != null) {
			for (String numStr : numsStr) {
				try {
					int fi_num = Integer.parseInt(numStr);
					nums.add(fi_num);
				} catch (Exception e) {

				}
			}
		}
		
		boolean res = postService.updateBoard(board, user, nums, fileList);
		
		if(res) {
			request.setAttribute("msg", "게시글을 수정했습니다.");
		}
		else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "post/detail?num="+num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}

}
