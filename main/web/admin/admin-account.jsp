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
        <jsp:include page="sideBar.jsp"></jsp:include>

            <div id="content-wrapper">

                <div class="container-fluid">
                <jsp:include page="iconCard.jsp"></jsp:include>
                    <div class="card mb-3">
                        <div class="card-header">
                            Account Table 
                            <button id="downloadBtn" class="btn btn-success float-right">Download Excel</button> <!-- Nút download Excel -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 3%;">STT</th>
                                            <th style="width: 20%;">Acount</th>
                                            <th style="width: 10%;">Email</th>
                                            <th style="width: 15%;">Address</th>
                                            <th style="width: 3%;">Gender</th>
                                            <th style="width: 5%;">Activity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listAccount}" var="acc" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>
                                                ${acc.customerName}
                                            </td>
                                            <td>${acc.email}</td> 
                                            <td>${acc.address}</td> 
                                            <td >
                                                ${acc.gender == true ? "Nam" : "Nữ"}
                                            </td>
                                            <td>
                                                <button type="button"
                                                    class="btn btn-primary"
                                                    data-toggle="modal"
                                                    data-target="#editCustomerModal"
                                                    onclick="editModal(`${acc.customerName}`)">
                                                    Edit
                                                </button>
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
    <jsp:include page="editCustomerModal.jsp"></jsp:include>

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
            // Lấy dữ liệu bảng
            var table = document.querySelector('table');
            var wb = XLSX.utils.table_to_book(table, {sheet: "Sheet 1"});

            // Tạo file Excel và tải xuống
            XLSX.writeFile(wb, "AccountData.xlsx");
        });
    </script>
</body>

</html>
