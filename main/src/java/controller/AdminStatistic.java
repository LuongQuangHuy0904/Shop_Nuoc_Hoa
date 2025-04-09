/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Year;
import java.util.List;

public class AdminStatistic extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String yearParam = request.getParameter("year");
        int selectedYear;
        if (yearParam == null || yearParam.isEmpty()) {
            selectedYear = Year.now().getValue();
        } else {
            selectedYear = Integer.parseInt(yearParam);
        }
                OrderDAO orderDAO = new OrderDAO();
        List<Double> totalRevenueByMonth = orderDAO.getTotalRevenueByMonth(selectedYear);
                request.setAttribute("totalRevenueByMonth", totalRevenueByMonth);
        request.setAttribute("selectedYear", selectedYear);
                request.getRequestDispatcher("../admin/admin-statistic.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    } 

}
