package kr.kh.app.controller.mypage;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

//마이페이지 - 나의 정보수정 서블릿
@WebServlet("/mypage/signupdate")
public class SignUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		UserVO user = (UserVO) httpServletRequest.getSession().getAttribute("user");
		
		//날짜를 문자열로 변환
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = user.getUser_birth();
		String dateToStr = dateFormat.format(date);
		request.setAttribute("dateToStr", dateToStr);// 화면에 전송
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/signUpdate.jsp").forward(request, response);
    }
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");

        SignUpDTO signUpDto = new SignUpDTO(id, pw, nickname, email, birth);
        try {
            if (userService.updateSignUp(signUpDto)) {
                //기존 기록이 남아 있으므로 기존 세션 삭제
                request.getSession().removeAttribute("user");
                //새로운 유저 정보 처리
                String new_id = request.getParameter("id");
        		String new_pw = request.getParameter("pw");
        		LoginDTO loginDTO = new LoginDTO(new_id, new_pw);
        		//새롭게 로그인
        		UserVO user = userService.login(loginDTO);
        		//다시 세션에 user정보 처리
        		HttpSession session = request.getSession();
        		session.setAttribute("user", user);// 세션에 user라는 이름으로 회원 정보를 저장
        		
        		request.setAttribute("msg", "회원정보수정 성공");
                request.setAttribute("url", "/mypage/signupdate");
  

            } else {
                request.setAttribute("msg", "회원정보수정 실패");
                request.setAttribute("url", "/mypage/signupdate");
            }
        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.setAttribute("url", "/mypage/signupdate");
        }

        request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
	}
}
