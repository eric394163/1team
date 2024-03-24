package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.controller.MainServlet;
import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.ReportVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.ReportCriteria;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

//관리자페이지 - 신고게시판 서블릿
@WebServlet("/admin/boardReportedList") // jsp 파일명과 맞추기
public class BoardReportedListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PostService postService = new PostServiceImp();
    private UserService userService = new UserServiceImp();

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

        PostVO post = postService.getPost(reportedPostId);

        Criteria cri = new ReportCriteria(page, 10, reportedPostId);

        int postReportedListCount = postService.getPostReportedListCount(cri);

        PageMaker pm = new PageMaker(10, cri, postReportedListCount);

        ArrayList<ReportVO> reportedList = postService.getPostReportedList(cri);
        
        //글쓴이 정보
  		UserVO writer = userService.getUser(post.getPost_user_id());
  		request.setAttribute("writer", writer);
  		
  		//파일번호
		int num;
		
		try {			
			num = Integer.parseInt(request.getParameter("reportedPostId"));
		} catch (Exception e) {
			num = 0;
		}
  		
  		//파일링크관련
		ArrayList<AttachVO> fileList = postService.getFile(num);
		request.setAttribute("fileList", fileList);
		
		AttachVO link = postService.getLink(num);
		request.setAttribute("link", link);
  		

        request.setAttribute("pm", pm); // 페이징 정보
        request.setAttribute("post", post); // 게시글 정보
        request.setAttribute("reportedList", reportedList); // 해당 게시글의 신고 정보
        request.getRequestDispatcher("/WEB-INF/views/admin/boardReportedList.jsp").forward(request, response);

    }

}
