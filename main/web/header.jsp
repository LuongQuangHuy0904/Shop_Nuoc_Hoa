<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <style>
        /* Header Styling */
        .header {
            background-color: #333;
            padding: 10px 0;
            color: white;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .header-nav {
            list-style: none;
            padding: 0;
        }

        .header-nav li {
            display: inline;
            margin-right: 15px;
        }

        .header-nav li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        .header-options {
            list-style: none;
            padding: 0;
        }

        .header-options li {
            display: inline;
            margin-left: 15px;
        }

        .header-options li a {
            color: white;
            text-decoration: none;
        }

        .btn-menu {
            display: none; /* Ẩn menu button mặc định */
            cursor: pointer;
            flex-direction: column;
            gap: 5px;
        }

        .btn-menu span {
            width: 25px;
            height: 3px;
            background-color: white;
        }

        /* Responsive Menu Button */
        @media (max-width: 768px) {
            .btn-menu {
                display: flex;
            }

            .header-nav, .header-options {
                display: none;
                flex-direction: column;
                width: 100%;
                background-color: #333;
            }

            .header-nav li, .header-options li {
                text-align: center;
                margin: 10px 0;
            }

            .header-nav li a, .header-options li a {
                font-size: 18px;
            }

            .header-content.active .header-nav,
            .header-content.active .header-options {
                display: flex;
            }
        }
        .header-title {
    background-color: white; /* Màu nền trắng cho phần tiêu đề */
    padding: 10px 0; /* Thêm khoảng cách trên và dưới */
    text-align: center; /* Căn giữa tiêu đề */
    width: 100%;
    margin-top: 10px; /* Khoảng cách giữa header và tiêu đề */
}

.header-title h1 {
    font-size: 36px;
    margin: 0;
    color: #333; /* Màu chữ */
}

    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="header-box">
                <ul class="header-nav">
                    <li><a href="home">Home</a></li>
                </ul>
                <ul class="header-options">               
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <li><a href="${sessionScope.account.roleId == 1 ?'admin/dashboard': 'dashboard' }">Profile<i class="fa-regular fa-user"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="authen?action=login"><i class="fa-regular fa-user"></i></a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <div class="btn-menu js-btn-menu"><span>&nbsp;</span><span>&nbsp;</span><span>&nbsp;</span></div>
        </div>
        <div class="header-title">
        <h1>PRJ ASSIGNMENT SHOP</h1>
    </div>
    </header>

    <script>
        document.querySelector('.btn-menu').addEventListener('click', function() {
            document.querySelector('.header-content').classList.toggle('active');
        });
    </script>
</body>
</html>
