package controller;

import dao.UserDAO;
import model.Users;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/test")
public class HelloServlet extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        listUsers(request, response);
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }

}