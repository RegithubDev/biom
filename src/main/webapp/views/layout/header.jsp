<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style type="text/css">
        .header-navbar {
            background: linear-gradient(90deg, #4a00e0, #8e2de2) !important;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
        }
        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #fff !important;
            font-weight: 600;
            font-size: 1.5rem;
        }
        .card-img {
            max-width: 50px;
            margin-top: 0.5rem;
        }
        .nav-link {
            color: #fff !important;
            font-weight: 500;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #e0e0e0 !important;
        }
        .dropdown-user-link {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .user-nav {
            color: #fff;
            text-align: right;
        }
        .user-name {
            font-size: 1rem;
            font-weight: 600;
        }
        .user-status {
            font-size: 0.85rem;
            color: #e0e0e0;
        }
        .badge {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .logout-btn {
            background: #dc3545;
            color: #fff;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            font-weight: 500;
            transition: background 0.3s;
        }
        .logout-btn:hover {
            background: #c82333;
        }
        .navbar-toggler {
            border: none;
            color: #fff;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.8)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        @media (max-width: 767px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            .card-img {
                max-width: 40px;
            }
            .user-nav {
                text-align: center;
            }
            .navbar-nav {
                padding: 1rem;
            }
            .logout-btn {
                width: 100%;
                text-align: center;
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
    <nav class="header-navbar navbar-expand-lg navbar navbar-fixed align-items-center navbar-shadow navbar-brand-center" data-nav="brand-center">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/home">
                <img src="/reirm/resources/images/smart_logo.png" alt="Logo" class="card-img">
                <span class="brand-text">Employee Attendance Portal</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item dropdown dropdown-user">
                        <a class="nav-link dropdown-toggle dropdown-user-link" id="dropdown-user" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="user-nav d-sm-flex d-none">
                                <span class="user-name">${sessionScope.USER_NAME} | <span class="badge badge-light-secondary">${sessionScope.BASE_ROLE}</span><br>
                                <span>[${sessionScope.BASE_PROJECT}]</span></span>
                                <span class="user-status">${sessionScope.USER_ROLE}</span>
                            </div>
                            <span class="avatar"><i class="fas fa-user-circle fa-2x"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item logout-btn g_id_signout" href="#" id="signout_button"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form action="<%=request.getContextPath()%>/logout" name="logoutForm" id="logoutForm" method="post">
        <input type="hidden" name="email" id="email"/>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(window).on("load", function() {
            if ('${welcome}' !== '') {
                toastr.success("You have successfully logged in. Now you can start to explore!", "👋 Welcome ${sessionScope.USER_NAME}", {
                    closeButton: true,
                    tapToDismiss: false,
                    positionClass: "toast-top-right"
                });
            }
            if ('${NewUser}' !== '') {
                toastr.success("You have been <b>Rewarded with 100 points</b> By Registering into <b>Safety Portal</b>", "Congratulations ${sessionScope.USER_NAME}!", {
                    closeButton: true,
                    tapToDismiss: false,
                    positionClass: "toast-top-right"
                });
            }
            if ('${success}' !== '') {
                toastr.success("${success}", {
                    closeButton: true,
                    tapToDismiss: false,
                    positionClass: "toast-top-right"
                });
            }
            if ('${error}' !== '') {
                toastr.error("${error}", {
                    closeButton: true,
                    tapToDismiss: false,
                    positionClass: "toast-top-right"
                });
            }
            $.blockUI({
                message: '<div class="d-flex justify-content-center align-items-center"><p class="me-50 mb-0">Please wait Fetching data...</p> <div class="spinner-border text-danger" role="status"></div></div>',
                timeout: 1000,
                css: {
                    backgroundColor: 'transparent',
                    color: '#fff',
                    border: '0'
                },
                overlayCSS: {
                    opacity: 0.8
                }
            });
        });

        const signoutButton = document.getElementById("signout_button");
        signoutButton.onclick = () => {
            google.accounts.id.disableAutoSelect();
            console.log('User signed out.');
            $("#email").val('');
            $("#logoutForm").submit();
        };
    </script>
</body>
</html>