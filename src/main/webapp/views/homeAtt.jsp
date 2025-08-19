<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Compliance Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<<<<<<< HEAD
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
=======
>>>>>>> 0be2277 (Initial commit)
    <style>
        :root {
            --pf-color: #3498db;
            --esi-color: #e74c3c;
            --pt-color: #2ecc71;
            --compliance-color: #9b59b6;
            --header-bg: #2c3e50;
            --header-accent: #4a6491;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--header-bg) 0%, var(--header-accent) 100%);
            padding: 1rem;
        }
        
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 600;
            color: white;
        }
        
        .navbar-nav .nav-link {
            color: white !important;
            font-size: 1.1rem;
            margin-left: 1rem;
        }
        
        .navbar-nav .nav-link:hover {
            color: #f1f1f1 !important;
        }
        
        .dropdown-menu {
            background-color: #fff;
            border: none;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            min-width: 180px;
        }
        
        .dropdown-item {
            font-size: 1rem;
            padding: 0.5rem 1.5rem;
            transition: background-color 0.2s ease;
        }
        
        .dropdown-item:hover {
            background-color: #f1f1f1;
        }
        
        .hexagon-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 30px 0;
        }
        
        .hexagon-btn {
            position: relative;
            width: 180px;
            height: 200px;
            background-color: white;
            clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            border: none;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
        }
        
        .hexagon-btn:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        
        .hexagon-btn.pf {
            background-color: var(--pf-color);
            color: white;
        }
        
        .hexagon-btn.esi {
            background-color: var(--esi-color);
            color: white;
        }
        
        .hexagon-btn.pt {
            background-color: var(--pt-color);
            color: white;
        }
        
        .hexagon-icon {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        
        .hexagon-title {
            font-size: 1.6rem;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .hexagon-subtitle {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .dashboard-title {
            font-size: 2.2rem;
            font-weight: 300;
            margin-bottom: 0.5rem;
        }
        
        .dashboard-subtitle {
            opacity: 0.8;
            font-size: 1rem;
        }
        
        footer {
            margin-top: auto;
            background-color: var(--header-bg);
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .hexagon-btn {
                width: 140px;
                height: 160px;
            }
            
            .hexagon-icon {
                font-size: 2.5rem;
            }
            
            .hexagon-title {
                font-size: 1.3rem;
            }
            
            .hexagon-subtitle {
                font-size: 0.8rem;
            }
            
            .dashboard-title {
                font-size: 1.8rem;
            }
            
            .dashboard-subtitle {
                font-size: 0.9rem;
            }
            
            .navbar-brand {
                font-size: 1.5rem;
            }
            
            .dropdown-menu {
                min-width: 150px;
            }
        }
        
        @media (max-width: 576px) {
            .hexagon-container {
                gap: 15px;
                padding: 20px 0;
            }
            
            .hexagon-btn {
                width: 120px;
                height: 140px;
            }
            
            .hexagon-icon {
                font-size: 2rem;
            }
            
            .hexagon-title {
                font-size: 1.1rem;
            }
            
            .hexagon-subtitle {
                font-size: 0.7rem;
            }
        }
    </style>
</head>
<body>
<<<<<<< HEAD
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
=======
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Compliance Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                    
                    
                   <c:if test="${sessionScope.ROLE eq 'SA' || sessionScope.ROLE eq 'Admin' }">
                        <a class="nav-link dropdown-toggle" href="#" id="mastersDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Masters
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="mastersDropdown">
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user">Users</a></li>
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/pc">Profit Centers</a></li>
                        </ul>
                    </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link btn btn-danger text-white" href="<%=request.getContextPath()%>/logout">Logout</a>
                    </li>
                </ul>
>>>>>>> 0be2277 (Initial commit)
            </div>
        </div>
    </nav>

    <div class="dashboard-header">
        <div class="container text-center">
            <h1 class="dashboard-title animate__animated animate__fadeIn">Welcome to the Dashboard</h1>
            <p class="dashboard-subtitle animate__animated animate__fadeIn animate__delay-1s">Select a category to manage</p>
        </div>
    </div>

    <div class="container">
        <div class="hexagon-container">
            <!-- PF Button -->
            <a href="<%=request.getContextPath()%>/pf" class="hexagon-btn pf">
                <i class="fas fa-piggy-bank hexagon-icon"></i>
                <div class="hexagon-title">PF</div>
                <div class="hexagon-subtitle">Provident Fund</div>
            </a>
            
            <!-- ESI Button -->
            <a href="<%=request.getContextPath()%>/esi" class="hexagon-btn esi">
                <i class="fas fa-hospital-user hexagon-icon"></i>
                <div class="hexagon-title">ESI</div>
                <div class="hexagon-subtitle">Employee State Insurance</div>
            </a>
            
            <!-- PT Button -->
            <a href="<%=request.getContextPath()%>/pt" class="hexagon-btn pt">
                <i class="fas fa-file-invoice-dollar hexagon-icon"></i>
                <div class="hexagon-title">PT</div>
                <div class="hexagon-subtitle">Professional Tax</div>
            </a>
        </div>
    </div>

<<<<<<< HEAD
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
			
							<div class="row g-3">
							    <!-- Check-In -->
								<div class="col-md-3">
								  <label for="checkInDate" class="form-label">Check-In Date</label>
								  <input type="date" id="checkInDate" class="form-control" required>
								</div>
							
								<div class="col-md-3">
								  <label for="checkInTime" class="form-label">Check-In Time</label>
								  <input type="text" id="checkInTime" class="form-control time-picker" placeholder="HH:MM" data-input required>
								</div>
							
								<!-- Check-Out -->
								<div class="col-md-3">
								  <label for="checkOutDate" class="form-label">Check-Out Date</label>
								  <input type="date" id="checkOutDate" class="form-control" required>
								</div>
								
								<div class="col-md-3">
								  <label for="checkOutTime" class="form-label">Check-Out Time</label>
								  <input type="text" id="checkOutTime" class="form-control time-picker" placeholder="HH:MM" data-input required>
								</div>
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
            <jsp:include page="/views/fragments/leaveModal.jsp" />
        </div>
    </div>
</div>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    

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
                        render: function (data, type, row) {
                            if (!data) return '-';

                            var badgeMap = {
                                'ok': 'status-present',
                                'leave': 'status-absent',
                                'present': 'status-late',
                                'holiday': 'status-holiday',
                                'missed out': 'status-warning'
                            };
                            var badgeClass = badgeMap[data.toLowerCase()] || 'status-present';
                            
                            var label = ""; 
                            if (row && row.leaveDuration) {
                                if (row.leaveDuration === 'HALF') {
                                    label = row.leaveHalfSlot === 'FIRST'  ? '1st Half' :
                                            row.leaveHalfSlot === 'SECOND' ? '2nd Half' : '';
                                } else {
                                    label = 'Full Day';
                                }
                            }

                            var tag = label
                            	? ' <span class="half-badge ms-1 text-small" style="width:max-content;"> ' + ' – ' + label + '</span>'
                            	: '';

                            return '<span class="status-badge ' + badgeClass + '">' +
                                     data + tag +
                                   '</span>';
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
            
         	// Utility to merge date and time: yyyy-mm-dd + hh:mm  =>  yyyy-mm-ddThh:mm
			function isoDateTime(dateId, timeId) {
				  const d = $(dateId).val()?.trim();
				  const t = $(timeId).val()?.trim();

				  if (!d || !t) {
				    return "";
				  }
				  
				  return d + "T" + t;
			}
         	
            flatpickr(".time-picker", {
            	  enableTime : true,
            	  noCalendar : true,      // time-only
            	  dateFormat : "H:i",     // 24-hour value sent to JS
            	  time_24hr : true,      // forces 24h UI
            	  minuteIncrement : 1,
            	  allowInput : false,
            	  static : true,
            	  onReady(_, __, inst) {
            	    inst.hourElement.removeAttribute("readonly");
            	    inst.minuteElement.removeAttribute("readonly");
            	  },
            	  // disableMobile: true  // disable native pickers on iOS/Android
           	});

            $('#submitAttendanceBtn').on('click', function () {
                const data = {
                    empCode: $('#attendanceEmp').val().split(' - ')[0],
                    employeeName: $('#attendanceEmp').val().split(' - ')[1],
                    checkIn: isoDateTime('#checkInDate',  '#checkInTime'),
                    checkOut: isoDateTime('#checkOutDate', '#checkOutTime'),
                    remarks: $('#attRemarks').val()
                };

                if (!data.checkIn || !data.checkOut) {
                    alert("Check-In and Check-Out date & time must be provided.");
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
=======
    <footer>
        <div class="container">
            <p class="clearfix mb-0">
                <span>COPYRIGHT &copy; <span id="currentYear"></span> | Powered by 
                <a class="ms-25" href="https://resustainability.com/" target="_blank">Re Sustainability Limited</a>
                <span class="d-none d-sm-inline-block">. All Rights Reserved.</span>
            </span>
        </p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            document.getElementById("currentYear").innerHTML = new Date().getFullYear();

            // Add click animation to hexagon buttons
            $('.hexagon-btn').on('click', function() {
                $(this).addClass('animate__animated animate__pulse');
                setTimeout(() => {
                    $(this).removeClass('animate__animated animate__pulse');
                }, 500);
>>>>>>> 0be2277 (Initial commit)
            });
        });
    </script>
</body>
</html>