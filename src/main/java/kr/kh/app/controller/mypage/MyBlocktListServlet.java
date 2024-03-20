package kr.kh.app.controller.mypage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.BlockedCriteria;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

//마이페이지 - 내가 차단한 목록보기 서블릿
@WebServlet("/mypage/blocklist")
public class MyBlocktListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// private int blocked_id;
		// private String blocking_user_id; 에 로그인한 사용자 아이디
		// private String blocked_user_id; 는 로그인 한 사용자가 차단한 사용자 아이디

		UserVO user = (UserVO) session.getAttribute("user");

		String blocking_user_id = user.getUser_id();

		int page;

		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}

		Criteria cri = new BlockedCriteria(page, 5, blocking_user_id);

		int totalCount = userService.getTotalBlockedUserCount(cri);

		ArrayList<BlockedVO> list = userService.getBlockedUserList(cri);

		request.setAttribute("list", list);

		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);

		request.getRequestDispatcher("/WEB-INF/views/mypage/myBlockedList.jsp").forward(request, response);

	}
}
