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

@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImp();
	private CommonService commonService = new CommonServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		request.setAttribute("categoryList", categoryList);//화면에 전송
		request.setAttribute("boardList", boardList);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/topnav/findPw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		UserVO user = userService.getUser(id);
		if(user == null) {
			request.setAttribute("msg", "등록된 아이디가 없습니다.");
			request.setAttribute("url", "/findPw");
		} else if(!email.equals(user.getUser_email()) || !birth.equals(user.transDate())) {
			request.setAttribute("msg", "입력한 정보가 등록된 정보와 다릅니다.");
			request.setAttribute("url", "/findPw");
		} else {
			request.setAttribute("msg", "새 비밀번호를 설정해주세요.");
			request.setAttribute("url", "/newPw?id=" + id);
		}
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}

}
