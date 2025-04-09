<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">

    <div class="card-body">
        <div class="d-flex justify-content-end mb-3">
            <button id="downloadBtn" class="btn btn-success mr-3">
                <i class="fas fa-download"></i> Download Excel
            </button>
            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addProductModal">
                <i class="fas fa-plus"></i> Add Product
            </button>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ProductID</th>
                        <th>TypeID</th>
                        <th>ProductName</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <td name="productID">${product.productID}</td>
                            <td name="typeID">
                                <c:forEach items="${listCategory}" var="c">
                                    <c:if test="${c.id == product.typeID}">
                                        ${c.name}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td name="productName">${product.productName}</td>
                            <td name="price">${product.price}</td>
                            <td name="stockQuantity">${product.stockQuantity}</td>
                            <td name="image">
                                <img width="100px"
                                     height="100px"
                                     src="${product.image}" 
                                     alt="..." class="card-img-top"
                                     style="object-fit: contain">
                            </td>
                            <td>
                                <i class="fa fa-edit fa-2x" style="color: #469408"
                                   data-toggle="modal"
                                   onclick="editModal(this)"
                                   data-target="#editProductModal"></i>

                                <i class="fa fa-trash fa-2x"
                                   style="color: #e70808"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   onclick="deleteProductModal(${product.productID})">
                                </i>
                            </td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

<script>
    document.getElementById('downloadBtn').addEventListener('click', function() {
        var table = document.querySelector('table');
        var wb = XLSX.utils.table_to_book(table, {sheet: "Sheet 1"});

        XLSX.writeFile(wb, "ProductData.xlsx");
    });
</script>

</div>
