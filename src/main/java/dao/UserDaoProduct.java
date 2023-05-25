package dao;

import model.Categories;
import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static javax.swing.text.html.HTML.Tag.SELECT;

public class UserDaoProduct {

    private static final String SELECT_ALL_PRODUCT = "select * from case_study.products";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO case_study.products ( product_id, product_name, price, description, user_id, category_id, quantity_in_stock, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "select product_id,product_name, price, description, user_id, category_id, quantityInStock, created_at from products where product_id = ?;";
    private static final String DELETE_PRODUCT_SQL = "delete from case_study.products where product_id = ?";
    private static final String UPDATE_PRODUCT_SQL = "update case_study.products set product_id = ?, product_name = ?, price = ?, description = ?, user_id = ?, category_id = ?, quantity_in_stock = ?, created_at = ?" + "where product_id = ?;";;

    public List<Products> selectAllProduct() {
        List<Products> products = new ArrayList<Products>();
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PRODUCT))
        {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                int supplier_id = resultSet.getInt("supplier_id");
                int category_id = resultSet.getInt("category_id");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                products.add((new Products(product_id,product_name,price,description,supplier_id,category_id,quantity_in_stock,created_at)));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    public void insertUser(Products products) throws SQLException {
        System.out.println(INSERT_PRODUCT_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setInt(1, products.getProduct_id());
            preparedStatement.setString(1, products.getProduct_name());
            preparedStatement.setInt(1, products.getPrice());
            preparedStatement.setString(1, products.getDescription());
            preparedStatement.setInt(1, products.getUser_id());
            preparedStatement.setInt(1, products.getCategory_id());
            preparedStatement.setInt(1, products.getQuantity_in_stock());
            preparedStatement.setTimestamp(1, products.getCreated_at());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
        }
    }

    public boolean updateUser(Products products) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);) {
            preparedStatement.setInt(1, products.getProduct_id());
            preparedStatement.setString(1, products.getProduct_name());
            preparedStatement.setInt(1, products.getPrice());
            preparedStatement.setString(1, products.getDescription());
            preparedStatement.setInt(1, products.getUser_id());
            preparedStatement.setInt(1, products.getCategory_id());
            preparedStatement.setInt(1, products.getQuantity_in_stock());
            preparedStatement.setTimestamp(1, products.getCreated_at());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteProduct(int product_id) throws SQLException{
        boolean rowDeleted;
        try (Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL);
        ){
          statement.setInt(1,product_id);
          rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
// danh sách nhóm san phẩm
    public List<Categories> getProductsGroups(){
        List<Categories> products =   new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            String sql = "SELECT * FROM case_study.categories ";
            connection = DatabaseConnector.getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()){
                int product_id = resultSet.getInt("product_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try{
            if( statement != null )
                if( resultSet != null)
                    statement.close();
            if(connection != null)
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();}
        }
       return products;
    }



}
