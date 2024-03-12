package kr.kh.app.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.service.UserService;
import kr.kh.app.service.UserServiceImp;

import java.io.IOException;

@WebServlet("/searchList")
public class TotalPostSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    UserService userService = new UserServiceImp();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/main/searchList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}