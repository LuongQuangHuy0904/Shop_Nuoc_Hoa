<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="format-detection" content="telephone=no">
            <meta name="it-rating" content="it-rat-cd303c3f80473535b3c667d0d67a7a11">
                <meta name="cmsmagazine" content="3f86e43372e678604d35804a67860df7">
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
                                                    <h1>Cart</h1>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="cart">
                                            <div class="wrapper">
                                                <div class="cart-table">
                                                    <div class="cart-table__box">
                                                        <div class="cart-table__row cart-table__row-head">
                                                            <div class="cart-table__col">Product</div>
                                                            <div class="cart-table__col">Price</div>
                                                            <div class="cart-table__col">Quantity</div>
                                                            <div class="cart-table__col">Total</div>
                                                            <div class="cart-table__col"></div>
                                                        </div>
                                                    <c:set var="totalAmount" value="0" />
                                                    <c:forEach items="${cart.listOrderDetails}" var="orderDetails"
                                                               varStatus="status">
                                                        <c:forEach items="${listProduct}" var="productInList">
                                                            <c:if test="${productInList.productID == orderDetails.productId}">
                                                                <c:set var="currentProduct" value="${productInList}"></c:set>
                                                                <c:set var="totalAmount" value="${totalAmount + (currentProduct.price * orderDetails.quantity)}" />
                                                                <div class="cart-table__row">
                                                                    <div class="cart-table__col">
                                                                        <a href="product.html" class="cart-table__img">
                                                                            <img data-src="${currentProduct.image}" src="${currentProduct.image}" class="js-img" alt="">
                                                                        </a>
                                                                        
                                                                    </div>
                                                                    <div class="cart-table__col">
                                                                        <span class="cart-table__price"><fmt:formatNumber value="${currentProduct.price}" type="currency" currencySymbol="₫" /></span>
                                                                    </div>
                                                                    <div class="cart-table__col">
                                                                        <div class="cart-table__quantity">
                                                                            <div class="counter-box">
                                                                                <input type="text" class="counter-input" disabled value="${orderDetails.quantity}">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="cart-table__col">
                                                                        <span class="cart-table__total"><fmt:formatNumber value="${currentProduct.price * orderDetails.quantity}" type="currency" currencySymbol="₫" /></span>
                                                                    </div>
                                                                    <div class="cart-table__col">
                                                                        <form action="check-out?action=delete&id=${currentProduct.productID}" method="POST">
                                                                            <button type="submit" class="btn btn-danger"><i class="fa-solid fa-trash"></i></button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                                    <div class="cart">
                                            <div class="wrapper">
                                                <div class="cart-table">
                                                    <div class="cart-table__box">
                                                        <div class="cart-table__row cart-table__row-head">
                                                            <div class="cart-table__col">Total:</div>
                                                            <div class="cart-table__col"></div>
                                                            <div class="cart-table__col"></div>
                                                            <div class="cart-table__col"><span>
                                                                <fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="₫" />
                                                            </span></div>
                                                            <div class="cart-table__col"><div class="cart-table__col">
                                                        <form class="form-customer" action="check-out?action=purchase" method="POST">
                                                            <a href="#" class="btn" onclick="return this.closest('form').submit();">Checkout</a>
                                                        </form>
                                                    </div></div>
                                                        </div>
                                                    </div>
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

                            <jsp:include page="linkJS.jsp"></jsp:include>
                        </body>
                        </html>