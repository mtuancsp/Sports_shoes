package controller;

import dao.UserDAO;
import model.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/view/login")
public class LoginServlet extends HttpServlet {
    UserDAO userDAO = new UserDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("account.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Users> users = userDAO.selectAllUsers();
        for (Users user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("index.jsp");
                return;
            }
        }
        String message = "Invalid username or password";
        request.setAttribute("message", message);
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

}
