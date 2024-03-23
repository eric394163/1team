package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/admin/userdrop")
public class UserDropServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserServiceImp();
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		UserVO user = (UserVO) httpServletRequest.getSession().getAttribute("user");
		
		
		String user_drop_id = request.getParameter("userDropId");
		String user_email = user.getUser_email();

		// 유효성 검사: blockedUserId가 null이거나 빈 문자열인지 검사
		if (user_drop_id == null || user_drop_id.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
			response.getWriter().write("Invalid user ID");
			return;
		}
		
		//해당유저 데이터 변경, UUID를 통한 아이디,비번,닉넴으로 변경, 상태변경
		String uuid = UUID.randomUUID().toString().substring(0, 11);
		
		//혹시나 동일한 uuid가 들어가는 것을 방지 : id와 이메일은 중복X
		while(true) {
			if(user_drop_id.equals(uuid)) {
				uuid = UUID.randomUUID().toString().substring(0, 11);
			}else {
				break;
			}
		}
		
		//상태가 변화는 오늘 날짜
		Date today = new Date();

		UserVO dropUser = new UserVO(uuid, uuid, user_email, today, "탈퇴중");
				
		if(userService.updateDropUser(dropUser, user_drop_id)) {
			request.setAttribute("msg", "PlayGround에서 강퇴시켰습니다.");
            request.setAttribute("url", "/admin/userblock");
		}else {
			request.setAttribute("msg", "PlayGround에서 강퇴시키지 못했습니다.");
            request.setAttribute("url", "/admin/userblock");
		}
		
		//탈퇴메시지처리
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
