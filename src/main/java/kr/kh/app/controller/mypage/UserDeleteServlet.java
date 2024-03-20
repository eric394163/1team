package kr.kh.app.controller.mypage;

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

@WebServlet("/user/delete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		UserVO user = (UserVO) httpServletRequest.getSession().getAttribute("user");
		
		//유저이메일, 아이디 기록
		String user_id = user.getUser_id();
		String user_email = user.getUser_email();
		
		//해당유저 데이터 변경, UUID를 통한 아이디,비번,닉넴으로 변경, 상태변경
		String uuid = UUID.randomUUID().toString().substring(0, 11);
		
		//혹시나 동일한 uuid가 들어가는 것을 방지 : id와 이메일은 중복X
		while(true) {
			if(user.getUser_id().equals(uuid)) {
				uuid = UUID.randomUUID().toString().substring(0, 11);
			}else {
				break;
			}
		}
		//상태가 변화는 오늘 날짜
		Date today = new Date();
		
		UserVO dropUser = new UserVO(uuid, uuid, user_email, today, "탈퇴중");
		
		if(userService.updateDropUser(dropUser, user_id)) {
			request.getSession().removeAttribute("user");
			request.setAttribute("msg", "PlayGround를 회원탈퇴하였습니다.");
            request.setAttribute("url", "");
		}else {
			request.setAttribute("msg", "PlayGround를 회원탈퇴하지 못했습니다.");
            request.setAttribute("url", "");
		}
		
		//탈퇴메시지처리
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}

}
