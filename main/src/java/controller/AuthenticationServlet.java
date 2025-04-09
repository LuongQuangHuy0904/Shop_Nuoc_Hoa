/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        String url = "";
        switch (action) {
            case "login":
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    String username = null;
                    String password = null;
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("username")) {
                            username = cookie.getValue();
                        } else if (cookie.getName().equals("password")) {
                            password = cookie.getValue();
                        }
                    }
                    if (username != null && password != null) {
                        CustomerDAO customerDAO = new CustomerDAO();
                        Customer customer = Customer.builder().customerName(username).password(password).build();
                        customer = customerDAO.findByCustomerNamePassword(customer);
                        if (customer != null) {
                            HttpSession session = request.getSession();
                            session.setAttribute(Constant.SESSION_CUSTOMER, customer);
                            response.sendRedirect("home");
                            return;
                        }
                    }
                }
                url = "login.jsp";
                break;
            case "logout":
                url = "home";
                logout(request, response);
                response.sendRedirect(url);
                return;
            case "register":
                url = "register.jsp";
                break;
            case "forgotPassword":
                url = "forgotPassword.jsp";
                break;
            default:
                url = "home";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "forgotPassword":
                forgotPassword(request, response);
                break;
            case "updatePassword":
                updatePassword(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String newPassword = request.getParameter("newPassword");
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.updatePassword(customerId, newPassword);
        response.sendRedirect("authen?action=login");
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;

        Customer customer = Customer.builder().customerName(username).password(password).build();

        customer = customerDAO.findByCustomerNamePassword(customer);
        if (customer == null) {
            request.setAttribute("error", "Username or password incorrect!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute(Constant.SESSION_CUSTOMER, customer);
            if (remember) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(60 * 60 * 24 * 30); 
                Cookie passwordCookie = new Cookie("password", password);
                passwordCookie.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            } else {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
            }

            response.sendRedirect("home");
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate(); 

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        CustomerDAO customerDAO = new CustomerDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        

        Customer customer = Customer.builder()
                .customerName(username)
                .password(password)
                .email(email)
                .roleId(Constant.ROLE_USER)
                .build();

        boolean isExist = customerDAO.findByUsername(username);
        if (!isExist) {
            customerDAO.insert(customer);
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "Account exist, please choose other!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.findByEmail(email);
        if (customer == null) {
            request.setAttribute("error", "Email not found. Please try again.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }
}
