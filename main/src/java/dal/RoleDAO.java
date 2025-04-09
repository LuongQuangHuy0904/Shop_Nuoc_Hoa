/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import models.Role;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class RoleDAO extends DBContext {

    public List<Role> findAll() {
        String sql = "SELECT *\n"
                + "  FROM [Role]";
        List<Role> list = new ArrayList<>();                
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Role role = new Role();
                role.setId(resultSet.getInt("id"));
                role.setName(resultSet.getString("name"));
                list.add(role);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeConnection();
        }
        return list;
    }

    public static void main(String[] args) {
        RoleDAO roleDAO = new RoleDAO();
        List<Role> list = roleDAO.findAll();
        for (Role role : list) {
            System.out.println(role);
        }
    }
}
