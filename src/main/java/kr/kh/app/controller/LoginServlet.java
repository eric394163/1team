package kr.kh.app.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.CommonService;
import kr.kh.app.service.CommonServiceImp;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    UserService userService = new UserServiceImp();
    private CommonService commonService = new CommonServiceImp();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	MainServlet.commonAsideInfo(request);
        request.getRequestDispatcher("/WEB-INF/views/topnav/login.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginDTO loginDTO = new LoginDTO(id, pw);
		UserVO user = userService.login(loginDTO);

		if (user != null) {
			// 세션에 회원 정보를 저장하여 로그인 유지
			String nickname = user.getUser_nickname();
			HttpSession session = request.getSession();// request에 있는 세션을 가져옴
			session.setAttribute("user", user);// 세션에 user라는 이름으로 회원 정보를 저장
			session.setAttribute("passConfirm", "0");// 회원정보 수정에서만 쓰는 세션

			request.setAttribute("msg", "로그인 성공");
			// 화면에 url로 board/list를 전송
			request.setAttribute("url", "/");

		} else {

			request.setAttribute("msg", "로그인 실패");
			// 화면에 url로 board/list를 전송
			request.setAttribute("url", "login");

		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}