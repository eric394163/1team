package kr.kh.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import kr.kh.app.model.vo.UserVO;

@WebFilter({
		"/admin/categoryinsert", "/admin/categoryupdate", "/admin/boardinsert", "/admin/boardupdate",
		"/admin/boardReport1", "/admin/postdelete", "/admin/usermanage", "/admin/userblock"
})
public class AdminFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		UserVO user = (UserVO) httpServletRequest.getSession().getAttribute("user");

		if (user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "/login");
			request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
			return;
		}

		if (user != null && user.getUser_role() == "사용자") {
			request.setAttribute("msg", "관리자/운영자만 접속할 수 있는 서비스입니다.");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
			return;
		}

		chain.doFilter(request, response);
	}
}
