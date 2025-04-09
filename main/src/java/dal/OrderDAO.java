/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import models.Order;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    public List<Order> findAll() {
        String sql = "SELECT *\n"
                + "  FROM [Order]";
        List<Order> list = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setId(resultSet.getInt("id"));
                order.setAmount(resultSet.getInt("amount"));
                order.setCreateAt(resultSet.getTimestamp("createAt"));
                order.setAccountId(resultSet.getInt("accountId"));
                list.add(order);
            }
        } catch (Exception e) {
            System.err.println("Loi o find all: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return list;
    }

    public int insert(Order t) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([amount]\n"
                + "           ,[accountId])\n"
                + "     VALUES\n"
                + "           (?, ? )";
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setObject(1, t.getAmount());
            statement.setObject(2, t.getAccountId());
            // Thực thi câu truy vấn
            statement.executeUpdate();

            // Lấy khóa chính (ID) được tạo tự động
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return -1;
    }

    public List<Order> findsByAccountId(int id) {
        String sql = "SELECT *\n"
                + "  FROM [Order]\n"
                + "  where accountId = ?";
        List<Order> list = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            statement = connection.prepareStatement(sql);
            statement.setObject(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setId(resultSet.getInt("id"));
                order.setAmount(resultSet.getInt("amount"));
                order.setCreateAt(resultSet.getTimestamp("createAt"));
                order.setAccountId(resultSet.getInt("accountId"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Double> getTotalRevenueByMonth(int year) {
        List<Double> totalRevenueByMonth = new ArrayList<>();
        for (int month = 1; month <= 12; month++) {
            String sql = "SELECT SUM(o.amount) AS TotalRevenue\n" + "FROM [dbo].[Order] o\n" + "WHERE MONTH(o.createAt) = ? AND YEAR(o.createAt) = ?";
            try {
                connection = new DBContext().getConnection();
                statement = connection.prepareStatement(sql);
                statement.setInt(1, month);
                statement.setInt(2, year);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    totalRevenueByMonth.add(resultSet.getDouble("TotalRevenue"));
                } else {
                    totalRevenueByMonth.add(0.0);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                closeConnection();
            }
        }
        return totalRevenueByMonth;
    }
    
    public static void main(String[] args) {
        System.out.println(new OrderDAO().getTotalRevenueByMonth(2024));
    }
}
