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
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;
import kr.kh.app.service.CommonService;
import kr.kh.app.service.CommonServiceImp;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();
	private CommonService commonService = new CommonServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		request.setAttribute("category", categoryList);//화면에 전송
		request.setAttribute("board", boardList);//화면에 전송
		//화면에서 보낸 게시글 번호를 가져옴
		int boNum;
		int page;
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		try {
			boNum = Integer.parseInt(request.getParameter("boNum"));
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println(boNum);
			System.out.println(page);
		}catch (Exception e) {
			boNum = 0;
			page = 1;
		}
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성 
		BoardListCriteria cri = new BoardListCriteria(page, 2, type, search, boNum);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<PostVO> list = boardService.getBoardList(cri);
		request.setAttribute("list", list);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(request, response);
	}
}
