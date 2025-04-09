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
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>Thông tin cá nhân</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 justify-content-center">
                                            <form class="justify-content-center" action="${pageContext.request.contextPath}/dashboard?action=profile" method="POST">
                                            <!-- Username -->
                                            <div class="form-group justify-content-center row">
                                                <label for="username" class="col-2 col-form-label">Account</label>
                                                <div class="col-6">
                                                    <input id="username" name="customerName" placeholder="" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.customerName}">
                                                </div>
                                            </div>
                                            <!-- Email -->
                                            <div class="form-group justify-content-center row">
                                                <label for="email" class="col-2 col-form-label">Email</label>
                                                <div class="col-6">
                                                    <input id="email" name="email" placeholder="Email" class="form-control here" 
                                                           type="text" value="${sessionScope.account.email}">
                                                </div>
                                            </div>
                                            <!-- Address -->
                                            <div class="form-group justify-content-center row">
                                                <label for="address" class="col-2 col-form-label">Addres</label>
                                                <div class="col-6">
                                                    <input id="address" name="address" placeholder="" 
                                                           class="form-control here" type="text" value="${sessionScope.account.address}">
                                                </div>
                                            </div>
                                            <div class="form-group justify-content-center row">
                                                <label for="gender" class="col-2 col-form-label">Gender</label>
                                                <div class="col-6">
                                                    <input name="gender" placeholder="" 
                                                           class=" here" type="radio" value="Male" ${account.gender == true ? 'checked' : ''}> Male
                                                    <input name="gender" placeholder="" 
                                                           class=" here" type="radio" value="Female" ${account.gender == false ? 'checked' : ''}> Female
                                                </div>
                                            </div>

                                            <!-- Save button -->
                                            <div class="form-group justify-content-center row">
                                                <div class="offset-4 col-8">
                                                    <button name="submit" type="submit" class="btn btn-primary">Edit Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <jsp:include page="stickFooter.jsp"></jsp:include>


                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
        <jsp:include page="scrollUpToButton.jsp"></jsp:include>


            <!-- Logout Modal-->
        <jsp:include page="logOutModal.jsp"></jsp:include>

            <!--Add product modal-->
        <jsp:include page="addPRoductModal.jsp"></jsp:include>

            <!--Delete product modal-->
        <jsp:include page="deleteProductModal.jsp"></jsp:include>

            <!--Edit Product Modal-->
        <jsp:include page="editProductModal.jsp"></jsp:include>

            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>


    </body>

</html>
