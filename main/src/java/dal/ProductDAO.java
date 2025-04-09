/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.Constant;
import models.Products;
import java.util.List;
import java.util.Random;

public class ProductDAO extends DBContext {

    public List<Products> findAll() {
        List<Products> list = new java.util.ArrayList<>();
        String sql = "select * from Products where stockQuantity > 0";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public List<Products> findAll3() {
        List<Products> list = new java.util.ArrayList<>();
        String sql = "select * from Products";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Products> findAll2() {
        List<Products> list = new java.util.ArrayList<>();
        String sql = "select * from Products where stockQuantity > 0";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Products> findByCategory(int categoryId) {
        String sql = "SELECT * FROM Products WHERE typeID = ? AND stockQuantity > 0";
        List<Products> list = new java.util.ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Products> findByProperty(String property, Object value) {
        String sql = "select * from Products \n"
                + " where " + property + "= ? and stockQuantity > 0";
        List<Products> list = new java.util.ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setObject(1, value);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public static void main(String[] args) {
        for (Products product : new ProductDAO().findAll()) {
            System.out.println(product);
        }
        System.out.println("=================");
        System.out.println(new ProductDAO().findByProperty("productID", 1));
    }

    public int insert(Products products) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([typeID]\n"
                + "           ,[productName]\n"
                + "           ,[price]\n"
                + "           ,[stockQuantity]\n"
                + "           ,[image])\n"
                + "     VALUES\n"
                + "           (?, ?, ? ,? , ?)";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, products.getTypeID());
            statement.setString(2, products.getProductName());
            statement.setInt(3, products.getPrice());
            statement.setInt(4, products.getStockQuantity());
            statement.setString(5, products.getImage());
            return statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return -1;
    }

    public List<Products> findContainsByProperty(String property, String keyword) {
        String sql = "select * from Products \n"
                + "where " + property + " like ? and stockQuantity > 0";
        List<Products> list = new java.util.ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<Products> findByPage(int page) {
        String sql = "select * from Products where stockQuantity > 0\n"
                + "order by productID\n"
                + "offset ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        List<Products> list = new java.util.ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, (page - 1) * Constant.RECORD_PER_PAGE);
            statement.setInt(2, Constant.RECORD_PER_PAGE);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public int findTotalRecord() {
        String sql = "select count(*) from Products where stockQuantity > 0";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
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

    public void deleteById(int productID) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE productID = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, productID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
    }

    public void updateproduct(Products products) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [typeID] =?\n"
                + "      ,[image] = ?\n"
                + "      ,[stockQuantity] = ?\n"
                + "      ,[productName] = ?\n"
                + "      ,[price] = ?\n"
                + " WHERE productID = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, products.getTypeID());
            statement.setString(2, products.getImage());
            statement.setInt(3, products.getStockQuantity());
            statement.setString(4, products.getProductName());
            statement.setInt(5, products.getPrice());
            statement.setInt(6, products.getProductID());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

    }

    public List<Products> findByMinMaxPrice(float minPrice, float maxPrice, int page) {
        String sql = "SELECT *\n"
                + "  FROM [AssPRJ].[dbo].[Products]\n"
                + "  where [price] BETWEEN ? and ?\n";

        List<Products> list = new java.util.ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setFloat(1, minPrice);
            statement.setFloat(2, maxPrice);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products products = new Products();
                products.setProductID(resultSet.getInt("productID"));
                products.setTypeID(resultSet.getInt("typeID"));
                products.setProductName(resultSet.getString("productName"));
                products.setPrice(resultSet.getInt("price"));
                products.setStockQuantity(resultSet.getInt("stockQuantity"));
                products.setImage(resultSet.getString("image"));
                list.add(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public void updateQuantity(int productId, int quantity) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET \n"
                + "      [stockQuantity] = [stockQuantity] - ?\n"
                + " WHERE productID = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setInt(2, productId);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
    }

    public List<Products> getRandomProducts(int count) {
        List<Products> allProducts = findAll();
        Random random = new Random();
        List<Products> randomProducts = new java.util.ArrayList<>();
        for (int i = 0; i < count && i < allProducts.size(); i++) {
            int randomIndex = random.nextInt(allProducts.size());
            randomProducts.add(allProducts.get(randomIndex));
            allProducts.remove(randomIndex);
        }
        return randomProducts;
    }


}
