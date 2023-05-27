package dao.cart;

import model.Cart;
import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductCartDao {
    private Connection conn;

    public ProductCartDao() {
    }

    public ProductCartDao(Connection conn) {
        this.conn = conn;
    }

    public List<Cart> getCartItems(String sessionId) throws SQLException {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM case_study.cart WHERE case_study.cart.product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sessionId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("user_id");
                    int productId = rs.getInt("product_id");
                    int quantity = rs.getInt("quantity");
                    Timestamp timestamp = rs.getTimestamp("created_at");
//                    Products products = getProductById(productId);
                    Cart cartItem = new Cart(id, productId, quantity,timestamp);
                    cartItems.add(cartItem);
                }
            }
        }
        return cartItems;
    }

    public void addCartItem(String sessionId,int user_id, int productId, int quantity) throws SQLException {
        String sql = "INSERT INTO case_study.cart (user_id,product_id, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1,user_id);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setString(4, sessionId);
            stmt.executeUpdate();
        }
    }

    public void updateCartItemQuantity(int user_id, int productId, int quantity) throws SQLException {
        String sql = "UPDATE case_study.cart SET user_id = ?, product_id = ?, quantity = ? WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, user_id);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.executeUpdate();
        }
    }

    public void removeCartItem(int user_id) throws SQLException {
        String sql = "DELETE FROM case_study.cart WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, user_id);
            stmt.executeUpdate();
        }
    }

    private Products getProductById(int productId) throws SQLException {
        String sql = "SELECT * FROM case_study.products WHERE product_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("product_id");
                    String name = rs.getString("product_name");
                    int price1 = rs.getInt("price");
                    int quantity = rs.getInt("quantity_in_stock");
                    Products product = new Products(id, name, price1, quantity);
                    return product;
                } else {
                    return null;
                }
            }
        }
    }
}
