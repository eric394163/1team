package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.controller.MainServlet;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

//관리자페이지 - 신고게시판 서블릿
@WebServlet("/admin/boardReport") // jsp 파일명과 맞추기
public class BoardReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MainServlet.commonAsideInfo(request);
		int page;

		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}

		Criteria cri = new Criteria(page, 10);

		int reportedPostCount = postService.getReportedPostCount(cri);

		System.out.println("게시글수" + reportedPostCount);
		PageMaker pm = new PageMaker(10, cri, reportedPostCount);
		request.setAttribute("pm", pm);

		ArrayList<PostVO> list = postService.getReportedPostList(cri);
		System.out.println("리스트" + list);

		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/admin/boardReport.jsp").forward(request, response);

	}

}
