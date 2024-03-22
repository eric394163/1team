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
import kr.kh.app.model.vo.ReportVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.ReportCriteria;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

//관리자페이지 - 신고게시판 서블릿
@WebServlet("/admin/boardReportedList") // jsp 파일명과 맞추기
public class BoardReportedListServlet extends HttpServlet {
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

        int reportedPostId = Integer.parseInt(request.getParameter("reportedPostId"));

        System.out.println("신고된 게시글 번호" + reportedPostId);

        PostVO post = postService.getPost(reportedPostId);

        System.out.println("게시글 정보" + post);

        Criteria cri = new ReportCriteria(page, 10, reportedPostId);

        System.out.println("페이지 정보" + cri);

        int postReportedListCount = postService.getPostReportedListCount(cri);

        System.out.println("신고 수 " + postReportedListCount);

        PageMaker pm = new PageMaker(10, cri, postReportedListCount);

        ArrayList<ReportVO> reportedList = postService.getPostReportedList(cri);

        System.out.println("리스트" + reportedList);
        System.out.println("게시글" + post);

        request.setAttribute("pm", pm); // 페이징 정보
        request.setAttribute("post", post); // 게시글 정보
        request.setAttribute("reportedList", reportedList); // 해당 게시글의 신고 정보
        request.getRequestDispatcher("/WEB-INF/views/admin/boardReportedList.jsp").forward(request, response);

    }

}
