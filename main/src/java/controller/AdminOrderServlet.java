/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import dal.OrderDAO;
import dal.OrderDetailsDAO;
import dal.ProductDAO;
import models.OrderDetails;
import models.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AdminOrderServlet extends HttpServlet {

    OrderDAO orderDAO = new OrderDAO();
    CustomerDAO customerDAO = new CustomerDAO();
    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("listOrder", orderDAO.findAll());
        session.setAttribute("listAccount", customerDAO.findAll());
        request.getRequestDispatcher("../admin/manageOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch (action) {
            case "detailsOrder":
                viewOrderDetails(request, response);
                break;

            default:
                break;
        }
    }
    
    private void viewOrderDetails(HttpServletRequest request, HttpServletResponse response) {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        List<OrderDetails> listOrderDetails = orderDetailsDAO.findByOrderId(orderId);
        List<Products> listProduct = new ProductDAO().findAll2();
        HttpSession session = request.getSession();
        session.setAttribute("listOrderDetails", listOrderDetails);
        session.setAttribute("listProduct", listProduct);
        try {
            request.getRequestDispatcher("../admin/admin-order-details.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
