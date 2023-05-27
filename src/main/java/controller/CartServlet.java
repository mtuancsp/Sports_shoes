package controller;

import dao.DatabaseConnector;
import dao.cart.ProductCartDao;
import dao.cart.ProductServiceDao;
import model.Cart;
import model.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/view/cart")
public class CartServlet extends HttpServlet {
    private ProductServiceDao productDAO ;
    private ProductCartDao cartDAO = new ProductCartDao();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("message", "Please login first");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            int user_id = user.getUser_id();
            List<Cart> cartItems = cartDAO.getCartItems(user_id);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
