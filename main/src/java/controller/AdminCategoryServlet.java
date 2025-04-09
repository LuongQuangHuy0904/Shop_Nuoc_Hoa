/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductTypeDAO;
import models.ProductTypes;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AdminCategoryServlet extends HttpServlet {
   
    ProductTypeDAO cateDAO = new ProductTypeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ProductTypes> listCategory = cateDAO.findAll();
        session.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("../admin/categoryDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // get session
        HttpSession session = request.getSession();
        // get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add":
                addCategory(request);
                break;
            case "delete":
                delete(request);
                break;
            case "edit":
                edit(request);
                break;
            default:

        }
        response.sendRedirect("category");
    }

    private void addCategory(HttpServletRequest request) {
        try {
            // get name
            String name = request.getParameter("name");
            // get price
            ProductTypes category = new ProductTypes(-1, name);

            //instance
            //TODO: 
            cateDAO.insert(category);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request) {
        // get id
        int id = Integer.parseInt(request.getParameter("id"));
        cateDAO.deleteById(id);
    }

    private void edit(HttpServletRequest request) {
        // get data
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");

            ProductTypes category = new ProductTypes(id, name);
            cateDAO.update(category);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }
    }

}
