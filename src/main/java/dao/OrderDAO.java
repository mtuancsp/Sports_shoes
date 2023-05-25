package dao;

import model.Orders;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private static final String SEE_ALL_ORDER = "select * from orders ;";
    private static final String Find_ORDER_BY_USER ="select * from orders where user_id =?;";
    public List<Orders> seeAllOrder(){
        List<Orders> orders = new ArrayList<>();
        try(Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(SEE_ALL_ORDER)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int order_id = resultSet.getInt("order_id");
                Timestamp order_date = resultSet.getTimestamp("order_date");
                Timestamp shipped_date = resultSet.getTimestamp("shipped_date");
                String status = resultSet.getString("status");
                String comment = resultSet.getString("comment");
                int user_id = resultSet.getInt("user_id");
                orders.add(new Orders(order_id,order_date,shipped_date,status,comment,user_id));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return orders;
    }

}
