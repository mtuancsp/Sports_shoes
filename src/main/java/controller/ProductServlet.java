package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/view/listProduct")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao;
    public void init(){
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            listProduct(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException{
        List<Products> listProduct = productDao.selectAllProduct();
        request.setAttribute("productList",listProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/testProducts.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showEditFrom(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException,SQLException{
     int product_id = Integer.parseInt(request.getParameter("product_id"));
     Products existingProducts = productDao.selectProducts(product_id);
     request.setAttribute("products",existingProducts);
     RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
     requestDispatcher.forward(request,response);

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException,SQLException{
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String product_name = request.getParameter("product_name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int quantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
        Timestamp created_at = Timestamp.valueOf(request.getParameter("created_at"));
        String image = request.getParameter("image");
        Products products = new Products(product_id,product_name,price,description,supplier_id,category_id,quantity_in_stock,created_at,image);
        productDao.updateUser(products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request,response);

    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException,SQLException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String product_name = request.getParameter("product_name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int quantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
        Timestamp created_at = Timestamp.valueOf(request.getParameter("created_at"));
        String image = request.getParameter("image");
        Products products = new Products(product_id,product_name,price,description,supplier_id,category_id,quantity_in_stock,created_at,image);
        productDao.insertUser(products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request,response);

    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
        int id = Integer.parseInt(request.getParameter("product_id"));
        productDao.deleteProduct(id);
        List<Products> products = productDao.selectAllProduct();
        request.setAttribute("products",products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request,response);
    }
// hiển thị chi tiết sản phẩm
    public void showProductsDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
         int productId = Integer.parseInt(request.getParameter("product_id"));
         ProductDao productDao = new ProductDao();
         productDao.productsDetails(productId);
         request.setAttribute("productDao",productDao);
         RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
         requestDispatcher.forward(request,response);
    }
    //





}
