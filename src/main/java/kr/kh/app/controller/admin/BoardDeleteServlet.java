package kr.kh.app.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;

@WebServlet("/admin/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_id = 0;
		try {
			board_id = Integer.parseInt(request.getParameter("board_id"));
		}catch (Exception e) {
			e.printStackTrace();
			board_id = 0;
		}
		BoardVO board = boardService.getSubBoard(board_id);
		
		if(board == null) {
			request.setAttribute("msg", "이미 삭제했거나 존재하지 않는 게시판 입니다.");
            request.setAttribute("url", "/admin/boardupdate");
            request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
            return;
		}
		
		boolean res = boardService.deleteBoard(board_id);
		response.getWriter().write(res?"ok":"");
	}

}
