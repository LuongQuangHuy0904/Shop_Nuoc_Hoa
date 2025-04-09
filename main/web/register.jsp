<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <head>     
                        <jsp:include page="linkcss.jsp"></jsp:include>
                            </head>
                            <body >
                                <div class="main-wrapper">
<div class="spacer"></div>

                                    <main class="content">
                                        <div class="detail-block detail-block_margin">
                                            <div class="wrapper">
                                                <div class="detail-block__content">
                                                    <h1>Register</h1>                                                    
                                                </div>
                                            </div>
                                        </div>                                        
                                        <div class="login registration">
                                            <div class="wrapper">
                                                <div class="login-form js-img" data-src="img/registration-form__bg.png">
                                                    <form action="authen?action=register" method="POST">
                                                        <h3>register now</h3>
                                                        <div >
                                                            <div class="box-field">
                                                                <input type="text" class="form-control" name="username" placeholder="Enter your username">
                                                            </div>
                                                            <div class="box-field">
                                                                <input type="password" class="form-control" name="password" placeholder="Enter your password">
                                                            </div>
                                                            <div class="box-field">
                                                                <input type="text" class="form-control" name="email" placeholder="Enter your email">
                                                            </div>
                                                        </div>
                                                        <div>
                                                            ${error}
                                                        </div>
                                                        <label class="checkbox-box checkbox-box__sm">
                                                            <input type="checkbox">
                                                                <span class="checkmark"></span>
                                                                Remember me
                                                        </label>
                                                        <button class="btn" type="submit">Registerr</button>
                                                        <div class="login-form__bottom">
                                                            <span>Already have an account? <a href="authen?action=login">Log in</a></span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </main>
                                <jsp:include page="header.jsp"></jsp:include>
                                <jsp:include page="footer.jsp"></jsp:include>
                                
                                </div>
                            <jsp:include page="linkJS.jsp"></jsp:include>
                        </body>
                        </html>