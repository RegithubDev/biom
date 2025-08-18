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
            });
        });
    </script>
</body>
</html>