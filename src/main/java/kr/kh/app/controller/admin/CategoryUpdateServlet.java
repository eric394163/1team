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

//관리자페이지 - 카테고리 수정/삭제 서블릿
@WebServlet("/admin/categoryupdate")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList(); //카테고리 리스트 불러오기
		request.setAttribute("categoryList", categoryList);//화면에 전송
		
		request.getRequestDispatcher("/WEB-INF/views/admin/categoryUpdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//수정한 카테고리 이름 받기
		String category_name = request.getParameter("category_name");
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		CategoryVO category = new CategoryVO(category_id, category_name);
		System.out.println(category);
		
		try {
			boolean res = categoryService.updateCategory(category);
			if(res) {
				request.setAttribute("msg", "카테고리 수정을 성공하였습니다.");
	            request.setAttribute("url", "/admin/categoryupdate");
			}else {
				request.setAttribute("msg", "카테고리 수정을 성공하지 못했습니다.");
	            request.setAttribute("url", "/admin/categoryupdate");
			}
		}catch (Exception e) {
			String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.setAttribute("url", "/admin/categoryupdate");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
