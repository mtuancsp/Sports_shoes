package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "Servlet", value = "/view/home")
public class HomeServlet extends HttpServlet {
    ProductDao productDAO = new ProductDao();
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Products> listProduct = productDAO.selectAllProduct();
//        listProduct.sort(Comparator.comparing(Products::getCreated_at));
//        List<Products> last8ProductList = new ArrayList<>(listProduct.subList(0, Math.min(8, listProduct.size())));
//        request.setAttribute("last8ProductList", last8ProductList);
//        request.getRequestDispatcher("/view/index.jsp").forward(request, response);
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> productList = productDAO.selectAllProduct();
        List<Products> featuredProductList = productDAO.getFeaturedProduct();

        request.setAttribute("productList", productList);
        request.setAttribute("featuredProductList", featuredProductList);
        request.getRequestDispatcher("/view/index.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
