package dao;

import model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO {
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String INSERT_USERS_SQL = "INSERT INTO users (username,password,phone, email,full_name,birthday) VALUES (?, ?, ?, ?, ?, ?);";
    public UserDAO() {
    }
    public List<Users> selectAllUsers(){
        List<Users> users = new ArrayList<>();
        try(Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int user_id = resultSet.getInt("user_id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                String full_name = resultSet.getString("full_name");
                Date birthday = resultSet.getDate("birthday");
                String avatar_path = resultSet.getString("avatar_path");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String status = resultSet.getString("status");
               users.add(new Users(user_id,username,password,phone,email,role,full_name,birthday,avatar_path,created_at,status));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }return users;
    }


}
