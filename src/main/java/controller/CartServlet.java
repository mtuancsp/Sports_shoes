package controller;

import dao.DatabaseConnector;
import dao.cart.ProductCartDao;
import dao.cart.ProductServiceDao;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    private ProductServiceDao productDAO;
    private ProductCartDao cartDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mydb";
            String username = "root";
            String password = "123456";
            Connection conn = DatabaseConnector.getConnection();
            productDAO = new ProductServiceDao(conn);
            cartDAO = new ProductCartDao(conn);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        try {
            List<Cart> cartItems = cartDAO.getCartItems(sessionId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        try {
            if ("addCart".equals(action)) {
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                int productId = Integer.parseInt(request.getParameter("product_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                cartDAO.addCartItem(sessionId,user_id, productId, quantity);
            } else if ("update".equals(action)) {
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                int productId = Integer.parseInt(request.getParameter("product_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.updateCartItemQuantity(user_id,productId,quantity);
            } else if ("delete".equals(action)) {
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                cartDAO.removeCartItem(user_id);
            }
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            productDAO = null;
            cartDAO = null;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }
