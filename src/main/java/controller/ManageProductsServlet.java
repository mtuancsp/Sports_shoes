package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageProductsServlet", value = "/view/manageProducts")
public class ManageProductsServlet extends HttpServlet {
    ProductDao productDao = new ProductDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/view/login");
            return;
        }

        // Số sản phẩm hiển thị trên mỗi trang
        int productsPerPage = 4;

        // Trang hiện tại (mặc định là trang đầu tiên)
        int currentPage = 1;

        // Kiểm tra xem nếu truyền tham số trang từ request thì sử dụng giá trị đó
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Lấy tổng số sản phẩm
        int totalProducts = productDao.getNumberOfProducts();

        // Tính toán tổng số trang
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        // Lấy danh sách sản phẩm trên trang hiện tại
        List<Products> products = productDao.getProductsByPage(currentPage, productsPerPage);

        // Gửi thông tin trang và danh sách sản phẩm tới JSP
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("productList", products);

        // Chuyển tiếp request tới JSP
        request.getRequestDispatcher("/view/manageProducts.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
