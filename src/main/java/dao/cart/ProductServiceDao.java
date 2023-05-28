package dao.cart;

import dao.DatabaseConnector;
import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceDao {
    private Connection conn;

    public ProductServiceDao(Connection conn) {
        this.conn = conn;
    }

//    public  List<Products> getAllProducts() throws SQLException {
//        List<Products> listProducts = new ArrayList<>();
//        String sql = "SELECT * FROM case_study.products";
//        try (Statement stmt = conn.createStatement();
//             ResultSet rs = stmt.executeQuery(sql)) {
//            while (rs.next()) {
//                int productId = rs.getInt("product_id");
//                String productName = rs.getString("product_name");
//                int price = rs.getInt("price");
//                int quantity = rs.getInt("quantity_in_stock");
//                Products products = new Products(productId, productName, price, quantity);
//                listProducts.add(products);
//            }
//        }
//        catch (SQLException e){
//            e.printStackTrace();
//        }
//        return listProducts;
//    }
//    public static Products getProductById(int productId){
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        Products product = null;
//        try{
//            conn = DatabaseConnector.getConnection();
//            String sql = "SELECT * FROM case_study.products WHERE product_id = ?";
//            stmt = conn.prepareStatement(sql);
//            stmt.setInt(1, productId);
//            rs = stmt.executeQuery();
//            if(rs.next()){
//                String productName = rs.getString("product_name");
//                int price = rs.getInt("price");
//                int quantity = rs.getInt("quantity");
//                 product =  new Products(productId,productName,price,quantity);
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        } finally {
//            try{
//                conn.close();
//                stmt.close();
//                rs.close();
//            } catch (SQLException e){
//                e.printStackTrace();
//            }
//        }
//        return product;
//    }

}
