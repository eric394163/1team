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

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImp();
	private CommonService commonService = new CommonServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		request.setAttribute("categoryList", categoryList);//화면에 전송
		request.setAttribute("boardList", boardList);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/topnav/findId.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		UserVO user = userService.getUser(email,birth);
		if(user == null) {
			request.setAttribute("msg", "등록된 정보가 없습니다.");
			request.setAttribute("url", "/findId");
		} else {
			request.setAttribute("msg", "아이디 : " + user.getUser_id());
			request.setAttribute("url", "/login");
		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}

}
