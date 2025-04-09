<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">

        Data Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="width: 10%;">Tracking Code</th>
                        <th style="width: 30%;">Amount</th>
                        <th style="width: 30%;">Purchase Time</th>
                        <th style="width: 15%;">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listOrder}" var="order">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.amount}VNĐ</td>
                            <td><fmt:formatDate value="${order.createAt}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
                            <td style="cursor: pointer">
                                <a 
                                    href="${pageContext.request.contextPath}/dashboard?page=orderDetailsSearching&id=${order.id}">

                                    View

                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
