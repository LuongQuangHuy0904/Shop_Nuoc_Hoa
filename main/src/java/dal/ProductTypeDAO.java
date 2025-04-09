/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import models.ProductTypes;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductTypeDAO extends DBContext {

    public List<ProductTypes> findAll() {
        String sql = "SELECT * FROM ProductTypes";
        List<ProductTypes> list = new ArrayList<>();
        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductTypes category = new ProductTypes();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public int insert(ProductTypes t) {
        connection = new DBContext().getConnection();
        try {
            String sql = "INSERT INTO [dbo].[ProductTypes]\n"
                    + "           ([name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setObject(1, t.getName());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return 1;
    }

    public void deleteById(int id) {
        connection = new DBContext().getConnection();
        try {
            String sql = "DELETE FROM [dbo].[ProductTypes]\n"
                    + "      WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setObject(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void update(ProductTypes category) {
        connection = new DBContext().getConnection();
        try {
            String sql = "UPDATE [dbo].[ProductTypes]\n"
                    + "   SET [name] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setObject(1, category.getName());
            statement.setObject(2, category.getId());
            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
