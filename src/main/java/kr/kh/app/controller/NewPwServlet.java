package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.CommonService;
import kr.kh.app.service.CommonServiceImp;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

@WebServlet("/newPw")
public class NewPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImp();
	private CommonService commonService = new CommonServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		request.setAttribute("category", categoryList);//화면에 전송
		request.setAttribute("board", boardList);//화면에 전송
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		request.getRequestDispatcher("/WEB-INF/views/topnav/newPw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		
		UserVO user = userService.getUser(id);
		if(user == null) {
			request.setAttribute("msg", "등록된 아이디가 없습니다.");
			request.setAttribute("url", "/findPw");
		} else if(!pw.equals(pw2)) {
			request.setAttribute("msg", "비밀번호와 비밀번호확인이 다릅니다");
			request.setAttribute("url", "/findPw");
		}
		user.setUser_pw(pw);
		boolean res = userService.updateUserPw(user);
		if(!res) {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.setAttribute("url", "/findPw");
		}else {
			request.setAttribute("msg", "비밀번호가 변경되었습니다.");
			request.setAttribute("url", "/login");
		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}

}
