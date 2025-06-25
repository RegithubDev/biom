<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<head>
    <title>Employee Attendance Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4bb543;
            --warning-color: #ffcc00;
            --danger-color: #f44336;
            --border-radius: 8px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            border-radius: 0 0 var(--border-radius) var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 2rem;
        }
        
        .card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
            margin-bottom: 1.5rem;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }
        
        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-weight: 600;
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
        }
        
        .filter-section {
            background-color: white;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 1.5rem;
        }
        
        .form-control, .form-select {
            border-radius: var(--border-radius);
            padding: 0.5rem 1rem;
            border: 1px solid #e0e0e0;
            transition: var(--transition);
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.15);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: var(--border-radius);
            padding: 0.5rem 1.5rem;
            transition: var(--transition);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .btn-outline-secondary {
            border-radius: var(--border-radius);
        }
        
        #attendanceTable_wrapper {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
        }
        
        table.dataTable {
            margin-top: 0 !important;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        table.dataTable thead th {
            border-bottom: none;
            background-color: #f8f9fa;
            padding: 1rem;
            font-weight: 600;
            color: var(--dark-color);
        }
        
        table.dataTable tbody td {
            padding: 0.75rem 1rem;
            vertical-align: middle;
            border-top: 1px solid #f0f0f0;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.65rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .status-present {
            background-color: rgba(75, 181, 67, 0.15);
            color: var(--success-color);
        }
        
        .status-absent {
            background-color: rgba(244, 67, 54, 0.15);
            color: var(--danger-color);
        }
        
        .status-late {
            background-color: rgba(255, 204, 0, 0.15);
            color: #d6a100;
        }
        
        .status-holiday {
            background-color: rgba(111, 66, 193, 0.15);
            color: #6f42c1;
        }
        
        .loading-spinner {
            display: inline-block;
            width: 1.5rem;
            height: 1.5rem;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        #status {
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius);
            font-weight: 500;
            margin-top: 1rem;
        }
        
        .status-success {
            background-color: rgba(75, 181, 67, 0.15);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }
        
        .status-error {
            background-color: rgba(244, 67, 54, 0.15);
            color: var(--danger-color);
            border-left: 4px solid var(--danger-color);
        }
        
        .status-info {
            background-color: rgba(67, 97, 238, 0.15);
            color: var(--primary-color);
            border-left: 4px solid var(--primary-color);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .filter-section .row > div {
                margin-bottom: 1rem;
            }
            
            .dashboard-header h2 {
                font-size: 1.5rem;
            }
        }
        
        /* Animation classes */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .pulse {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(67, 97, 238, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(67, 97, 238, 0); }
            100% { box-shadow: 0 0 0 0 rgba(67, 97, 238, 0); }
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="dashboard-header animate__animated animate__fadeInDown">
        <div class="d-flex justify-content-between align-items-center">
            <h2 class="mb-0"><i class="fas fa-calendar-check me-2"></i> Attendance Dashboard</h2>
            <div class="text-end">
                <span class="badge bg-light text-dark"><i class="fas fa-users me-1"></i> <c:out value="${fn:length(employeeList)}"/> Employees</span>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="filter-section animate__animated animate__fadeIn">
                <h5 class="mb-4"><i class="fas fa-filter me-2"></i>Filter Options</h5>
                <form id="filterForm">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <label for="areaAlias" class="form-label">Area</label>
                            <select id="areaAlias" name="areaAlias" class="form-select">
                                <option value="">All Areas</option>
                                <option value="BMW-MEML-ISNAPUR">BMW-MEML-ISNAPUR</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="empCode" class="form-label">Employee</label>
                            <select id="empCode" name="empCode" class="form-select">
                                <option value="">All Employees</option>
                                <c:forEach var="emp" items="${employeeList}">
                                    <option value="<c:out value="${emp.empCode}"/>"><c:out value="${emp.empCode}"/> - <c:out value="${emp.firstName}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label for="fromDate" class="form-label">From Date</label>
                            <input type="date" id="fromDate" name="fromDate" class="form-control">
                        </div>
                        <div class="col-md-2">
                            <label for="toDate" class="form-label">To Date</label>
                            <input type="date" id="toDate" name="toDate" class="form-control">
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-search me-1"></i> Search
                            </button>
                        </div>
                    </div>
                </form>
                
                <div class="mt-4">
                    <h5 class="mb-3"><i class="fas fa-sync-alt me-2"></i>Reload Attendance Data</h5>
                    <button id="reloadBtn" class="btn btn-outline-secondary">
                        <i class="fas fa-cloud-download-alt me-1"></i> Reload Attendance
                    </button>
                    <div id="status" class="status-info d-none animate__animated animate__fadeIn"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card animate__animated animate__fadeInUp">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-table me-2"></i>Attendance Records</span>
                    <div class="dropdown">
                    <button id="regularizeBtn" class="btn regularize-btn btn-sm me-2">
                            <i class="fas fa-edit me-1"></i> Regularize
                        </button>
                        <div class="dropdown d-inline-block">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-download me-1"></i> Export
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="exportDropdown">
                                <li><a class="dropdown-item" href="#" id="exportExcel"><i class="fas fa-file-excel me-1"></i> Excel</a></li>
                                <li><a class="dropdown-item" href="#" id="exportPDF"><i class="fas fa-file-pdf me-1"></i> PDF</a></li>
                                <li><a class="dropdown-item" href="#" id="exportCSV"><i class="fas fa-file-csv me-1"></i> CSV</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table id="attendanceTable" class="table table-hover w-100">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Emp Code</th>
                                <th>Name</th>
                                <th>Check-In</th>
                                <th>Check-Out</th>
                                <th>Total Hours</th>
                                <th>Status</th>
                                <th>Holiday</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Regularize Modal -->
<div class="modal fade" id="regularizeModal" tabindex="-1" aria-labelledby="regularizeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="regularizeModalLabel"><i class="fas fa-edit me-2"></i>Regularize Attendance</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i> Note: Download the missed punch template by clicking <a href="#" id="downloadTemplate" class="template-link">here</a>, fill it and re-upload here.
                </div>
                <button id="downloadMissedPunchesBtn" class="btn btn-warning btn-sm me-2">
    <i class="fas fa-file-excel me-1"></i> Download Missed Punches
</button>
                <div id="uploadContainer" class="upload-area">
                    <i class="fas fa-cloud-upload-alt fa-3x mb-3" style="color: var(--primary-color);"></i>
                    <h5>Drag & Drop your file here</h5>
                    <p class="text-muted">or</p>
                    <button class="btn btn-primary" id="browseFilesBtn">Browse Files</button>
                    <input type="file" id="fileInput" class="file-input" accept=".xlsx,.xls">
                    <div id="fileName" class="file-name"></div>
                </div>
                
                <div id="uploadStatus" class="d-none"></div>
                
                <div class="mt-3">
                    <h6><i class="fas fa-list-check me-2"></i>Instructions:</h6>
                    <ol>
                        <li>Download the template file</li>
                        <li>Fill in the missing punch details</li>
                        <li>Upload the completed file</li>
                        <li>Click "Regularize" button to update records</li>
                    </ol>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="submitRegularize" class="btn btn-primary" disabled>
                    <i class="fas fa-check-circle me-1"></i> Regularize
                </button>
            </div>
        </div>
    </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
    function getDefaultDates() {
        var now = new Date();
        var from = new Date(now);
        var to = new Date(now);

        if (now.getDate() >= 26) {
            from.setDate(26);
            from.setMonth(now.getMonth());
            to.setDate(25);
            to.setMonth(now.getMonth() + 1);
        } else {
            from.setDate(26);
            from.setMonth(now.getMonth() - 1);
            to.setDate(25);
            to.setMonth(now.getMonth());
        }

        document.getElementById("fromDate").value = from.toISOString().split('T')[0];
        document.getElementById("toDate").value = to.toISOString().split('T')[0];
    }

    $(document).ready(function () {
        getDefaultDates();
        
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });

        var table = $('#attendanceTable').DataTable({
            serverSide: true,
            processing: true,
            responsive: true,
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100],
            ajax: {
                url: '<%= request.getContextPath() %>/attendance/data',
                type: 'POST',
                data: function (d) {
                    d.empCode = $('#empCode').val();
                    d.fromDate = $('#fromDate').val();
                    d.toDate = $('#toDate').val();
                    d.areaAlias = $('#areaAlias').val();
                },
                beforeSend: function() {
                    $('#attendanceTable').addClass('opacity-50');
                },
                complete: function() {
                    $('#attendanceTable').removeClass('opacity-50');
                }
            },
            columns: [
                { 
                    data: 'workDate',
                    render: function(data, type, row) {
                        if (type === 'display') {
                            return new Date(data).toLocaleDateString('en-US', {
                                year: 'numeric',
                                month: 'short',
                                day: 'numeric',
                                weekday: 'short'
                            });
                        }
                        return data;
                    }
                },
                { data: 'empCode' },
                { data: 'employeeName' },
                { 
                    data: 'checkIn',
                    render: function(data) {
                        return data && data !== '00:00' ? data : '-';
                    }
                },
                { 
                    data: 'checkOut',
                    render: function(data) {
                        return data && data !== '00:00' ? data : '-';
                    }
                },
                { 
                    data: 'totalHours',
                    render: function(data) {
                        return data && data !== '00:00:00' ? data : '-';
                    }
                },
                { 
                    data: 'attendanceStatus',
                    render: function(data) {
                        if (!data) return '-';
                        var badgeClass = '';
                        switch(data.toLowerCase()) {
                            case 'present':
                                badgeClass = 'status-present';
                                break;
                            case 'absent':
                                badgeClass = 'status-absent';
                                break;
                            case 'late':
                                badgeClass = 'status-late';
                                break;
                            case 'holiday':
                                badgeClass = 'status-holiday';
                                break;
                            default:
                                badgeClass = 'status-present';
                        }
                        return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                    }
                },
                { 
                    data: 'holidayReason',
                    render: function(data) {
                        return data ? data : '-';
                    }
                }
            ],
            initComplete: function() {
                $('.dataTables_filter input').addClass('form-control');
                $('.dataTables_length select').addClass('form-select');
            },
            drawCallback: function() {
                $('.paginate_button').addClass('btn btn-sm');
                $('.paginate_button.current').addClass('btn-primary');
            }
        });

        $('#filterForm').on('submit', function (e) {
            e.preventDefault();
            table.ajax.reload();
        });
        
        $('#reloadBtn').click(function (e) {
            e.preventDefault();
            var $status = $('#status');
            $status.removeClass('d-none status-error status-success').addClass('status-info');
            $status.html('<i class="fas fa-circle-notch fa-spin me-2"></i> Reloading attendance data...');
            
            $.ajax({
                url: '<%= request.getContextPath() %>/attendance/reload',
                type: 'POST',
                data: {
                    fromDate: $('#fromDate').val(),
                    toDate: $('#toDate').val(),
                    areaAlias: $('#areaAlias').val()
                },
                success: function (response) {
                    $status.removeClass('status-info').addClass('status-success');
                    $status.html('<i class="fas fa-check-circle me-2"></i> ' + response);
                    table.ajax.reload();
                    
                    // Hide status after 5 seconds
                    setTimeout(function() {
                        $status.fadeOut(500, function() {
                            $(this).addClass('d-none').show();
                        });
                    }, 5000);
                },
                error: function (xhr) {
                    $status.removeClass('status-info').addClass('status-error');
                    $status.html('<i class="fas fa-exclamation-circle me-2"></i> Error: ' + (xhr.responseText || 'Failed to reload data'));
                }
            });
        });

        // Export buttons
        $('#exportExcel').click(function(e) {
            e.preventDefault();
            window.location.href = '<%= request.getContextPath() %>/attendance/export?type=excel&fromDate=' + $('#fromDate').val() + '&toDate=' + $('#toDate').val();
        });
        
        $('#exportPDF').click(function(e) {
            e.preventDefault();
            window.location.href = '<%= request.getContextPath() %>/attendance/export?type=pdf&fromDate=' + $('#fromDate').val() + '&toDate=' + $('#toDate').val();
        });
        
        $('#exportCSV').click(function(e) {
            e.preventDefault();
            window.location.href = '<%= request.getContextPath() %>/attendance/export?type=csv&fromDate=' + $('#fromDate').val() + '&toDate=' + $('#toDate').val();
        });
        
        // Regularize button click handler
        $('#regularizeBtn').click(function() {
            $('#regularizeModal').modal('show');
        });
        
        // Download template handler
        $('#downloadTemplate').click(function(e) {
            e.preventDefault();
            window.location.href = '<%= request.getContextPath() %>/downloadTemplate';
        });
        
        // File upload handling
        $('#browseFilesBtn').click(function() {
            $('#fileInput').click();
        });
        
        $('#uploadContainer').on('click', function() {
            $('#fileInput').click();
        });
        
        $('#fileInput').change(function() {
            var file = this.files[0];
            if (file) {
                $('#fileName').text('Selected file: ' + file.name);
                $('#submitRegularize').prop('disabled', false);
            }
        });
        
        // Drag and drop functionality
        $('#uploadContainer').on('dragover', function(e) {
            e.preventDefault();
            $(this).css('border-color', 'Blue');
            $(this).css('background-color', 'rgba(67, 97, 238, 0.1)');
        });
        
        $('#uploadContainer').on('dragleave', function(e) {
            e.preventDefault();
            $(this).css('border-color', '#dee2e6');
            $(this).css('background-color', 'transparent');
        });
        
        $('#uploadContainer').on('drop', function(e) {
            e.preventDefault();
            $(this).css('border-color', '#dee2e6');
            $(this).css('background-color', 'transparent');
            
            var file = e.originalEvent.dataTransfer.files[0];
            if (file && (file.name.endsWith('.xlsx') || file.name.endsWith('.xls'))) {
                $('#fileInput')[0].files = e.originalEvent.dataTransfer.files;
                $('#fileName').text('Selected file: ' + file.name);
                $('#submitRegularize').prop('disabled', false);
            } else {
                $('#uploadStatus').removeClass('d-none').addClass('alert alert-danger')
                    .html('<i class="fas fa-exclamation-circle me-2"></i> Please upload a valid Excel file (.xlsx or .xls)');
            }
        });
        
        // Submit regularize form
        $('#submitRegularize').click(function() {
            var fileInput = $('#fileInput')[0];
            if (fileInput.files.length === 0) {
                return;
            }
            
            var formData = new FormData();
            formData.append('file', fileInput.files[0]);
            
            $('#submitRegularize').prop('disabled', true).html('<span class="loading-spinner me-2"></span> Processing...');
            
            $.ajax({
                url: '<%= request.getContextPath() %>/attendance/regularize',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    $('#uploadStatus').removeClass('d-none alert-danger').addClass('alert alert-success')
                        .html('<i class="fas fa-check-circle me-2"></i> ' + response.message);
                    $('#submitRegularize').html('<i class="fas fa-check-circle me-1"></i> Regularize');
                    
                    // Reload the table data
                    table.ajax.reload();
                    
                    // Close modal after 2 seconds
                    setTimeout(function() {
                        $('#regularizeModal').modal('hide');
                        $('#uploadStatus').addClass('d-none');
                        $('#fileName').text('');
                        $('#fileInput').val('');
                    }, 2000);
                },
                error: function(xhr) {
                    $('#uploadStatus').removeClass('d-none').addClass('alert alert-danger')
                        .html('<i class="fas fa-exclamation-circle me-2"></i> ' + 
                            (xhr.responseJSON ? xhr.responseJSON.message : 'Failed to regularize attendance'));
                    $('#submitRegularize').prop('disabled', false).html('<i class="fas fa-check-circle me-1"></i> Regularize');
                }
            });
        });
        
        // Reset modal when closed
        $('#regularizeModal').on('hidden.bs.modal', function() {
            $('#uploadStatus').addClass('d-none').removeClass('alert alert-success alert-danger').html('');
            $('#fileName').text('');
            $('#fileInput').val('');
            $('#submitRegularize').prop('disabled', true);
        });
     // Add this function to your existing JavaScript
        function downloadAllMissedPunches() {
            // Show loading indicator
            $('#status').removeClass('d-none').addClass('status-info')
                .html('<i class="fas fa-circle-notch fa-spin me-2"></i> Preparing download...');
            
            // Prepare request data
            var requestData = {
                empCode: $('#empCode').val(),
                fromDate: $('#fromDate').val(),
                toDate: $('#toDate').val(),
                areaAlias: $('#areaAlias').val()
            };
            
            // First get all missed punches from server
            $.ajax({
                url: '<%= request.getContextPath() %>/getAllMissedPunches',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(requestData),
                success: function(missedPunches) {
                    if (missedPunches.length === 0) {
                        $('#status').removeClass('status-info').addClass('status-warning')
                            .html('<i class="fas fa-exclamation-circle me-2"></i> No missed punches found');
                        return;
                    }
                    
                    // Then trigger download
                    $.ajax({
                        url: '<%= request.getContextPath() %>/downloadMissedPunches',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(missedPunches),
                        xhrFields: {
                            responseType: 'blob'
                        },
                        success: function(blob) {
                            var link = document.createElement('a');
                            link.href = window.URL.createObjectURL(blob);
                            link.download = 'all_missed_punches.xlsx';
                            link.click();
                            $('#status').addClass('d-none');
                        },
                        error: function(xhr) {
                            $('#status').removeClass('status-info').addClass('status-error')
                                .html('<i class="fas fa-exclamation-circle me-2"></i> Download failed: ' + 
                                     (xhr.responseJSON ? xhr.responseJSON.message : 'Server error'));
                        }
                    });
                },
                error: function(xhr) {
                    $('#status').removeClass('status-info').addClass('status-error')
                        .html('<i class="fas fa-exclamation-circle me-2"></i> Error: ' + 
                             (xhr.responseJSON ? xhr.responseJSON.message : 'Server error'));
                }
            });
        }

        // Update your button click handler
        $('#downloadMissedPunchesBtn').click(downloadAllMissedPunches);
    });
</script>
</body>
</html>