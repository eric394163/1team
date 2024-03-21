package kr.kh.app.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/mypage/Unblock")
public class Unblock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/mypage/myBlockedList.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 ID를 요청에서 받아옴
		UserVO user = (UserVO) request.getSession().getAttribute("user");

		String blocking_user_id = user.getUser_id();

		String blocked_user_id = request.getParameter("blockedUserId");

		// 유효성 검사: blockedUserId가 null이거나 빈 문자열인지 검사
		if (blocked_user_id == null || blocked_user_id.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
			response.getWriter().write("Invalid user ID");
			return;
		}

		BlockedVO blocked = new BlockedVO(blocking_user_id, blocked_user_id);

		// 차단 해제 처리
		boolean isUnblocked = userService.unblockUser(blocked);

		System.out.println("isUnblocked: " + isUnblocked);

		// 처리 결과에 따른 응답
		if (isUnblocked) {
			response.setStatus(HttpServletResponse.SC_OK); // 200 OK
			response.getWriter().write("차단 해제 성공");
		} else {
			// 차단 해제 실패 시, 적절한 응답 코드 및 메시지 설정
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
			response.getWriter().write("차단 해제 실패");
		}

	}
}
