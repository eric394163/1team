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
import kr.kh.app.service.CommonService;
import kr.kh.app.service.CommonServiceImp;


@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CommonService commonService = new CommonServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		aside(request);
		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}
	
	
	public static void aside(HttpServletRequest request) {
		ArrayList<CategoryVO> categoryList = commonService.getCategoryList();
		ArrayList<BoardVO> boardList = commonService.getBoardList();
		
		//카테고리 별 배열 처리
		int[] counts = new int[categoryList.size()];
		
		//카테고리별 개수를 구하기
		for(int i=0;i<categoryList.size();i++) {
			for(int j=0;j<boardList.size();j++) {
				if(categoryList.get(i).getCategory_id() == boardList.get(j).getBoard_category_num()) {
					counts[i]++;
				}
			}
		}
					
		request.setAttribute("category", categoryList);//화면에 전송
		request.setAttribute("board", boardList);//화면에 전송
		request.setAttribute("counts", counts);//화면에 전송
	}

}
