package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailsServlet", value = "/view/product_detail")
public class ProductDetailsServlet extends HttpServlet {
    ProductDao productDAO = new ProductDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("id"));
        Products product = productDAO.findProductById(productID);
        List<String> productImgList = productDAO.getProductImgByID(productID);
        List<Products> relatedProductList = productDAO.getProductByCategory(product.getCategory());
        request.setAttribute("product", product);
        request.setAttribute("productImgList", productImgList);
        request.setAttribute("relatedProductList", relatedProductList);
        request.getRequestDispatcher("/view/products-details.jsp").forward(request, response);
    }

}
