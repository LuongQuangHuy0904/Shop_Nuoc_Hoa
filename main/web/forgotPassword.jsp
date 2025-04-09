<%-- 
    Author     : 4USER-FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

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
                        <h1>Forgot Password</h1>                        
                    </div>
                </div>
            </div>
            <div class="login">
                <div class="wrapper">
                    <div class="login-form js-img" data-src="img/login-form__bg.png">
                        <c:choose>
                            <c:when test="${customer == null}">
                                <form action="authen?action=forgotPassword" method="POST">
                                    <h3>Forgot Password</h3>
                                    <div class="box-field">
                                        <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                                    </div>
                                    <div style="color: red">${error}</div>
                                    <button class="btn" type="submit">Submit</button>
                                    <div class="login-form__bottom">
                                        <span>Remember your password? <a href="authen?action=login">Log in</a></span>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="authen?action=updatePassword" method="POST">
                                    <h3>Reset Password</h3>
                                    <div class="box-field">
                                        <input type="email" class="form-control" name="email" value="${customer.email}">
                                    </div>
                                    <div class="box-field">
                                        <input type="password" class="form-control" name="newPassword" placeholder="Enter new password" required>
                                    </div>
                                    <input type="hidden" name="customerId" value="${customer.id}">
                                    <button class="btn" type="submit">Reset Password</button>
                                    <div class="login-form__bottom">
                                        <span>Remember your password? <a href="authen?action=login">Log in</a></span>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="header.jsp"></jsp:include>
                                <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <div class="icon-load"></div>
    <jsp:include page="linkJS.jsp"></jsp:include>
</body>
</html>
