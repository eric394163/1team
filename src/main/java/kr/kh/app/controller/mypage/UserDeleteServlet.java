package kr.kh.app.controller.mypage;

import java.io.IOException;
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
		String user_email = user.getUser_email();
		
		//해당유저의 댓글 모두 삭제
		userService.deleteCommentByUser(user);
		
		//해당유저의 게시글 모두 삭제
		
		//해당유저 데이터 변경, UUID를 통한 아이디,비번,닉넴으로 변경, 상태변경
		
		//메인페이지로 이동
	}

}
