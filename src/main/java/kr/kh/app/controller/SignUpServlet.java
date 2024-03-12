package kr.kh.app.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

import java.io.IOException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    UserService userService = new UserServiceImp();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MainServlet.aside(request);
        request.getRequestDispatcher("/WEB-INF/views/topnav/signUp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");

        System.out.println(id + " " + pw + " " + nickname + " " + email + " " + birth);

        SignUpDTO signUpDto = new SignUpDTO(id, pw, nickname, email, birth);

        if (userService.signUp(signUpDto)) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            System.out.println("회원가입 실패");
            doGet(request, response);
        }
    }
}