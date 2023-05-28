package controller;

import dao.UserDAO;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/view/changeAvatar")
@MultipartConfig
public class ChangeAvatarServlet extends HttpServlet {
    UserDAO userDAO = new UserDAO();

    public static void main(String[] args) {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("avatar");
        String avatarPath = "images/" + getFileName(filePart);

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int user_id = user.getUser_id();

        userDAO.updateAvatar(avatarPath, user_id);

        user.setAvatar_path(avatarPath);
        request.setAttribute("user", user);

        request.setAttribute("message", "Change avatar successfully");
        request.getRequestDispatcher("/view/info.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
