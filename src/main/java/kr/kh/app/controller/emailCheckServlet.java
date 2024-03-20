package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/email/check")
public class emailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 가져옴
		String email = request.getParameter("email");
		//아이디 사용 가능한지 확인 요청
		String res = userService.checkEmail(email);
		
		//가능 여부에 따른 결과를 화면에 전송
		response.getWriter().write(res);
	}
}
