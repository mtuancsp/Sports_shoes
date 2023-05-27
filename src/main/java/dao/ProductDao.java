package dao;

import model.Products;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProductDao {
    private static final String SELECT_ALL_PRODUCT = "SELECT * FROM case_study.products";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO case_study.products ( product_id, product_name, price, description,supplier, category, quantity_in_stock, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM case_study.products WHERE product_id = ?";
    private static final String FIND_PRODUCT_BY_NAME = "SELECT * FROM case_study.products WHERE product_name = ?;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM case_study.products WHERE product_name = ?";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE case_study.products SET product_id = ?, product_name = ?, price = ?, description = ?, category = ?, quantity_in_stock = ?, created_at = ?" + "where product_id = ?;";
    private static final String SHOW_PRODUCT_DETAILS = "SELECT * FROM case_study.products WHERE product_id = ?";
    private static final String SEARCH_THE_FILTER = "SELECT * FROM case_study.products WHERE product_name LIKE ? AND price >= ? AND price <= ?";
    private static final String GET_PRODUCT_IMG_BY_ID = "SELECT * FROM case_study.product_images WHERE product_id = ?";
    private static final String GET_PRODUCT_BY_CATEGORY = "SELECT * FROM case_study.products WHERE category = ?";
    private static final String GET_FEATURED_PRODUCT = "SELECT * FROM case_study.products ORDER BY quantity_in_stock DESC LIMIT 4; ";

    public static void main(String[] args) {
        ProductDao productDAO = new ProductDao();
        List<Products> list = productDAO.getFeaturedProduct();
        System.out.println(list);
    }

    public List<Products> getFeaturedProduct() {
        List<Products> products = new ArrayList<>();
        try (Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_FEATURED_PRODUCT))
        {
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier");
                String category = resultSet.getString("category");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products.add(new Products(product_id, product_name, price, description, supplier, category, quantity_in_stock, created_at, image));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }
    public List<Products> getProductByCategory(String cate) {
        List<Products> products = new ArrayList<>();
        try (Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_PRODUCT_BY_CATEGORY))
        {
            statement.setString(1, cate);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier");
                String category = resultSet.getString("category");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products.add(new Products(product_id, product_name, price, description, supplier, category, quantity_in_stock, created_at, image));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;

    }

    public List<String> getProductImgByID(int id) {
        List<String> productImgList = new ArrayList<>();
        try (Connection connection = DatabaseConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_PRODUCT_IMG_BY_ID))
        {
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                productImgList.add(resultSet.getString("image_path"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return productImgList;
    }

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
                String supplier = resultSet.getString("supplier");
                String category = resultSet.getString("category");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products.add((new Products(product_id,product_name,price,description,supplier,category,quantity_in_stock,created_at,image)));
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
            preparedStatement.setString(5, products.getSupplier());
            preparedStatement.setString(6, products.getCategory());
            preparedStatement.setInt(7, products.getQuantity_in_stock());
            preparedStatement.setTimestamp(8, products.getCreated_at());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
        }
    }

    public boolean updateProduct(Products products) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DatabaseConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, products.getProduct_id());
            preparedStatement.setString(2, products.getProduct_name());
            preparedStatement.setInt(3, products.getPrice());
            preparedStatement.setString(4, products.getDescription());
            preparedStatement.setString(5, products.getSupplier());
            preparedStatement.setString(6, products.getCategory());
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

// tìm kiếm sản phẩm theo tên
      public Products findProducts(String name) {

          Products products = null;

          try (Connection connection = DatabaseConnector.getConnection();
               PreparedStatement statement = connection.prepareStatement(FIND_PRODUCT_BY_NAME)) {
              statement.setString(1, "%" + name + "%");
              ResultSet resultSet = statement.executeQuery();
              if (resultSet.next()) {
                  int product_id = resultSet.getInt("product_id");
                  String product_name = resultSet.getString("product_name");
                  int price = resultSet.getInt("price");
                  String description = resultSet.getString("description");
                  String supplier = resultSet.getString("supplier");
                  String category = resultSet.getString("category");
                  int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                  Timestamp created_at = resultSet.getTimestamp("created_at");
                  String image = resultSet.getString("image");
                  products = new Products(product_id, product_name, price, description, supplier, category, quantity_in_stock, created_at, image);
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

    public Products findProductById(int productID) throws SQLException {
        Products products = null;
        Connection connection = DatabaseConnector.getConnection();

        try (
                PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
                ){
            statement.setInt(1,productID);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier");
                String category = resultSet.getString("category");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products = new Products(product_id,product_name,price,description,supplier,category,quantity_in_stock,created_at,image);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }
    // hiển thị chi tiết sản phẩm theo
    public Products productsDetails(int productID){
        Products products = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            connection = DatabaseConnector.getConnection();
            statement = connection.prepareStatement(SHOW_PRODUCT_DETAILS);
            statement.setInt(1,productID);
            resultSet = statement.executeQuery();
            if (resultSet.next()){
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier_id");
                String category = resultSet.getString("category_id");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products = new Products(product_id,product_name,price,description,supplier,category,quantity_in_stock,created_at,image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    // tìm kiếm sản phẩm theo bộ lọc
    public List<Products> getProductsByFilter(String keyword, double minPrice, double maxPrice){
        List<Products> products = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DatabaseConnector.getConnection();
            preparedStatement = connection.prepareStatement(SEARCH_THE_FILTER);
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setDouble(2,minPrice);
            preparedStatement.setDouble(3,maxPrice);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int product_id = resultSet.getInt("product_id");
                String product_name = resultSet.getString("product_name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier_id");
                String category = resultSet.getString("category_id");
                int quantity_in_stock = resultSet.getInt("quantity_in_stock");
                Timestamp created_at = resultSet.getTimestamp("created_at");
                String image = resultSet.getString("image");
                products.add((new Products(product_id,product_name,price,description,supplier,category,quantity_in_stock,created_at,image)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null)
                    connection.close();
                if (preparedStatement != null)
                    preparedStatement.close();
                if (resultSet != null)
                    resultSet.close();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }
    // phân trang
    public List<Products> getPageOfProducts(int page, int pageSize) throws SQLException {
        List<Products> products = new ArrayList<>();
        // Tính toán offset dựa trên số trang và kích thước trang
        int offset = (page - 1) * pageSize;
        Connection connection = DatabaseConnector.getConnection();
        String sql = "SELECT * FROM products LIMIT ? OFFSET ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, pageSize);
        statement.setInt(2, offset);
        // Thực thi câu lệnh SQL và lấy dữ liệu từ ResultSet
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int product_id = resultSet.getInt("product_id");
            String product_name = resultSet.getString("product_name");
            int price = resultSet.getInt("price");
            String description = resultSet.getString("description");
            String supplier = resultSet.getString("supplier");
            String category = resultSet.getString("category");
            int quantity_in_stock = resultSet.getInt("quantity_in_stock");
            Timestamp created_at = resultSet.getTimestamp("created_at");
            String image = resultSet.getString("image");
            products.add((new Products(product_id,product_name,price,description,supplier,category,quantity_in_stock,created_at,image)));
        }
        resultSet.close();
        statement.close();

        return products;
    }

}
