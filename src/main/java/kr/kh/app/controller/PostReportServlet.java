package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

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
import kr.kh.app.model.vo.ReportVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/report")
public class PostReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PostService postService = new PostServiceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserVO user = (UserVO) request.getSession().getAttribute("user");
        String user_id = user.getUser_id();
        // Get the form data
        int post_id = Integer.parseInt(request.getParameter("post_id"));
        String report_user_nickname = request.getParameter("report_user_nickname");
        String report_post_title = request.getParameter("report_post_title");
        String report_reason = request.getParameter("report_reason");
        String report_content = request.getParameter("report_content");

        String report_state = "접수";

        System.out.println("post_id: " + post_id);
        System.out.println("report_user_nickname: " + report_user_nickname);
        System.out.println("report_post_title: " + report_post_title);
        System.out.println("report_reason: " + report_reason);
        System.out.println("report_content: " + report_content);

        ReportVO report = new ReportVO(post_id, report_reason, report_content, report_state, user_id);

        boolean res = postService.reportPost(report);

        if (res) {
            postService.updateReportCount(post_id);

            // JSON 형식의 응답을 보냅니다.
            response.setContentType("application/json");
            response.getWriter().write("{\"message\": \"신고가 접수되었습니다.\"}");
        } else {
            // 처리에 실패했을 때는 HTTP 상태 코드를 변경합니다.
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\": \"신고 접수에 실패했습니다.\"}");
        }

    }

}