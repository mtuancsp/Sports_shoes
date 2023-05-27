package dao.cart;

import dao.DatabaseConnector;
import dao.ProductDao;
import model.Cart;
import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductCartDao {
    ProductDao productDAO = new ProductDao();

    public ProductCartDao(){
    }

    public static void main(String[] args) throws SQLException {
            ProductCartDao productCartDao = new ProductCartDao();
            List<Cart> cartItems = productCartDao.getCartItems(1);
            System.out.println(cartItems);
    }

    public List<Cart> getCartItems(int id){
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM case_study.cart WHERE case_study.cart.user_id = ? ORDER BY case_study.cart.created_at DESC";
        try (Connection conn = DatabaseConnector.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                int product_id = rs.getInt("product_id");
                Products product = productDAO.findProductById(product_id);
                cart.setProduct(product);
                cart.setQuantity(rs.getInt("quantity"));
                cartItems.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

//    public void addCartItem(String sessionId,int user_id, int productId, int quantity) throws SQLException {
//        String sql = "INSERT INTO case_study.cart (user_id,product_id, quantity) VALUES (?, ?, ?)";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setInt(1,user_id);
//            stmt.setInt(2, productId);
//            stmt.setInt(3, quantity);
//            stmt.setString(4, sessionId);
//            stmt.executeUpdate();
//        }
//    }
//
//    public void updateCartItemQuantity(int user_id, int productId, int quantity) throws SQLException {
//        String sql = "UPDATE case_study.cart SET user_id = ?, product_id = ?, quantity = ? WHERE user_id = ?";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setInt(1, user_id);
//            stmt.setInt(2, productId);
//            stmt.setInt(3, quantity);
//            stmt.executeUpdate();
//        }
//    }
//
//    public void removeCartItem(int user_id) throws SQLException {
//        String sql = "DELETE FROM case_study.cart WHERE user_id = ?";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setInt(1, user_id);
//            stmt.executeUpdate();
//        }
//    }
//
//    private Products getProductById(int productId) throws SQLException {
//        String sql = "SELECT * FROM case_study.products WHERE product_id = ?";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setInt(1, productId);
//            try (ResultSet rs = stmt.executeQuery()) {
//                if (rs.next()) {
//                    int id = rs.getInt("product_id");
//                    String name = rs.getString("product_name");
//                    int price1 = rs.getInt("price");
//                    int quantity = rs.getInt("quantity_in_stock");
//                    Products product = new Products(id, name, price1, quantity);
//                    return product;
//                } else {
//                    return null;
//                }
//            }
//        }
//    }
}
