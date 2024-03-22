package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

//관리자페이지 - 회원 탈퇴 서블릿
@WebServlet("/admin/userblock")
public class UserBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색어와 검색 타입을 가져옴. 현재 페이지 정보도 가져옴
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		

		Criteria cri = new Criteria(page, 10, type, search);

		int totalCount = userService.getTotalCount(cri);
		
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		
		ArrayList<UserVO> userList = userService.getUserList(cri); //user 리스트 불러오기
		request.setAttribute("userList", userList);//화면에 전송
	
		request.getRequestDispatcher("/WEB-INF/views/admin/userBlock.jsp").forward(request, response);
	}
}
