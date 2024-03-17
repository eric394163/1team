package kr.kh.app.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.kh.app.model.dto.SignUpDTO;
import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;
import kr.kh.app.utils.CheckErrAndMsg;

import java.io.IOException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    UserService userService = new UserServiceImp();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MainServlet.commonAsideInfo(request);
        request.getRequestDispatcher("/WEB-INF/views/topnav/signUp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");

        SignUpDTO signUpDto = new SignUpDTO(id, pw, nickname, email, birth);

        CheckErrAndMsg checkErrAndMsg = userService.signUp(signUpDto);

        System.out.println("checkErrAndMsg: " + checkErrAndMsg);

        if (checkErrAndMsg.isTrueOrFalse()) {
            request.setAttribute("msg", checkErrAndMsg.getMsg());
            request.setAttribute("url", "/");
        } else {
            request.setAttribute("msg", checkErrAndMsg.getMsg());
            request.setAttribute("url", "/signup");
        }
        // if (userService.signUp(signUpDto)) {

        // request.setAttribute("msg", "회원가입 성공");

        // request.setAttribute("url", "/");

        // } else {
        // request.setAttribute("msg", "회원가입 실패");

        // request.setAttribute("url", "/signup");
        // }

        request.getRequestDispatcher("/WEB-INF/views/common/message.jsp").forward(request, response);
    }
}