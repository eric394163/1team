package kr.kh.app.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;

//마이페이지 - 좋아요 누른 게시글 확인 서블릿
@WebServlet("/mypage/postlist")
public class MyLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		String search = user.getUser_id();
		String type = "mypage";
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성 
		Criteria cri = new Criteria(page, 3, type, search);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<PostVO> myList = boardService.getBoardList(cri);
		request.setAttribute("myList", myList);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/mypage/myPostList.jsp").forward(request, response);
	}
}
