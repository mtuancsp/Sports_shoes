package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao;
    public void init(){
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException{
        List<Products> listProduct = productDao.selectAllProduct();
        request.setAttribute("products",listProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request,response);
    }
    private void showEditFrom(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException,SQLException{
      String product_name = request.getParameter("product_name");



    }


}
