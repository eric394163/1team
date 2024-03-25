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
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/report")
public class PostReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Get the form data
        String post_id = request.getParameter("post_id");
        String report_user_nickname = request.getParameter("report_user_nickname");
        String report_post_title = request.getParameter("report_post_title");
        String report_reason = request.getParameter("report_reason");
        String report_content = request.getParameter("report_content");


		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
		
	}

}