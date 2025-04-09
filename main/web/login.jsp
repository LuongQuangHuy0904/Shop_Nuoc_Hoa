<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1>Log in</h1>
                    </div>
                </div>
            </div>
            <div class="login">
                <div class="wrapper">
                    <div class="login-form js-img" data-src="img/login-form__bg.png">
                        <form action="authen?action=login" method="POST">
                            <h3>Login</h3>
                            <div class="box-field">
                                <input type="text" class="form-control" name="username" placeholder="Enter your email or nickname" value="${not empty cookie.username.value ? cookie.username.value : ''}">
                            </div>
                            <div class="box-field">
                                <input type="password" name="password" class="form-control" placeholder="Enter your password" value="${not empty cookie.password.value ? cookie.password.value : ''}">
                            </div>
                            <div style="color: red">${error}</div>
                            <label class="checkbox-box checkbox-box__sm">
                                <input type="checkbox" name="remember" ${not empty cookie.username.value ? 'checked' : ''}>
                                <span class="checkmark"></span>
                                Remember me
                            </label>
                            <button class="btn" type="submit">Login</button>
                            <div class="login-form__bottom">
                                <span>No account? <a href="authen?action=register">Register now</a></span>
                                <a href="authen?action=forgotPassword">Lost your password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </main>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    
</div>

</body>
</html>
