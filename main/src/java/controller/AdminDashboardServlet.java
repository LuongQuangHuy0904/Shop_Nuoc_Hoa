/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import models.ProductTypes;
import dal.ProductDAO;
import dal.ProductTypeDAO;
import models.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;


@MultipartConfig
public class AdminDashboardServlet extends HttpServlet {

    ProductDAO productDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        ProductTypeDAO productTypeDAO = new ProductTypeDAO();
        //tạo ra session
        HttpSession session = request.getSession();

        //get dữ liệu từ DB lên
        List<Products> listProduct = productDAO.findAll3();
        List<ProductTypes> listCategory = productTypeDAO.findAll();
        //set listBook vaof session
        session.setAttribute("listProduct", listProduct);
        session.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("../admin/dashboard.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //TAO SESSION
        HttpSession session = request.getSession();

        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add":
                addProduct(request);
                break;
            case "delete":
                delete(request);
                break;
            case "edit":
                edit(request);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("dashboard");
    }

    private void addProduct(HttpServletRequest request) {
        productDAO = new ProductDAO();
        //get information
        //get productID
//        int productID = Integer.parseInt(request.getParameter("productID"));
        //get typeID
        int typeID = Integer.parseInt(request.getParameter("typeID"));
        //get productName
        String productName = request.getParameter("productName");
        //get price
        int price = Integer.parseInt(request.getParameter("price"));
        //get quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String imagePath = null;
        try {
            Part part = request.getPart("image");

            String path = request.getServletContext().getRealPath("/images");
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            File image = new File(dir, part.getSubmittedFileName());
            part.write(image.getAbsolutePath());
            imagePath = request.getContextPath() + "/images/" + image.getName();
        } catch (Exception e) {
        }
        Products products = Products.builder()
                .typeID(typeID)
                .productName(productName)
                .price(price)
                .stockQuantity(quantity)
                .image(imagePath)
                .build();
        productDAO.insert(products);
    }

    private void delete(HttpServletRequest request) {
        productDAO = new ProductDAO();
        //get information
        int productID = Integer.parseInt(request.getParameter("productID"));
        //delete book by id
        productDAO.deleteById(productID);
    }

    private void edit(HttpServletRequest request) {
        Products products = new Products();
        //get information
        int id = Integer.parseInt(request.getParameter("id"));
        //get typeid
        int typeID = Integer.parseInt(request.getParameter("typeID"));
        //get name
        String productName = request.getParameter("productName");
        //get price
        int price = Integer.parseInt(request.getParameter("price"));
        //get quantity
        int stockQuantity = Integer.parseInt(request.getParameter("quantity") ) +100;

        String imagePath = null;
        //get image
        try {

            Part part = request.getPart("image");
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty()) {
                // Sử dụng ảnh hiện tại và cập nhật đường dẫn (imagePath)
                imagePath = request.getParameter("currentImage");
            } else {
                try {
                    String path = request.getServletContext().getRealPath("/images");
                    File dir = new File(path);
                    //ko có đường dẫn => tự tạo ra
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    File image = new File(dir, part.getSubmittedFileName());
                    part.write(image.getAbsolutePath());
                    imagePath = request.getContextPath() + "/images/" + image.getName();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        //setter parameter
        products.setProductID(id);
        products.setTypeID(typeID);
        products.setProductName(productName);
        products.setPrice(price);
        products.setStockQuantity(stockQuantity);
        products.setImage(imagePath);

        //tao doi tuong
        ProductDAO dao = new ProductDAO();
        dao.updateproduct(products);
    }
}
