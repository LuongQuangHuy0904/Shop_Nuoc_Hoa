<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .menu-container {
        width: 250px; 
        background: #f0f0f0; 
        border: 1px solid #ccc; 
        border-radius: 8px; 
        padding: 10px;
    }

    .nav-item {
        list-style: none;
        margin: 10px 0;
    }

    .nav-link {
        display: block;
        padding: 8px 15px;
        background: white;
        border-radius: 5px;
        text-decoration: none;
        color: #333;
        font-weight: bold;
        transition: 0.3s;
    }

    .nav-link:hover {
        background: #ddd;
    }

    .active .nav-link {
        background: #ccc;
    }
</style>
<ul class="menu-container">
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/category">
            <span>Type ID</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/orders">
            <span>Manage Order</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/account">
            <span>Manage Account</span>
        </a>
    </li>

</ul>
