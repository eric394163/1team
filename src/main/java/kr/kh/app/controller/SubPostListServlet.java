package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;

import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.SubPostService;
import kr.kh.app.service.SubPostServiceImp;

@WebServlet("/post/sublist")
public class SubPostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubPostService subPostService = new SubPostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		MainServlet.aside(request);
		
		//게시판번호 : 주소표시줄에서 받아와야 함
		Integer board_id;
		try {
			board_id = Integer.parseInt(request.getParameter("boNum")); //클릭해서 넘어온 게시판, 예시가 공지사항이라 1
		}catch (Exception e) {
			board_id = 0;
			System.out.println("예외 싫어요.");
		}
		
		//현재 게시판번호와 맞는 게시판명 가져오기
		BoardVO board = subPostService.getSubBoard(board_id);
		
		//해당 게시판명
		request.setAttribute("board", board);
		
		//검색어와 검색 타입을 가져옴. 현재 페이지 정보도 가져옴
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성 
		Criteria cri = new Criteria(page, 2, type, search);
		
		
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
		int totalCount = subPostService.getSubTotalCount(cri, board_id); 
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		

		
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<BoardVO> list = subPostService.getSubBoardList(cri, board_id); 
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/post/subList.jsp").forward(request, response);
	}
}
