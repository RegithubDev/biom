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
		    .scrollable-table {
		    overflow-x: auto;
		    width: 100%;
		}
		#attendanceTable {
		    min-width: 1000px;
		    border-collapse: collapse;
		}
    
        :root {
            --primary-color: #1e3a8a;
            --secondary-color: #2563eb;
            --accent-color: #60a5fa;
            --light-color: #f1f5f9;
            --dark-color: #0f172a;
            --success-color: #22c55e;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --border-radius: 12px;
            --box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(to bottom, #f8fafc, #e2e8f0);
            color: var(--dark-color);
            line-height: 1.7;
            overflow-x: hidden;
        }

        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 2.5rem;
            position: relative;
            overflow: hidden;
        }

        .dashboard-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,%3Csvg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cpath d="M2 2l16 16M2 18L18 2" stroke="%23ffffff" stroke-opacity=".1" stroke-width="2"/%3E%3C/g%3E%3C/svg%3E');
            opacity: 0.1;
        }

        .card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
            margin-bottom: 2rem;
            background: white;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background: linear-gradient(to right, #ffffff, #f8fafc);
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-weight: 700;
            padding: 1.25rem 2rem;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
            color: var(--primary-color);
        }

        .filter-section {
            background: white;
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 2rem;
            border-left: 4px solid var(--primary-color);
        }

        .form-control, .form-select {
            border-radius: var(--border-radius);
            padding: 0.75rem 1.25rem;
            border: 1px solid #e2e8f0;
            transition: var(--transition);
            background: #f8fafc;
            font-size: 0.95rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
            background: white;
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            border-radius: var(--border-radius);
            padding: 0.75rem 1.75rem;
            font-weight: 600;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .btn-primary:hover {
            background: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
        }

        .btn-primary::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .btn-primary:hover::after {
            left: 100%;
        }

        .btn-outline-secondary {
            border-radius: var(--border-radius);
            border: 1px solid #e2e8f0;
            color: var(--dark-color);
            transition: var(--transition);
        }

        .btn-outline-secondary:hover {
            background: var(--light-color);
            border-color: var(--accent-color);
            color: var(--primary-color);
        }

        #attendanceTable_wrapper {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 2rem;
        }

        table.dataTable {
            margin-top: 0 !important;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 0.95rem;
        }

        table.dataTable thead th {
            background: #f8fafc;
            padding: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
            border-bottom: 2px solid #e2e8f0;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        table.dataTable tbody td {
            padding: 1rem 1.25rem;
            vertical-align: middle;
            border-top: 1px solid #f1f5f9;
            transition: background 0.2s;
        }

        table.dataTable tbody tr:hover {
            background: #f8fafc;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: var(--transition);
        }

        #attendanceTable tbody tr.row-editing {
            background: #fef3c7 !important;
        }

        #attendanceTable tbody tr.row-saved {
            background: #d1fae5 !important;
        }

        .status-present {
            background: rgba(34, 197, 94, 0.1);
            color: var(--success-color);
        }

        .status-absent {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }

        .status-late {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }

        .status-holiday {
            background: rgba(124, 58, 237, 0.1);
            color: #7c3aed;
        }

        .loading-spinner {
            width: 1.75rem;
            height: 1.75rem;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top-color: white;
            animation: spin 0.8s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        #status {
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            font-weight: 500;
            margin-top: 1.5rem;
            border-left: 5px solid;
        }

        .status-success {
            background: rgba(34, 197, 94, 0.1);
            color: var(--success-color);
            border-left-color: var(--success-color);
        }

        .status-error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
            border-left-color: var(--danger-color);
        }

        .status-info {
            background: rgba(37, 99, 235, 0.1);
            color: var(--primary-color);
            border-left-color: var(--primary-color);
        }

        .modal-content {
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            border: none;
        }

        .modal-header {
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            padding: 1.5rem 2rem;
        }

        .modal-title {
            color: var(--primary-color);
            font-weight: 700;
        }

        .upload-area {
            border: 2px dashed #e2e8f0;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .upload-area:hover {
            border-color: var(--accent-color);
            background: rgba(37, 99, 235, 0.05);
        }

        @media (max-width: 768px) {
            .filter-section .row > div {
                margin-bottom: 1.5rem;
            }

            .dashboard-header h2 {
                font-size: 1.75rem;
            }

            .card-header {
                padding: 1rem 1.5rem;
            }
        }

        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .pulse {
            animation: pulse 2s infinite ease-in-out;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(37, 99, 235, 0.4); }
            70% { box-shadow: 0 0 0 12px rgba(37, 99, 235, 0); }
            100% { box-shadow: 0 0 0 0 rgba(37, 99, 235, 0); }
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- BEGIN: Header-->
    <jsp:include page="../views/layout/header.jsp"></jsp:include> 
    <jsp:include page="../views/layout/menu.jsp"></jsp:include> 

    <div class="row">
        <div class="col-lg-12">
            <div class="filter-section animate__animated animate__fadeIn bg-light p-3 rounded-3 shadow-sm">
                <form id="filterForm" class="mb-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0"><i class="fas fa-filter me-2 text-primary"></i>Filter Options</h5>
                        <button id="reloadBtn" class="btn btn-sm btn-outline-secondary">
                            <i class="fas fa-cloud-download-alt me-1"></i> Load new Data
                        </button>
                    </div>
                    <div class="row g-2">
                        <div class="col-md-3">
                            <label for="areaAlias" class="form-label small fw-bold">Area</label>
                            <select id="areaAlias" name="areaAlias" class="form-select form-select-sm">
                                <option value="">All Areas</option>
                                <option value="BMW-MEML-ISNAPUR" selected>BMW-MEML-ISNAPUR</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="empCode" class="form-label small fw-bold">Employee</label>
                            <select id="empCode" name="empCode" class="form-select form-select-sm">
                                <option value="">All Employees</option>
                                <c:forEach var="emp" items="${employeeList}">
                                    <option value="<c:out value="${emp.empCode}"/>"><c:out value="${emp.empCode}"/> - <c:out value="${emp.firstName}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label for="fromDate" class="form-label small fw-bold">From Date</label>
                            <input type="date" id="fromDate" name="fromDate" class="form-control form-control-sm">
                        </div>
                        <div class="col-md-2">
                            <label for="toDate" class="form-label small fw-bold">To Date</label>
                            <input type="date" id="toDate" name="toDate" class="form-control form-control-sm">
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-sm btn-primary px-3">
                                <i class="fas fa-search me-1"></i> Search
                            </button>
                        </div>
                    </div>
                </form>
                <div id="status" class="status-info small text-muted d-none animate__animated animate__fadeIn"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card animate__animated animate__fadeInUp">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-table me-2"></i>Attendance Records</span>
                    <div class="text-end">
                        <span class="badge bg-light text-dark"><i class="fas fa-users me-1"></i><span id="count"></span> Employees</span>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-sm btn-success me-2" data-bs-toggle="modal" id="addAttendanceBtn" data-bs-target="#addAttendanceModal">
                            <i class="fas fa-user-clock me-1"></i> Add Attendance
                        </button>
                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" id="applyLeaveBtn" data-bs-target="#applyLeaveModal">
                            <i class="fas fa-plane-departure me-1"></i> Apply Leave
                        </button>
                        <div class="dropdown d-inline-block">
                            <button class="btn btn-sm btn-dark" id="exportExcel" data-bs-toggle="modal">
                                <i class="fas fa-file-excel me-1"></i> Export Attendance
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body scrollable-table">
                    <table id="attendanceTable" class="table table-hover w-100">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Emp Code</th>
                                <th>Name</th>
                                <th>Check-In</th>
                                <th>Check-Out</th>
                                <th>Total Hours</th>
                                <th>Overtime</th>
                                <th>Status</th>
                                <th>Holiday</th>
                                <th>Regularize</th>
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
                    <div id="status1" class="status-info d-none animate__animated animate__fadeIn"></div>
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

    <!-- Add Attendance Modal -->
    <div class="modal fade" id="addAttendanceModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form id="addAttendanceForm">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Attendance Record</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="attendanceEmp" class="form-label">Employee</label>
                                <select class="form-select" id="attendanceEmp" name="empCode" required></select>
                            </div>
                            <div class="col-md-6">
                                <label for="attendanceDate" class="form-label">Work Date</label>
                                <input type="date" id="attendanceDate" name="work_date" class="form-control" max="{{today}}" required>
                            </div>
                            <div class="col-md-6">
                                <label for="checkIn" class="form-label">Check-In</label>
                                <input type="datetime-local" id="checkIn" name="day_start" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="checkOut" class="form-label">Check-Out</label>
                                <input type="datetime-local" id="checkOut" name="day_end" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="shiftType" class="form-label">Shift</label>
                                <select id="shiftType" name="shift_type" class="form-select">
                                    <option value="Shift A">Shift A</option>
                                    <option value="General Shift">General Shift</option>
                                    <option value="Shift B">Shift B</option>
                                    <option value="Shift C">Shift C</option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label for="attRemarks" class="form-label">Remarks</label>
                                <textarea id="attRemarks" name="remarks" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="submitAttendanceBtn" class="btn btn-success">Submit</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Apply Leave Modal -->
   <div class="modal fade" id="applyLeaveModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="applyLeaveForm">
                <div class="modal-header">
                    <h5 class="modal-title">Apply Leave</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="leaveEmp" class="form-label">Employee</label>
                        <select class="form-select" id="leaveEmp" name="empCode" required></select>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="multiDayCheckbox">
                        <label class="form-check-label" for="multiDayCheckbox">Apply for multiple days</label>
                    </div>

                    <!-- From/To Dates (Visible if multi-day selected) -->
                    <div class="mb-3 multi-day-section d-none">
                        <label for="leaveFrom" class="form-label">From Date</label>
                        <input type="date" id="leaveFrom" name="from_date" class="form-control">
                    </div>
                    <div class="mb-3 multi-day-section d-none">
                        <label for="leaveTo" class="form-label">To Date</label>
                        <input type="date" id="leaveTo" name="to_date" class="form-control">
                    </div>

                    <!-- Single Day Section -->
                    <div class="mb-3 single-day-section">
                        <label for="leaveDate" class="form-label">Leave Date</label>
                        <input type="date" id="leaveDate" name="work_date" class="form-control">
                    </div>

                    <div class="mb-3 single-day-section">
                        <label class="form-label d-block">Duration</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="duration" id="fullDay" value="Full" checked>
                            <label class="form-check-label" for="fullDay">Full Day</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="duration" id="halfDay" value="Half">
                            <label class="form-check-label" for="halfDay">Half Day</label>
                        </div>
                    </div>

                    <div class="mb-3 single-day-section half-day-options d-none">
                        <label for="halfType" class="form-label">Half Day Type</label>
                        <select id="halfType" name="half_day_type" class="form-select">
                            <option value="First Half">First Half</option>
                            <option value="Second Half">Second Half</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="leaveType" class="form-label">Leave Type</label>
                        <select id="leaveType" name="leave_reason" class="form-select">
                            <option value="SL">Sick Leave</option>
                            <option value="CL">Casual Leave</option>
                            <option value="EL">Earned Leave</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="leaveRemarks" class="form-label">Remarks</label>
                        <textarea id="leaveRemarks" name="remarks" class="form-control"></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" id="submitLeaveBtn" class="btn btn-primary">Apply</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
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
                from.setMonth(now.getMonth() - 1);
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
            const $select = $('#empCode');
            $select.empty().append('<option value="">All Employees</option>');

            $.ajax({
                url: '<%= request.getContextPath() %>/attendance/employees',
                method: 'GET',
                success: function (data) {
                    $('#count').text(data.length);
                    data.forEach(emp => {
                        $select.append('<option value="' + emp.empCode + '">' + emp.empCode + ' - ' + emp.employeeName + '</option>');
                    });
                },
                error: function () {
                    alert('Failed to load employee data');
                }
            });

            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });

            $('#attendanceTable').on('click', '.edit-btn', function () {
                const $row = $(this).closest('tr');
                const rowData = $('#attendanceTable').DataTable().row($row).data();

                const checkInValue = rowData.checkIn;
                const checkOutValue = rowData.checkOut || new Date(new Date(checkInValue).getTime() + 8 * 60 * 60 * 1000).toISOString().slice(0, 16);

                const startSpan = $row.find('.day-start');
                const endSpan = $row.find('.day-end');

                startSpan.html('<input type="datetime-local" class="form-control form-control-sm start-time" value="' + checkInValue + '">');
                endSpan.html('<input type="datetime-local" class="form-control form-control-sm end-time" value="' + checkOutValue + '">');

                const $btnCell = $(this).closest('td');
                $btnCell.html(
                    '<button class="btn btn-sm btn-success update-btn">Update</button> ' +
                    '<button class="btn btn-sm btn-secondary cancel-btn">Cancel</button>'
                );

                const autoCalculate = () => {
                    const startVal = $row.find('.start-time').val();
                    const endVal = $row.find('.end-time').val();

                    if (startVal && endVal) {
                        const start = new Date(startVal);
                        const end = new Date(endVal);
                        if (end <= start) {
                            alert("Check-Out must be after Check-In");
                            return;
                        }

                        const diffSec = Math.floor((end - start) / 1000);
                        const totalHrs = Math.floor(diffSec / 3600);
                        const totalMin = Math.floor((diffSec % 3600) / 60);
                        const overtimeHrs = totalHrs > 8 ? totalHrs - 8 : 0;

                        $row.find('td:eq(5)').html(totalHrs + 'h ' + totalMin + 'm');
                        $row.find('td:eq(6)').html(overtimeHrs + 'h');

                       /*  const timePart = startVal.split('T')[1];
                        let shift = '-';
                        if (timePart >= '03:45:00' && timePart < '08:45:00') shift = 'Shift A';
                        else if (timePart >= '08:45:00' && timePart < '12:45:00') shift = 'General Shift';
                        else if (timePart >= '12:45:00' && timePart < '21:15:00') shift = 'Shift B';
                        else shift = 'Shift C';

                        $row.find('td:eq(5)').html(shift); */
                    }
                };

                autoCalculate();
                $row.find('.start-time, .end-time').on('change', autoCalculate);
            });

            $('#attendanceTable').on('click', '.update-btn', function () {
                const $row = $(this).closest('tr');
                const rowData = $('#attendanceTable').DataTable().row($row).data();

                const checkIn = $row.find('.start-time').val();
                const checkOut = $row.find('.end-time').val();

                if (!checkIn || !checkOut) {
                    alert("Both Check-In and Check-Out are required.");
                    return;
                }

                const data = {
                    empCode: rowData.empCode,
                    workDate: rowData.workDate,
                    checkIn: checkIn.replace('T', ' '),
                    checkOut: checkOut.replace('T', ' ')
                };

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/regularize',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function () {
                        alert("Record updated successfully");
                        $('#attendanceTable').DataTable().ajax.reload(null, false);
                    },
                    error: function () {
                        alert("Update failed");
                    }
                });
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
                    beforeSend: function () {
                        $('#attendanceTable').addClass('opacity-50');
                    },
                    complete: function () {
                        $('#attendanceTable').removeClass('opacity-50');
                    }
                },
                columns: [
                    {
                        data: 'workDate',
                        render: function (data, type) {
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
                        render: function (data) {
                            return '<span class="day-start">' + (data || '-') + '</span>';
                        }
                    },
                    {
                        data: 'checkOut',
                        render: function (data) {
                            return '<span class="day-end">' + (data || '-') + '</span>';
                        }
                    },
                    {
                        data: 'totalWorkingHours',
                        render: function (data) {
                            if (!data || data === '00:00:00') return '0';

                            let val = parseFloat(data);
                            if (isNaN(val)) return data;

                            let hrs = Math.floor(val);
                            let mins = Math.round((val - hrs) * 60);
                            return hrs+' Hrs '+mins+' Min';
                        }
                    },
                    {
                        data: null,
                        render: function (data, type, row) {
                            let total = parseFloat(row.totalWorkingHours);
                            if (isNaN(total) || total <= 8) return '0';

                            let ot = total - 8;
                            let hrs = Math.floor(ot);
                            let mins = Math.round((ot - hrs) * 60);

                            return hrs+' Hrs '+mins+' Min';
                        }
                    },
                    {
                        data: 'attendanceStatus',
                        render: function (data) {
                            if (!data) return '-';
                            var badgeMap = {
                                'ok': 'status-present',
                                'leave': 'status-absent',
                                'present': 'status-late',
                                'holiday': 'status-holiday',
                                'missed out': 'status-warning'
                            };
                            var badgeClass = badgeMap[data.toLowerCase()] || 'status-present';
                            return '<span class="status-badge ' + badgeClass + '">' + data + '</span>';
                        }
                    },
                    {
                        data: 'holidayReason',
                        render: function (data) {
                            return data || '-';
                        }
                    },
                    {
                        data: null,
                        orderable: false,
                        render: function (data, type, row) {
                            const now = new Date();
                            const todayStr = now.toISOString().split('T')[0];
                            const workDateStr = row.workDate;
                            const isToday = workDateStr === todayStr;

                            let checkInTime = null;
                            let checkOutTime = null;

                            try {
                                if (row.workDate && row.checkIn && row.checkIn.trim() !== '') {
                                    let ci = row.checkIn.trim();
                                   
                                    checkInTime = new Date(ci);
                                }

                                if (row.workDate && row.checkOut && row.checkOut.trim() !== '') {
                                    let co = row.checkOut.trim();
                                   
                                    checkOutTime = new Date(co);
                                }
                            } catch (err) {
                                console.warn('Invalid checkIn/checkOut:', err);
                            }

                            // 1. Leave check
                            if (row.isLeave === 1 || (row.leaveReason && row.leaveReason.trim() !== '')) {
                                return '<span class="leave-row-flag" data-leave="' + row.empCode + ' - ' + row.leaveReason + '" data-date="' + row.workDate + '">Leave</span>';
                            }

                            // 2. Same in and out (missing punch)
                            if (row.checkIn && row.checkOut && row.checkIn === row.checkOut) {
                                return '<button class="btn btn-sm btn-warning regularize-btn">Regularize</button>';
                            }

                            // 3. Today and Check-In within 6 hrs
                            if (isToday && checkInTime && !isNaN(checkInTime.getTime())) {
                                const diffInHours = (now - checkInTime) / (1000 * 60 * 60);
                                if (diffInHours <= 6) {
                                    return '<span class="status-badge status-success">Today</span>';
                                }
                            }

                            // 4. Missing Check-Out
                            if (!row.checkOut || row.checkOut.trim() === '') {
                                return '<button class="btn btn-sm btn-warning regularize-btn">Regularize</button>';
                            }

                            // 5. Default: Edit button
                            return '<button class="btn btn-sm btn-outline-primary edit-btn">Edit</button>';
                        }



                    }
                ],
                initComplete: function () {
                    $('.dataTables_filter input').addClass('form-control');
                    $('.dataTables_length select').addClass('form-select');
                },
                drawCallback: function () {
                    $('.paginate_button').addClass('btn btn-sm');
                    $('.paginate_button.current').addClass('btn-primary');

                    $('#attendanceTable tbody tr').each(function () {
                        const $row = $(this);
                        const flag = $row.find('.leave-row-flag');
                        if (flag.length > 0) {
                            const emp = flag.data('leave');
                            const date = new Date(flag.data('date')).toLocaleDateString('en-IN', {
                                year: 'numeric', month: 'short', day: 'numeric', weekday: 'short'
                            });
                            const fullText = '<strong>' + emp + '</strong> is on <strong>Leave</strong> for <strong>' + date + '</strong>';
                            $row.html('<td colspan="11" class="text-center text-danger fw-bold bg-light">' + fullText + '</td>');
                        }
                    });
                }
            });

            $('#attendanceTable').on('click', '.regularize-btn', function () {
                const $row = $(this).closest('tr').addClass('row-editing');
                const rowData = $('#attendanceTable').DataTable().row($row).data();

                const checkInValue = rowData.checkIn;
                const checkOutValue = rowData.checkOut || new Date(new Date(checkInValue).getTime() + 8 * 60 * 60 * 1000).toISOString().slice(0, 16);

                const startSpan = $row.find('.day-start');
                const endSpan = $row.find('.day-end');

                startSpan.html('<input type="datetime-local" class="form-control form-control-sm start-time" value="' + checkInValue + '">');
                endSpan.html('<input type="datetime-local" class="form-control form-control-sm end-time" value="' + checkOutValue + '">');

                const $btnCell = $(this).closest('td');
                $btnCell.html(
                    '<button class="btn btn-sm btn-success update-btn">Update</button> ' +
                    '<button class="btn btn-sm btn-secondary cancel-btn">Cancel</button>'
                );

                const autoCalculate = () => {
                    const startVal = $row.find('.start-time').val();
                    const endVal = $row.find('.end-time').val();

                    if (startVal && endVal) {
                        const start = new Date(startVal);
                        const end = new Date(endVal);

                        if (end <= start) {
                            alert("Check-Out must be after Check-In");
                            return;
                        }

                        const diffSec = Math.floor((end - start) / 1000);
                        const totalHrs = Math.floor(diffSec / 3600);
                        const totalMin = Math.floor((diffSec % 3600) / 60);
                        const overtimeHrs = totalHrs > 8 ? totalHrs - 8 : 0;

                        $row.find('td:eq(5)').html(totalHrs + 'h ' + totalMin + 'm');
                        $row.find('td:eq(6)').html(overtimeHrs + 'h');

                       /*  const timePart = startVal.split('T')[1];
                        let shift = '-';
                        if (timePart >= '03:45:00' && timePart < '08:45:00') shift = 'Shift A';
                        else if (timePart >= '08:45:00' && timePart < '12:45:00') shift = 'General Shift';
                        else if (timePart >= '12:45:00' && timePart < '21:15:00') shift = 'Shift B';
                        else shift = 'Shift C';

                        $row.find('td:eq(5)').html(shift); */
                    }
                };

                autoCalculate();
                $row.find('.start-time, .end-time').on('change', autoCalculate);
            });

            $('#attendanceTable').on('click', '.update-btn', function () {
                const $row = $(this).closest('tr');
                $row.removeClass('row-editing').addClass('row-saved');
            });

            $('#attendanceTable').on('click', '.cancel-btn', function () {
                const $row = $(this).closest('tr');
                location.reload();
            });

            $('#attendanceTable').on('click', '.update-btn', function () {
                const $row = $(this).closest('tr');
                const rowData = $('#attendanceTable').DataTable().row($row).data();

                const startVal = $row.find('.start-time').val();
                const endVal = $row.find('.end-time').val();

                if (!startVal || !endVal) {
                    alert("Please select both Check-In and Check-Out times.");
                    return;
                }

                const startDate = new Date(startVal);
                const endDate = new Date(endVal);

                if (endDate <= startDate) {
                    alert("Check-Out must be after Check-In.");
                    return;
                }

                const diffSec = Math.floor((endDate - startDate) / 1000);
                const totalHrs = Math.floor(diffSec / 3600);
                const totalMin = Math.floor((diffSec % 3600) / 60);
                const overtimeHrs = totalHrs > 8 ? totalHrs - 8 : 0;

                $row.find('td:eq(5)').html(totalHrs + 'h ' + totalMin + 'm');
                $row.find('td:eq(6)').html(overtimeHrs + 'h');

               /*  const checkInTime = startVal.split('T')[1];
                let shift = '-';
                if (checkInTime >= '03:45:00' && checkInTime < '08:45:00') shift = 'Shift A';
                else if (checkInTime >= '08:45:00' && checkInTime < '12:45:00') shift = 'General Shift';
                else if (checkInTime >= '12:45:00' && checkInTime < '21:15:00') shift = 'Shift B';
                else shift = 'Shift C';
                $row.find('td:eq(5)').html(shift); */

                $row.find('.day-start').html(startVal.split('T')[1]);
                $row.find('.day-end').html(endVal.split('T')[1]);

                $(this).closest('td').html('<span class="text-success">Saved</span>');

                const payload = {
                    empCode: rowData.empCode,
                    workDate: rowData.workDate.split('T')[0],
                    checkIn: startVal,
                    checkOut: endVal,
                    totalSeconds: diffSec,
                    shiftType: shift
                };
                regularizeUpdate(payload);
            });

            $('#attendanceTable').on('click', '.cancel-btn', function () {
                const $row = $(this).closest('tr');
                const rowData = $('#attendanceTable').DataTable().row($row).data();

                $row.find('.day-start').html(rowData.dayStart || '-');
                $row.find('.day-end').html(rowData.dayEnd || '-');

                $(this).closest('td').html('<button class="btn btn-sm btn-warning regularize-btn">Regularize</button>');
            });

            function regularizeUpdate(data) {
                if (!data.checkIn || !data.checkOut) {
                    alert("Check-In and Check-Out values cannot be empty.");
                    return;
                }

                data.checkIn = data.checkIn.replace('T', ' ');
                data.checkOut = data.checkOut.replace('T', ' ');

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/regularize',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("Regularization successful");
                    },
                    error: function () {
                        alert("Regularization failed");
                    }
                });
            }

            $('#filterForm').on('submit', function (e) {
                e.preventDefault();
                table.ajax.reload();
            });

            var reloadInterval;

            $('#reloadBtn').click(function (e) {
                e.preventDefault();

                var $status = $('#status');
                let dots = 0;
                let seconds = 0;

                $status.removeClass('d-none status-error status-success').addClass('status-info');
                $status.html('<i class="fas fa-circle-notch fa-spin me-2"></i> Reloading attendance data');

                reloadInterval = setInterval(function () {
                    seconds++;
                    dots = (dots + 1) % 4;
                    let dotString = '.'.repeat(dots);
                    $status.html('<i class="fas fa-circle-notch fa-spin me-2"></i> Reloading attendance data' + dotString + ' <span class="text-muted">(' + seconds + 's)</span>');
                }, 1000);

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/reload',
                    type: 'POST',
                    data: {
                        fromDate: $('#fromDate').val(),
                        toDate: $('#toDate').val(),
                        areaAlias: $('#areaAlias').val()
                    },
                    success: function (response) {
                        clearInterval(reloadInterval);
                        $status.removeClass('status-info').addClass('status-success');
                        $status.html('<i class="fas fa-check-circle me-2"></i> ' + response);
                        table.ajax.reload();

                        setTimeout(function () {
                            $status.fadeOut(500, function () {
                                $(this).addClass('d-none').show();
                            });
                        }, 5000);
                    },
                    error: function (xhr) {
                        clearInterval(reloadInterval);
                        $status.removeClass('status-info').addClass('status-error');
                        $status.html('<i class="fas fa-exclamation-circle me-2"></i> Error: ' + (xhr.responseText || 'Failed to reload data'));
                    }
                });
            });

            $('#exportExcel').click(function(e) {
                e.preventDefault();
                window.location.href = '<%= request.getContextPath() %>/attendance/export?type=excel&fromDate=' + $('#fromDate').val() + '&toDate=' + $('#toDate').val();
            });

            $('#exportCSV').click(function(e) {
                e.preventDefault();
                window.location.href = '<%= request.getContextPath() %>/attendance/export?type=csv&fromDate=' + $('#fromDate').val() + '&toDate=' + $('#toDate').val();
            });

            $('#regularizeBtn').click(function() {
                $('#regularizeModal').modal('show');
            });

            $('#downloadTemplate').click(function(e) {
                e.preventDefault();
                window.location.href = '<%= request.getContextPath() %>/downloadTemplate';
            });

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

            $('#uploadContainer').on('dragover', function(e) {
                e.preventDefault();
                $(this).css('border-color', 'Blue');
                $(this).css('background-color', 'rgba(37, 99, 235, 0.1)');
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

                        table.ajax.reload();

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

            $('#regularizeModal').on('hidden.bs.modal', function() {
                $('#uploadStatus').addClass('d-none').removeClass('alert alert-success alert-danger').html('');
                $('#fileName').text('');
                $('#fileInput').val('');
                $('#submitRegularize').prop('disabled', true);
            });

            function downloadAllMissedPunches() {
                $('#status1').removeClass('d-none').addClass('status-info')
                    .html('<i class="fas fa-circle-notch fa-spin me-2"></i> Preparing download...');

                var requestData = {
                    empCode: $('#empCode').val(),
                    fromDate: $('#fromDate').val(),
                    toDate: $('#toDate').val(),
                    areaAlias: $('#areaAlias').val()
                };

                $.ajax({
                    url: '<%= request.getContextPath() %>/getAllMissedPunches',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(requestData),
                    success: function(missedPunches) {
                        if (missedPunches.length === 0) {
                            $('#status1').removeClass('status-info').addClass('status-warning')
                                .html('<i class="fas fa-exclamation-circle me-2"></i> No missed punches found');
                            return;
                        }

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
                                $('#status1').addClass('d-none');
                            },
                            error: function(xhr) {
                                $('#status1').removeClass('status-info').addClass('status-error')
                                    .html('<i class="fas fa-exclamation-circle me-2"></i> Download failed: ' +
                                        (xhr.responseJSON ? xhr.responseJSON.message : 'Server error'));
                            }
                        });
                    },
                    error: function(xhr) {
                        $('#status1').removeClass('status-info').addClass('status-error')
                            .html('<i class="fas fa-exclamation-circle me-2"></i> Error: ' +
                                (xhr.responseJSON ? xhr.responseJSON.message : 'Server error'));
                    }
                });
            }

            $('#downloadMissedPunchesBtn').click(downloadAllMissedPunches);

            $('#submitAttendanceBtn').on('click', function () {
                const data = {
                    empCode: $('#attendanceEmp').val().split(' - ')[0],
                    employeeName: $('#attendanceEmp').val().split(' - ')[1],
                    checkIn: $('#checkIn').val(),
                    checkOut: $('#checkOut').val(),
                    remarks: $('#attRemarks').val()
                };

                if (!data.checkIn || !data.checkOut) {
                    alert("Check-In and Check-Out must be provided.");
                    return;
                }

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/add',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function () {
                        $('#addAttendanceModal').modal('hide');
                        $('#attendanceTable').DataTable().ajax.reload(null, false);
                    },
                    error: function () {
                        alert("Error submitting attendance");
                    }
                });
            });

            $('#submitLeaveBtn').on('click', function () {
                const data = {
                    empCode: $('#leaveEmp').val().split(' - ')[0],
                    employeeName: $('#leaveEmp').val().split(' - ')[1],
                    workDate: $('#leaveDate').val(),
                    leaveType: $('#leaveType').val(),
                    remarks: $('#leaveRemarks').val()
                };

                if (!data.workDate || !data.leaveType) {
                    alert("Please provide both leave date and type.");
                    return;
                }

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/leave',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function () {
                        $('#applyLeaveModal').modal('hide');
                        $('#attendanceTable').DataTable().ajax.reload(null, false);
                    },
                    error: function () {
                        alert("Error submitting leave");
                    }
                });
            });

            function populateEmployeeDropdown(selectId) {
                const $select = $('#' + selectId);
                $select.empty().append('<option value="">Select Employee</option>');

                $.ajax({
                    url: '<%= request.getContextPath() %>/attendance/employees',
                    method: 'GET',
                    success: function (data) {
                        data.forEach(emp => {
                            $select.append('<option value="' + emp.empCode + '">' + emp.empCode + ' - ' + emp.employeeName + '</option>');
                        });
                    },
                    error: function () {
                        alert('Failed to load employee data');
                    }
                });
            }

            $('#applyLeaveBtn').on('click', function () {
                populateEmployeeDropdown('leaveEmp');
                $('#applyLeaveModal').modal('show');
            });

            $('#addAttendanceBtn').on('click', function () {
                populateEmployeeDropdown('attendanceEmp');
                $('#addAttendanceModal').modal('show');
            });
        });
    </script>
</body>
</html>