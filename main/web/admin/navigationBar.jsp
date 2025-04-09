
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .navbar {
        background-color: #f0f0f0 !important; 
    }
</style>

<style>
    .navbar-brand {
        color: #000 !important; 
    }
</style>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">HOME</a>



    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        
    </form>

    <ul class="navbar-brand">
        
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>
