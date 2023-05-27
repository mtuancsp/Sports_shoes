package controller;

import dao.UserDAO;
import model.Users;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/test")
public class UserServlet extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
      listUsers(request,response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
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
        Users newUser = new Users(username,password,phone,email,full_name,"customer");
        userDAO.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
        dispatcher.forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,SQLException,IOException{
        String userName = request.getParameter("user_name");
        Users existingUser = userDAO.selectUser(userName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("webapp/editUser.jsp");
        request.setAttribute("existingUser", existingUser);
        requestDispatcher.forward(request,response);
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,SQLException,IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String full_name = request.getParameter("full_name");
        Users user = new Users(username,password,phone,email,full_name,"customer");
        userDAO.updateUser(user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("webapp/editUser.jsp");
        requestDispatcher.forward(request,response);
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,SQLException,IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        List<Users> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("webapp/deleteUser.jsp");
        dispatcher.forward(request, response);
    }
}

