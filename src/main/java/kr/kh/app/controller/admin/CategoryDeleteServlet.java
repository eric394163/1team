package kr.kh.app.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

//관리자페이지 - 카테고리 수정/삭제 서블릿
@WebServlet("/admin/categorydelete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String category_name = request.getParameter("categoryName");
		CategoryVO category = new CategoryVO(category_name);
		System.out.println(category);
		
		boolean res = categoryService.deleteCategory(category);
		
		if(res) {
			request.setAttribute("msg", "카테고리 삭제를 성공하였습니다.");
            request.setAttribute("url", "/admin/categoryupdate");
		}else {
			request.setAttribute("msg", "카테고리 삭제를 실패하였습니다.");
            request.setAttribute("url", "/admin/categoryupdate");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
