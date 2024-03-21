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
@WebServlet("/admin/categorydelete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		String category_num = request.getParameter("categoryNum");
		
		CategoryVO category = new CategoryVO(category_num);
		
		//boolean res = categoryService.deleteCategory();
	}
}
