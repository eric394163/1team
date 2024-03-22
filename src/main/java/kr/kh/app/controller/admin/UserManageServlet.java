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

//관리자페이지 - 운영자 관리 서블릿
@WebServlet("/admin/usermanage")
public class UserManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Cri 추가 추후에
		int page;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) {
			page = 1;
		}
		Criteria cri = new Criteria(page, 10);
		
		int totalCount = userService.getTotalUserCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		
		
		ArrayList<UserVO> list = userService.getTotalUserList(cri);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/userManage.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] user_id = request.getParameterValues("authory-user-id");
		String [] user_role = request.getParameterValues("authory-user-role");
		
		// user_id 받아오는지 확인
		for (int i = 0 ; i < user_id.length; i++){
			System.out.println(user_id[i]);
		}	
		
		// user_role 받아오는지 확인
				for (int i = 0 ; i < user_role.length; i++){
					System.out.println(user_role[i]);
				}		
		
//		UserVO user = new UserVO(user_id, user_role);
	}
}
