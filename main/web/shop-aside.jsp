<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="shop-aside">
    <div class="box-field box-field__search"> 
        <form action="home" method="get">    
            <input type="search" class="form-control" placeholder="Search by name" name="keyword">      
            <input type="hidden" name="search" value="search">    
            <button type="submit" class="btn btn-primary" style="margin-top: 10px">    Search     
            <i class="fa-solid fa-magnifying-glass"></i>     
            </button>  
        </form> 
    </div>

    <div class="shop-aside__item">
        <span class="shop-aside__item-title">Gender</span>
        <ul>
        <c:forEach items="${listCategory}" var="category">
        <li><a href="home?search=category&categoryId=${category.id}">${category.name}</a></li>
        </c:forEach>
        </ul>
    </div>
    <script>
        function filterByPrice() {
            var minPrice = 0;
            var maxPrice = document.querySelector('.js-range-slider-price').value;
            window.location.href = 'home?search=filter-price&minPrice=' + minPrice + '&maxPrice=' + maxPrice;
        }
    </script>
</div>
