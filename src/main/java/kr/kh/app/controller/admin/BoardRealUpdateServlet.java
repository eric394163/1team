package kr.kh.app.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/board/update")
public class BoardRealUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("board_id"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
