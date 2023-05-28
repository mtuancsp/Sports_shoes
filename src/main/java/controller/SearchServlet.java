package controller;

import dao.ProductDao;
import model.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/view/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String search = request.getParameter("search");
        ProductDao productDao = new ProductDao();
        List<Products> products;

        if(search == null) {
            products = productDao.selectAllProduct();
        } else {
            products = productDao.findProducts(search);
        }
        PrintWriter out = response.getWriter();
        for (int i = 0; i < products.size(); i++) {
            Products product = products.get(i);
            int loopIndex = i;
            String displayStyle = (loopIndex < 4) ? "block" : "none";

            String html = "<div class=\"col-4 product\" style=\"display: " + displayStyle + ";\">\n" +
                    "  <a href=\"/view/product_detail?id=" + product.getProduct_id() + "\"><img src=\"" + product.getImage() + "\"></a>\n" +
                    "  <a href=\"/view/product_detail?id=" + product.getProduct_id() + "\"><h4>" + product.getProduct_name() + "</h4></a>\n" +
                    "  <div class=\"rating\">\n" +
                    "    <i class=\"fa fa-star\"></i>\n" +
                    "    <i class=\"fa fa-star\"></i>\n" +
                    "    <i class=\"fa fa-star\"></i>\n" +
                    "    <i class=\"fa fa-star-half-o\"></i>\n" +
                    "    <i class=\"fa fa-star-o\"></i>\n" +
                    "  </div>\n" +
                    "  <p>$" + product.getPrice() + "</p>\n" +
                    "</div>";

            out.println(html);
        }
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
