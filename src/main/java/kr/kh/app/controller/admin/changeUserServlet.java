package kr.kh.app.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/admin/changeuser")
public class changeUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String change_user = request.getParameter("changeUser");
		
		if(change_user == null || change_user.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Invalid user ID");
			return;
		}
		
		UserVO updateUser = new UserVO(change_user);
		
		boolean changeUser = userService.updateUserByUserRoleOpToUser(updateUser);
		
		if(changeUser) {
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("사용자로 권한 변경");
		} else {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("사용자로 권한 변경 실패");
		}
	}

}
