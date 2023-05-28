package controller;

import dao.UserDAO;
import model.Products;
import model.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletUser", value = "/view/listUser")
public class ServletUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
            listUsers(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String full_name = request.getParameter("full_name");
        Users newUser = new Users(username, password, phone, email, full_name);
        userDAO.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("user_id"));
        userDAO.deleteUser(id);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String full_name = request.getParameter("full_name");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        userDAO.updateInfoUser(full_name,birthday,email,phone,password,user_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/info.jsp");
        dispatcher.forward(request, response);
    }
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        Users existingUser = userDAO.selectUser(user_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/info.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }
}
