package dao;

import model.Cart;
import model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CartDAO {
    private static final String SELECT_ALL_CART = "select * from cart where user_id=?;";
    private static final String ADD_PRODUCT_TO_CART ="insert into cart(user_id, product_id, quantity) values (?,?,?);";
    public List<Cart> selectAllCart() throws SQLException{
        List<Cart> carts = new ArrayList<>();
        try(Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CART)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int user_id = resultSet.getInt("user_id");
                int product_id = resultSet.getInt("product_id");
                int quantity = resultSet.getInt("quantity");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                carts.add(new Cart(user_id,product_id,quantity,created_at));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return carts;
    }
    public void addProductToCart(Cart cart) throws SQLException{
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_PRODUCT_TO_CART)) {
            preparedStatement.setString(1, cart.getUser_id());
            preparedStatement.setString(2, cart.getProduct_id());
            preparedStatement.setString(3, cart.getQuantity());
            preparedStatement.setString(4, cart.getCreated_at());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
    }
}