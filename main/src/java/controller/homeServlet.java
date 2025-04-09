package controller;

import dal.ProductDAO;
import dal.ProductTypeDAO;
import models.PageControll;
import models.ProductTypes;
import models.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Locale.Category;

public class homeServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    ProductTypeDAO categoryDAO = new ProductTypeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PageControll pageControll = new PageControll();
        List<Products> listProduct = findProductDoGet(request, pageControll);
        List<ProductTypes> listCategory = categoryDAO.findAll();
        List<Products> topProducts = productDAO.getRandomProducts(3);

        session.setAttribute("listProduct", listProduct);
        session.setAttribute("listCategory", listCategory);
        session.setAttribute("topProducts", topProducts);
        request.setAttribute("pageControl", pageControll);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home");
    }

    private List<Products> findProductDoGet(HttpServletRequest request, PageControll pageControl) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (NumberFormatException e) {
            page = 1;
        }

        List<Products> listProduct;
        String action = request.getParameter("search") == null
                ? "defaultFindAll"
                : request.getParameter("search");
        switch (action) {
            case "search":
                String keyword = request.getParameter("keyword");
                listProduct = productDAO.findContainsByProperty("productName", keyword);
                break;
            case "filter-price":
                float minPrice;
                float maxPrice;
                try {
                    minPrice = Float.parseFloat(request.getParameter("minPrice"));
                    maxPrice = Float.parseFloat(request.getParameter("maxPrice"));
                } catch (NumberFormatException e) {
                    minPrice = 0;
                    maxPrice = Float.MAX_VALUE;
                }
                listProduct = productDAO.findByMinMaxPrice(minPrice, maxPrice, page);
                break;
            case "category":
                int categoryId;
                try {
                    categoryId = Integer.parseInt(request.getParameter("categoryId"));
                } catch (NumberFormatException e) {
                    categoryId = 0;
                }
                listProduct = productDAO.findByCategory(categoryId);
                break;
            case "sort":
                String sortBy = request.getParameter("sortBy");
                listProduct = productDAO.findAll();
                if (sortBy != null) {
                    switch (sortBy) {
                        case "expensive-cheap":
                            listProduct.sort((p1, p2) -> p2.getPrice() - p1.getPrice());
                            break;
                        case "cheap-expensive":
                            listProduct.sort((p1, p2) -> p1.getPrice() - p2.getPrice());
                            break;
                        default:
                            break;
                    }
                }
                break;
            default:
                listProduct = productDAO.findAll();
                break;
        }
        int totalRecord = listProduct.size();
        int totalPage = (totalRecord % Constant.RECORD_PER_PAGE) == 0
                ? (totalRecord / Constant.RECORD_PER_PAGE)
                : (totalRecord / Constant.RECORD_PER_PAGE) + 1;

        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setTotalPage(totalPage);
        return listProduct;
    }

}
