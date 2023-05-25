package dao;

import model.Categories;
import model.Products;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ProductDao {

    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM case_study.products";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO case_study.products ( product_id, product_name, price, description,supplier_id, category_id, quantity_in_stock, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String FIND_PRODUCT_BY_NAME = "SELECT * FROM case_study.products WHERE product_name = ?;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM case_study.products WHERE product_name = ?";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE case_study.products SET product_id = ?, product_name = ?, price = ?, description = ?, category_id = ?, quantity_in_stock = ?, created_at = ?" + "where product_id = ?;";


    // Danh sách tất cả sản phẩm
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
            preparedStatement.setString(2, products.getProduct_name());
            preparedStatement.setInt(3, products.getPrice());
            preparedStatement.setString(4, products.getDescription());
            preparedStatement.setInt(5, products.getSupplier_id());
            preparedStatement.setInt(6, products.getCategory_id());
            preparedStatement.setInt(7, products.getQuantity_in_stock());
            preparedStatement.setTimestamp(8, products.getCreated_at());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
        }
    }

    public boolean updateUser(Products products) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, products.getProduct_id());
            preparedStatement.setString(2, products.getProduct_name());
            preparedStatement.setInt(3, products.getPrice());
            preparedStatement.setString(4, products.getDescription());
            preparedStatement.setInt(5, products.getSupplier_id());
            preparedStatement.setInt(6, products.getCategory_id());
            preparedStatement.setInt(7, products.getQuantity_in_stock());
            preparedStatement.setTimestamp(8, products.getCreated_at());
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
                int category_id  = resultSet.getInt("category_id");
                String category_name = resultSet.getString("category_name");
                System.out.println("ID: " + category_id + ", category_name: " + category_name);
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
// tìm kiếm sản phẩm theo tên
      public Products findProducts(String name) {

          Products products = null;

          try (Connection connection = DatabaseConnector.getConnection();
               PreparedStatement statement = connection.prepareStatement(FIND_PRODUCT_BY_NAME)) {
              statement.setString(1, name);
              ResultSet resultSet = statement.executeQuery();
              if (resultSet.next()) {
                  int product_id = resultSet.getInt("product_id");
                  String product_name = resultSet.getString("product_name");
                  int price = resultSet.getInt("price");
                  String description = resultSet.getString("description");
                  int supplier_id = resultSet.getInt("supplier_id");
                  int category_id = resultSet.getInt("category_id");
                  int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                  Timestamp created_at = resultSet.getTimestamp("created_at");
                  products = new Products(product_id, product_name, price, description, supplier_id, category_id, quantity_in_stock, created_at);
              }
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return products;
      }
      //nhập sản phẩm từ file có sẵn
    public void insertProductFile(String filePath) throws SQLException, IOException {

        try (Connection connection = DatabaseConnector.getConnection();
             BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath));
             PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT_SQL);
        ){
            String line;
            while ((line = bufferedReader.readLine()) != null){
                String[] files = line.split(",");
                int product_id = Integer.parseInt(files[0]);
                String product_name = files[1];
                int price = Integer.parseInt(files[2]);
                String description = files[3];
                int supplier_id = Integer.parseInt(files[4]);
                int category_id = Integer.parseInt(files[5]);
                int quantity_in_stock = Integer.parseInt(files[6]);
                Timestamp created_at = Timestamp.valueOf(files[7]);
                statement.setInt(1,product_id);
                statement.setString(2,product_name);
                statement.setInt(3,price);
                statement.setString(4,description);
                statement.setInt(5,supplier_id);
                statement.setInt(6,category_id);
                statement.setInt(7,quantity_in_stock);
                statement.setTimestamp(8,created_at);
            }
        }
    }

}
