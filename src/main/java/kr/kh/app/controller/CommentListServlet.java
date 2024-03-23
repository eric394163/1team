package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.CommentCriteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/comment/list")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    private UserService userService = new UserServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		int post_num = 0;
		try {
			page = Integer.parseInt(request.getParameter("page"));
			post_num = Integer.parseInt(request.getParameter("post_num"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		CommentCriteria cri = new CommentCriteria(page, 2, post_num);
		//현재 페이지에 맞는 댓글을 가져오라고 시킴
		ArrayList<CommentVO> list = postService.getCommentList(cri);
		ArrayList<CommentVO> totalList = postService.getTotalCommentList(post_num);
				
		//작성자 정보를 담을 배열
		ArrayList<UserVO> writerList = new ArrayList<UserVO>(); 
		
		for(CommentVO tmp : list) {
			writerList.add(userService.getUser(tmp.getComment_user_id()));
		}
		

		//전체 댓글 수 (현재 게시글에 대한)
		int totalCount = postService.getTotalCountComment(cri);
		
		
		//페이지네이션 생성
		PageMaker pm = new PageMaker(5, cri, totalCount);
		JSONObject jobj = new JSONObject();
		
		ObjectMapper om = new ObjectMapper();
		String pmStr = "";
		try {
			pmStr = om.writeValueAsString(pm);
		}catch(Exception e) {
			e.printStackTrace();
		}
		jobj.put("list", list);
		jobj.put("pm", pmStr);
		jobj.put("total", totalList.size());
		jobj.put("writerList", writerList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
