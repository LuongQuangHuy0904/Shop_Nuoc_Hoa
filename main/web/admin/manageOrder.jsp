<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    </head>

    <body id="page-top">
        <jsp:include page="navigationBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                    <jsp:include page="iconCard.jsp"></jsp:include>

                        <div class="card mb-3">
                            <div class="card-header">
                                Oder Data
                                <button id="downloadBtn" class="btn btn-success float-right">Download Excel</button> <!-- Nút download Excel -->
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="width: 3%;">No</th>
                                                <th style="width: 12%;">Username</th>
                                                <th style="width: 15%;">Tracking Code</th>
                                                <th style="width: 23%;">Total Amount</th>
                                                <th style="width: 33%;">Purchase Time</th>
                                                <th style="width: 7%;">Actions</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listOrder}" var="order" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <c:forEach items="${listAccount}" var="u">
                                                        <c:if test="${u.id == order.accountId}">
                                                            ${u.customerName}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>${order.id}</td>
                                                <td name="quantity">${order.amount} VND</td>
                                                <td >
                                                    <p class="mb-0">
                                                        ${order.getCreateAt()}
                                                    </p>
                                                </td>
                                                <td>
                                                    <form action="orders?action=detailsOrder" method="POST">
                                                        <input type="hidden" name="orderId" value="${order.id}">
                                                        <a href="#" class="btn btn-primary" onclick="return this.closest('form').submit();" style="margin-right: 5px;">More</a>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <jsp:include page="stickFooter.jsp"></jsp:include>

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

        <script>
            document.getElementById('downloadBtn').addEventListener('click', function() {
                var table = document.querySelector('table');
                var wb = XLSX.utils.table_to_book(table, {sheet: "Sheet 1"});
                XLSX.writeFile(wb, "DataTable.xlsx");
            });
        </script>
    </body>

</html>
