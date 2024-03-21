package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

//관리자페이지 - 카테고리 등록 서블릿
@WebServlet("/admin/categoryinsert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList(); //카테고리 리스트 불러오기
		request.setAttribute("categoryList", categoryList);//화면에 전송
		
		request.getRequestDispatcher("/WEB-INF/views/admin/categoryInsert.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String category_name = request.getParameter("category");
		
		CategoryVO category = new CategoryVO(category_name);
		
		try {
			boolean res = categoryService.insertCategory(category);
			if(res) {
				request.setAttribute("msg", "카테고리 등록을 성공하였습니다.");
	            request.setAttribute("url", "/admin/categoryinsert");
			}else {
				request.setAttribute("msg", "카테고리 등록을 성공하지 못했습니다.");
	            request.setAttribute("url", "admin/categoryinsert");
			}
		}catch (Exception e) {
			String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.setAttribute("url", "/admin/categoryinsert");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
