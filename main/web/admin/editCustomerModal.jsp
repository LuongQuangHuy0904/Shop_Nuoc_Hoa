<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="editCustomerModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBookModalLabel">Edit password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editBookForm" action="account?action=edit" method="POST">
                    <!--id-->
                    <div class="form-group" >
                        <label for="name">Username:</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" readonly>
                    </div>
                    <div class="form-group">
                        <label for="name">New Password:</label>
                        <input type="text" class="form-control" id="nameEditInput" name="password" required>
                        <div id="nameEditError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBookForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    function editModal(customerName) {
        $('#customerName').val(customerName);
        console.log("CustomerName: " + customerName);
        console.log("CustomerName: " + $('#customerName').val());
    }
</script>
