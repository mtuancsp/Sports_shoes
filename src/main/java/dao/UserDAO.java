package dao;

import model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO {
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_BY_ID = "delete from users where user_id = ?;";
    private static final String FIND_USER_BY_PHONE = "select user_id,full_name,email,phone,birthday from users where phone =?";
    private static final String SORT_BY_NAME = "select * from users order by username;";
    private static final String SORT_BY_CREATE_AT = "select * from users order by created_at;";
    private static final String INSERT_USERS_SQL = "insert into users(username,password,phone,email,full_name) values  (?,?,?,?,?);";
    private static final String UPDATE_INFO_USER = "update users set full_name = ?,birthday=?,email=?,phone=?,password=? where user_id = ?;";
    private static final String SELECT_USER_BY_ID = "select full_name,birthday,email,phone,password from users where id =?";
    public void insertUser(Users user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getFull_name());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
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
    public boolean deleteUser(int id) throws SQLException{
        boolean rowDeleted;
        try( Connection connection = DatabaseConnector.getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_USERS_BY_ID)) {
            statement.setInt(1,id);
            System.out.println(statement);
            rowDeleted = statement.executeUpdate()>0;
        }return rowDeleted;
    }
    public List<Users> sortByName() throws SQLException{
        List<Users> users = new ArrayList<>();
        try(Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(SORT_BY_NAME)) {
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
    public List<Users> sortByCreateAt() throws SQLException{
        List<Users> users = new ArrayList<>();
        try(Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(SORT_BY_CREATE_AT)) {
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
    public Users findUserByPhone(){
        Users user;
        try( Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_USER_BY_PHONE)) {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
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
                user = new Users(user_id,username,password,phone,email,role,full_name,birthday,avatar_path,created_at,status);

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }return user;
    }
    public void updateInfoUser(String full_name,String birthday,String email,String phone,String password,int user_id){

        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_INFO_USER)) {
            preparedStatement.setString(1, full_name);
            preparedStatement.setString(2, birthday);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, phone);
            preparedStatement.setString(5, password);
            preparedStatement.setInt(6,user_id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Users selectUser(int id) {
        Users user = null;
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String full_name = rs.getString("full_name");
                String birthday = rs.getString("birthday");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                user = new Users(full_name, birthday, email, phone,password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
