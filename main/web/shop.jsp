<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="pageSize" value="9" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1">
            <meta name='description' content="" />
            <meta name="keywords" content="" />
            <jsp:include page="linkcss.jsp"></jsp:include>
            <style>
                .products-item__info {
    display: flex;
    justify-content: space-between; /* Căn chỉnh các phần tử thành 2 bên */
    align-items: center; /* Căn giữa các phần tử theo chiều dọc */
}

.products-item__details {
    display: flex;
    flex-direction: column; /* Sắp xếp tên và giá theo chiều dọc */
    justify-content: space-between;
    flex-grow: 1; /* Phần này sẽ chiếm hết không gian còn lại */
}

.products-item__name,
.products-item__cost {
    margin: 0; /* Bỏ margin cho các phần tử này */
}

.products-item__actions {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px; /* Đặt kích thước nút */
    height: 40px; /* Đặt kích thước nút */
    background-color: #000; /* Màu nền của nút */
    color: white; /* Màu chữ */
    border-radius: 5px; /* Để nút có góc bo tròn */
    cursor: pointer; /* Khi di chuột vào nút sẽ có dạng con trỏ */
    transition: background-color 0.3s; /* Hiệu ứng chuyển màu nền */
}

.products-item__actions:hover {
    background-color: #333; /* Màu nền khi hover */
}

.products-item__actions i {
    font-size: 20px; /* Điều chỉnh kích thước biểu tượng */
    
.center-title {
    display: flex;
    justify-content: center; /* Căn giữa theo chiều ngang */
    align-items: center; /* Căn giữa theo chiều dọc */
    text-align: center; /* Căn giữa văn bản trong h1 */
    height: 100px; /* Chiều cao của phần chứa tiêu đề */
    margin-top: 10px; /* Khoảng cách giữa header và tiêu đề */
}


}

                
            </style>
        </head>

        <body>

            <div class="main-wrapper">

                <main class="content">
                    

                    <div class="shop">
                        <div class="wrapper">
                            <div class="shop-content">
                            
                                <div class="shop-main">
                                    <div class="shop-main__filter">
                                        <div class="shop-main__select">
                                            <select class="styled" onchange="sortProducts(this.value)">
                                                <option value="default">All</option>
                                                <option value="expensive-cheap">From expensive to cheap</option>
                                                <option value="cheap-expensive">From cheap to expensive</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="shop-main__items">
                                    <c:forEach items="${listProduct}" var="product" begin="0" end="${pageSize-1}">
                                        <a href="product-details?id=${product.productID}" class="products-item">

                                            <div class="products-item__img">
                                                <img data-src="${product.image}"
                                                     src="${product.image}" class="js-img" alt="">
                                                    <div class="products-item__hover">

                                                    </div>
                                            </div>
                                            <div class="products-item__info">
                                                <div class="products-item__details">
                                                    <span class="products-item__name">${product.productName}</span>
                                                    <span class="products-item__cost">$${product.price}</span>
                                                </div>
                                                <div class="products-item__actions">
                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                </div>
                                            </div>

                                        </a>
                                    </c:forEach>
                                </div>
                                <ul class="paging-list">
                                    <li class="paging-list__item paging-prev">
                                        <a href="#" class="paging-list__link">
                                            <i class="fa-solid fa-angle-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${pageControl.totalPage}" var="i">
                                        <li class="paging-list__item ${pageControl.page == i ? 'active' : ''}">
                                            <a href="?page=${i}" class="paging-list__link">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="paging-list__item paging-next">
                                        <a href="#" class="paging-list__link fa-solid fa-angle-right">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                                <jsp:include page="shop-aside.jsp"></jsp:include>
                        </div>

                    </div>
                </div>


            </main>

            <jsp:include page="header.jsp"></jsp:include>

            <jsp:include page="footer.jsp"></jsp:include>

            </div>

            <script src="${pageContext.request.contextPath}/js/web/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/web/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/web/jquery.maskedinput.js"></script>
        <script src="${pageContext.request.contextPath}/js/web/ion.rangeSlider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/web/jquery.formstyler.js"></script>
        <script src="${pageContext.request.contextPath}/js/web/custom.js"></script>
        <script>
                                            function sortProducts(sortBy) {
                                                window.location.href = "home?search=sort&sortBy=" + sortBy;
                                            }
        </script>
        
    </body>
</html>
