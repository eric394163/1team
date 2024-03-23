package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainServlet.commonAsideInfo(request);
		int num;
		
		try {			
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		
		//게시글을 작성하고 게시글 상세페이지로 이동 했을때 목록보기를 누르면 아무 값도 안 들어가서 게시글리스트가 제대로 안 나옴

		postService.updatePostView(num);
		
		PostVO post = postService.getPost(num);
		request.setAttribute("post", post); 

		int boNum = post.getPost_board_num();
		request.setAttribute("boNum", boNum); // 게시판 번호

		
		ArrayList<AttachVO> fileList = postService.getFile(num); 
		request.setAttribute("fileList", fileList);
		
		AttachVO link = postService.getLink(num);
		request.setAttribute("link", link);
		
		//page정보 파라미터에서 받아오기 // 페이지정보는 string 이여서 int로 변환하고 넘겨줘야함 그냥 넘기면 아무것도 안 나옴
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(request, response);
	}


}
