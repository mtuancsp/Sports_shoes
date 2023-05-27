package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/view/listProduct")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao;

    public void init() {
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
        String action = request.getParameter("action");
        if(action == null){
            action  = "";
        }
        try {
            switch (action){
                case "create":
                    showNewFrom(request, response);
                    break;
                case "edit":
                    showEditFrom(request, response);
                     break;
                case "delete":
                      deleteProduct(request, response);
                      break;
                case "update":
                     updateProduct(request, response);
                      break;
                default:
                       listProduct(request, response);
                       break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        try{
            switch (action){
                case "create":
                    insertProduct(request, response);
                    break;
                case "edit":
                    updateProduct(request, response);
                    break;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }


    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Products> listProduct = productDao.selectAllProduct();
        request.setAttribute("productList", listProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/testProducts.jsp");
        requestDispatcher.forward(request, response);
    }
    private void showNewFrom(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);
    }
    private void showEditFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        Products existingProducts = productDao.selectProducts(product_id);
        request.setAttribute("products", existingProducts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String product_name = request.getParameter("product_name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        String category = request.getParameter("category");
        int quantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
        Timestamp created_at = Timestamp.valueOf(request.getParameter("created_at"));
        String image = request.getParameter("image");
        Products products = new Products(product_id, product_name, price, description, supplier, category, quantity_in_stock, created_at, image);
        productDao.updateProduct(products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);

    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String product_name = request.getParameter("product_name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        String category = request.getParameter("category");
        int quantity_in_stock = Integer.parseInt(request.getParameter("quantity_in_stock"));
        Timestamp created_at = Timestamp.valueOf(request.getParameter("created_at"));
        String image = request.getParameter("image");
        Products products = new Products(product_id, product_name, price, description, supplier, category, quantity_in_stock, created_at, image);
        productDao.insertUser(products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("product_id"));
        productDao.deleteProduct(id);
        List<Products> products = productDao.selectAllProduct();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);
    }

    // hiển thị chi tiết sản phẩm
    public void showProductsDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        productDao.productsDetails(productId);
        request.setAttribute("productDao", productDao);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
        requestDispatcher.forward(request, response);
    }

    //hiển thị theo bộ lọc
    public void ProductsByFilter(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String keyword = request.getParameter("keyword");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        double minPrice = minPriceStr != null && !minPriceStr.isEmpty() ? Double.parseDouble(minPriceStr) : 0;
        double maxPrice = maxPriceStr != null && !maxPriceStr.isEmpty() ? Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;
        List<Products> productList = productDao.getProductsByFilter(keyword, minPrice, maxPrice);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }

    // phân loại theo trang
    public void pageOfProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        int page = Integer.parseInt(request.getParameter("page"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        try {
            List<Products> products = productDao.getPageOfProducts(page, pageSize);
            request.setAttribute("products", products);

            RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // nhập sản phẩm bằng file
    public void productFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String filePath = request.getParameter("filePath");

        // Thêm sản phẩm từ file vào cơ sở dữ liệu
        try {
            productDao.insertProductFile(filePath);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        response.sendRedirect(request.getContextPath() + "/products");
    }
    // tìm kiếm sản phẩm theo tù khóa nhập vào
    public void findProductKey(HttpServletRequest request, HttpServletResponse response) throws ServletException,SQLException,IOException{
        String searchKeyword = request.getParameter("name");

        // Tìm kiếm sản phẩm
        try {
            List<Products> products = (List<Products>) productDao.findProducts(searchKeyword);
            request.setAttribute("products", products);
            request.getRequestDispatcher("").forward(request, response);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    }



