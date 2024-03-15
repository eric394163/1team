package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/totalSearchList")
public class TotalSearchList extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private PostService postService = new PostServiceImp();

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  MainServlet.commonAsideInfo(request);
	  
    String totalSearch = request.getParameter("totalsearch");

    System.out.println("total :" + totalSearch);
    int page;

    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
      page = 1;
    }

    Criteria cri = new Criteria(page, 10, totalSearch);

    // 검색된 게시글 전체 수
    int totalCount = postService.getTotalPostCount(cri);

    System.out.println("total count : " + totalCount);

    PageMaker pm = new PageMaker(5, cri, totalCount);

    request.setAttribute("pm", pm);

    ArrayList<PostVO> list = postService.getTotalSearchResultList(cri);
    request.setAttribute("list", list);

    System.out.println(list.size());

    request.getRequestDispatcher("/WEB-INF/views/main/searchList.jsp").forward(request, response);
  }

}
