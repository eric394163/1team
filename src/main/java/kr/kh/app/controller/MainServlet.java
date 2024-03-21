package kr.kh.app.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.DateCriteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.CommonService;
import kr.kh.app.service.CommonServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CommonService commonService = new CommonServiceImp();
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page;

		LocalDate today = LocalDate.now(); 
		LocalDate tomorrow = today.plusDays(1);

		LocalDate weekAgo = today.minusDays(8);


		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		
	

		Criteria cri = new Criteria(page, 10);

		int totalCount = postService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);

		commonAsideInfo(request);
		ArrayList<PostVO> list = postService.getTotalPostList(cri);
		request.setAttribute("list", list);

		// 조회수가 높은 게시글 리스트
		Criteria popularViewCri = new DateCriteria( page, 10, tomorrow, weekAgo);

		ArrayList<PostVO> popularViewPostList = postService.getPopularViewPostList(popularViewCri);


		request.setAttribute("popularViewPostList", popularViewPostList);

		// 좋아요가 높은 게시글 리스트
		Criteria popularLikeCri = new DateCriteria(page, 10, tomorrow, weekAgo);

		ArrayList<PostVO> popularLikePostList = postService.getPopularLikePostList(popularLikeCri);

		request.setAttribute("popularLikePostList", popularLikePostList);

		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}

	public static void commonAsideInfo(HttpServletRequest request) {
		// 파라미터 받기
		Integer boNum;
		try {
			boNum = Integer.parseInt(request.getParameter("boNum"));
		} catch (Exception e) {
			boNum = 0;
		}

		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		request.setAttribute("categoryList", categoryList);// 화면에 전송
		request.setAttribute("boardList", boardList);// 화면에 전송
		request.setAttribute("boNum", boNum);// 화면에 전송

	}
}