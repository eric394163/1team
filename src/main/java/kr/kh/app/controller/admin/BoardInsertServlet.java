package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

//관리자페이지 - 게시판 수정/삭제 서블릿
@WebServlet("/admin/boardupdate")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();
	private BoardService boardService = new BoardServiceImp();
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList(); //카테고리 리스트 불러오기
		request.setAttribute("categoryList", categoryList);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/views/admin/boardUpdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ca_num = 1;
		try {
			ca_num = Integer.parseInt(request.getParameter("category_id"));
    	}catch (Exception e) {
    		e.printStackTrace();
    		ca_num = 1;
		}
		ArrayList<BoardVO> list = boardService.getCaBoardList(ca_num);
		JSONObject jobj = new JSONObject();
		jobj.put("list", list);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}
}
