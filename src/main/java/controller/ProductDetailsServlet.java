package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDetailsServlet", value = "/view/product_detail")
public class ProductDetailsServlet extends HttpServlet {
    ProductDao productDAO = new ProductDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        Products product = productDAO.findProductById(productID);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/view/products-details.jsp").forward(request, response);
    }

}
