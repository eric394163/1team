package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/admin/userplay")
public class UserPlayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserServiceImp();
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String play_user_id = request.getParameter("playdUserId");

		// 유효성 검사: blockedUserId가 null이거나 빈 문자열인지 검사
		if (play_user_id == null || play_user_id.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
			response.getWriter().write("Invalid user ID");
			return;
		}
		
		//상태가 변화는 오늘 날짜
		Date today = new Date();

		UserVO updateUser = new UserVO(play_user_id, today);

		// 차단 해제 처리
		boolean isplayed = userService.updateUserByUserState2(updateUser);

		// 처리 결과에 따른 응답
		if (isplayed) {
			response.setStatus(HttpServletResponse.SC_OK); // 200 OK
			response.getWriter().write("정지해제 처리 성공");
		} else {
			// 차단 해제 실패 시, 적절한 응답 코드 및 메시지 설정
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
			response.getWriter().write("정지해제 처리 실패");
		}

	}
}
