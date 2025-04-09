<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">
        <style>
            .error {
                color: red;
            }
        </style>
    </head>

    <body id="page-top">
            <jsp:include page="navigationBar.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="sideBar.jsp"></jsp:include>
                <div id="content-wrapper">
                    <div class="container-fluid">
                    <jsp:include page="breadCumb.jsp"></jsp:include>
                    
                    <jsp:include page="iconCard.jsp"></jsp:include>

                    <jsp:include page="dataExample.jsp"></jsp:include>

                    </div>
                <jsp:include page="stickFooter.jsp"></jsp:include>
                </div>                
            </div>
        <jsp:include page="scrollUpToButton.jsp"></jsp:include>
        <jsp:include page="logOutModal.jsp"></jsp:include>
        <jsp:include page="addPRoductModal.jsp"></jsp:include>
        <jsp:include page="deleteProductModal.jsp"></jsp:include>
        <jsp:include page="editProductModal.jsp"></jsp:include>
            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>
        <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
    </body>
</html>
