<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1">
            <meta name='description' content="" />
            <meta name="keywords" content="" />
            <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
            <div class="main-wrapper">
                <main class="content">
                    <div class="detail-block detail-block_margin">
                        <div class="wrapper">
                            <div class="detail-block__content">
                                <h1>Shop</h1>
                                <ul class="bread-crumbs">
                                    <li class="bread-crumbs__item">
                                        <a href="#" class="bread-crumbs__link">Home</a>
                                    </li>
                                    <li class="bread-crumbs__item">
                                        <a href="#" class="bread-crumbs__link">Shop</a>
                                    </li>
                                    <li class="bread-crumbs__item">${product.productName}</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="product">
                    <div class="wrapper">
                        <div class="product-content">
                            <div class="product-slider">
                                <div class="product-slider__main">
                                    <div class="product-slider__main-item">
                                        <img loading="lazy" src="${product.image}" alt="${product.productName}">
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h3>${product.productName}</h3>
                                
                                <span class="product-price">$${product.price}</span>
                                <div class="contacts-info__social">
                                </div>
                                <form method="post" action="check-out?action=add-product">
                                    <input type="hidden" name="id" value="${product.productID}">
                                        <div class="product-options">
                                            <div class="product-info__quantity">
                                                <span class="product-info__quantity-title">Quantity:</span>
                                                <div class="counter-box">
                                                    <span class="counter-link counter-link__prev"><i class="fa-solid fa-chevron-left"></i></span>
                                                    <input type="text" name="quantity" class="counter-input" value="1">
                                                        <span class="counter-link counter-link__next" 
                                                              onclick="updateQuantity(this, ${product.stockQuantity})">
                                                            <i class="fa-solid fa-chevron-left"></i>
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-buttons">
                                            <a href="#" onclick="return this.closest('form').submit()" class="btn btn-icon"><i class="fa-solid fa-cart-shopping"></i> cart</a>
                                            
                                        </div>
                                </form>
                            </div>
                        </div>
                        
                    </div>
                    <img class="promo-video__decor js-img" data-src="img/promo-video__decor.jpg"
                         src="data:image/gif;base64,R0lGODlhAQABAAAAACw=" alt="">
                </div>
            </main>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <script>
                function updateQuantity(element, maxQuantity) {
                    var currentQuantity = parseInt($('.counter-input').val());
                    if (element.classList.contains('counter-link__next')) {
                        if (currentQuantity < maxQuantity) {
                            $('.counter-input').val(currentQuantity + 1);
                        }
                    } else {
                        if (currentQuantity > 1) {
                            $('.counter-input').val(currentQuantity - 1);
                        }
                    }
                }
            </script>
        <jsp:include page="linkJS.jsp"></jsp:include>

    </body>
</html>
