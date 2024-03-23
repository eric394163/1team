package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.BlockedCriteria;
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
    if (totalSearch == null || totalSearch.equals("")) {

      request.setAttribute("msg", "검색어가 없습니다.");
      request.setAttribute("url", "/");
      request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
    }

    int page;
    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
      page = 1;
    }

    String blocking_user_id = "";
    UserVO user = (UserVO) request.getSession().getAttribute("user");
    if (user != null) {
      String userId = user.getUser_id();
      blocking_user_id = userId;
    }

    Criteria cri = new BlockedCriteria(page, 10, totalSearch, blocking_user_id);

    // 검색된 게시글 전체 수
    int totalCount = postService.getTotalPostCount(cri);

    PageMaker pm = new PageMaker(5, cri, totalCount);

    request.setAttribute("pm", pm);

    ArrayList<PostVO> list = postService.getTotalSearchResultList(cri);

    request.setAttribute("list", list);

    request.getRequestDispatcher("/WEB-INF/views/main/searchList.jsp").forward(request, response);
  }

}
