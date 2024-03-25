package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

//관리자페이지 - 게시판 등록 서블릿
@WebServlet("/admin/boardinsert")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
	private BoardService boardService = new BoardServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList(); //카테고리 리스트 불러오기
		request.setAttribute("categoryList", categoryList);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/admin/boardInsert.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int ca_num = Integer.parseInt(request.getParameter("category"));
		String board_name = request.getParameter("board");
		
		BoardVO board = new BoardVO(ca_num, board_name);
		
		try {
			boolean res = boardService.insertBoard(board);
			if(res) {
				request.setAttribute("msg", "게시판 추가에 성공하였습니다.");
	            request.setAttribute("url", "/admin/boardinsert");
			}else {
				request.setAttribute("msg", "게시판 추가를 하지 못했습니당.");
	            request.setAttribute("url", "/admin/boardinsert");
			}
		}catch (Exception e) {
			String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.setAttribute("url", "/admin/boardinsert");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
