package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import models.OrderDetails;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class OrderDetailsDAO extends DBContext {
//
//    public List<OrderDetails> findAll() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    public int insert(OrderDetails t) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([quantity]\n"
                + "           ,[productId]\n"
                + "           ,[orderId])\n"
                + "     VALUES\n"
                + "           (?, ? , ?)";
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            statement.setObject(1, t.getQuantity());
            statement.setObject(2, t.getProductId());
            statement.setObject(3, t.getOrderId());
            return statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return -1;
    }

    public List<OrderDetails> findByOrderId(int orderId) {
        String sql = "SELECT *\n"
                + "  FROM [AssPRJ].[dbo].[OrderDetails]\n"
                + "  where [orderId] = ?";
        List<OrderDetails> list = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            statement.setObject(1, orderId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setId(resultSet.getInt("id"));
                orderDetails.setQuantity(resultSet.getInt("quantity"));
                orderDetails.setProductId(resultSet.getInt("productId"));
                orderDetails.setOrderId(resultSet.getInt("orderId"));
                list.add(orderDetails);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }
}
