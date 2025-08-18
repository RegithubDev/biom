<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        :root {
            --primary-color: #4F7C82;
            --secondary-color: #0B2E33;
            --accent-color: #B8E3E9;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        
        .header-bar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .status-active {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .action-btn {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="d-flex justify-content-between align-items-center m-2">
  <div>
    <a href="<%=request.getContextPath()%>/fi-d26827851841284wjvwunfuqwhfbwqr7212hfu" 
       class="btn btn-dark waves-effect waves-float waves-light back-btn">
      <span class="btn-content">
        <i class="fas fa-arrow-left me-2"></i>Back
      </span>
      <span class="btn-background"></span>
    </a>
  </div>
  <div>
    <a href="<%=request.getContextPath()%>/logout" 
       class="btn btn-dark waves-effect waves-float waves-light logout-btn">
      <span class="btn-content">
        <i class="fas fa-sign-out-alt me-2"></i>Logout
      </span>
      <span class="btn-background"></span>
    </a>
  </div>
</div>
    <div class="container-fluid py-4">
        <div class="header-bar">
            <div class="d-flex justify-content-between align-items-center">
                <h2><i class="fas fa-users me-2"></i>User Management</h2>
                <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addUserModal">
                    <i class="fas fa-plus me-2"></i>Add User
                </button>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="usersTable" class="table table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                               <!--  <th>User ID</th> -->
                                <th>Email</th>
                                <th>Profit Center</th>
                                <th>Role</th>
                                <th>Created On</th>
                                <th>Modified On</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${usersList}" var="user" varStatus="row">
                                <tr>
                                    <td>${fn:length(usersList) - row.index}</td>
                                   <%--  <td>${user.user_id}</td> --%>
                                    <td><span class="badge bg-info">${user.email_id}</span></td>
                                    <td>${user.profit_center_code}</td>
                                    <td>${user.role}</td>
                                    <td>${user.created_on}</td>
                                    <td>${user.modified_on}</td>
                                    <td>
                                        <span class="status-badge ${user.status == 'Active' ? 'status-active' : 'status-inactive'}">
                                            ${user.status}
                                        </span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-primary action-btn me-1" 
                                                data-bs-toggle="modal" 
                                                data-bs-target="#editUserModal${user.id}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                       <%--  <button class="btn btn-sm btn-danger action-btn" 
                                                onclick="confirmDelete(${user.id})">
                                            <i class="fas fa-trash-alt"></i>
                                        </button> --%>
                                    </td>
                                </tr>
                                
                                <!-- Edit User Modal -->
                                <div class="modal fade" id="editUserModal${user.id}" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<%=request.getContextPath()%>/updateUser" method="post">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Edit User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" value="${user.id}">
                    
                    <div class="mb-3">
                        <label class="form-label">User ID</label>
                        <input type="text" class="form-control" name="user_id" value="${user.user_id}"  readonly required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email_id" value="${user.email_id}" required>
                    </div>
                   
                    <div class="mb-3">
                        <label class="form-label">Profit Center Code</label>
                        <select class="form-select" name="profit_center_code">
                            <option value="">Select Profit Center</option>
                            <c:forEach items="${profitCenterList}" var="profitCenter">
                                <option value="${profitCenter.profit_center_code}" ${user.profit_center_code == profitCenter.profit_center_code ? 'selected' : ''}>
                                    ${profitCenter.profit_center_code} - ${profitCenter.profit_center_name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Role</label>
                        <select class="form-select" name="role" required>
                            <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                            <option value="User" ${user.role == 'User' ? 'selected' : ''}>User</option>
                            <option value="Management" ${user.role == 'Management' ? 'selected' : ''}>Management</option>
                            <option value="SA" ${user.role == 'SA' ? 'selected' : ''}>Super Admin</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" name="status" required>
                            <option value="Active" ${user.status == 'Active' ? 'selected' : ''}>Active</option>
                            <option value="Inactive" ${user.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<%=request.getContextPath()%>/addUser" method="post">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add New User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">User ID</label>
                        <input type="text" class="form-control" name="user_id" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email_id" required>
                    </div>
                   
                    
                    <div class="mb-3">
                        <label class="form-label">Profit Center Code</label>
                        <select class="form-select" name="profit_center_code">
                            <option value="">Select Profit Center</option>
                            <c:forEach items="${profitCenterList}" var="profitCenter">
                                <option value="${profitCenter.profit_center_code}">
                                    ${profitCenter.profit_center_code} - ${profitCenter.profit_center_name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Role</label>
                        <select class="form-select" name="role" required>
                            <option value="">Select Role</option>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                            <option value="Management">Management</option>
                            <option value="SA">Super Admin</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add User</button>
                </div>
            </form>
        </div>
    </div>
</div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function() {
            // Initialize DataTable
            $('#usersTable').DataTable({
                responsive: true,
                order: [[0, 'desc']],
                pageLength: 25,
                language: {
                    search: "",
                    searchPlaceholder: "Search users..."
                }
            });
        });
        
        function confirmDelete(userId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Submit delete request
                    window.location.href = 'deleteUser?id=' + userId;
                }
            });
        }
        
        // Show success message if present
        <c:if test="${not empty successMessage}">
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '${successMessage}',
                timer: 3000,
                showConfirmButton: false
            });
        </c:if>
        
        // Show error message if present
        <c:if test="${not empty errorMessage}">
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '${errorMessage}'
            });
        </c:if>
    </script>
</body>
</html>