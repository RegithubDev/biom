<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<style>
/* Defensive reset */
ul, li {
  margin: 0;
  padding: 0;
  list-style-type: none;
}

/* Force horizontal menu */
.navbar-container {
  position: relative;
  top: 0;
  background-color: #fff;
  z-index: 999;
  width: 100%;
  padding: 10px 20px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.navbar-nav {
  display: flex !important;
  flex-direction: row !important;
  justify-content: flex-start;
  align-items: center;
  gap: 30px;
}

.nav-item {
  flex: 0 0 auto;
}

.nav-item a {
  display: flex;
  align-items: center;
  text-decoration: none;
  color: #444;
  font-weight: 500;
  padding: 8px 12px;
  border-radius: 6px;
  transition: all 0.3s ease;
  background-color: transparent;
}

.nav-item a:hover {
  background-color: #e6f7ed;
}

.nav-item.active a {
  background: linear-gradient(118deg, #30a63e, rgba(53, 244, 56, 0.7));
  box-shadow: 0 0 6px 1px rgba(51, 225, 34, 0.6);
  color: white !important;
}

.nav-item i {
  margin-right: 6px;
}
</style>
</head>
<body>
  <!-- Horizontal menu -->
  <div class="navbar-container">
    <ul class="navbar-nav" id="main-menu-navigation">
      <li class="nav-item" id="att" url="/att">
        <a href="<%= request.getContextPath() %>/att"><i data-feather="home"></i>Dashboard</a>
      </li>
      
    </ul>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const selected = window.localStorage.getItem("selectedOption");
      const currentUrl = window.location.href;

      document.querySelectorAll('.nav-item').forEach(el => el.classList.remove('active'));

      if (selected && document.getElementById(selected)) {
        document.getElementById(selected).classList.add('active');
      } else {
        if (currentUrl.includes('/att')) document.getElementById('att')?.classList.add('active');
        else if (currentUrl.includes('/irm-report')) document.getElementById('reports')?.classList.add('active');
        else if (currentUrl.includes('/irm')) document.getElementById('irm')?.classList.add('active');
        else if (currentUrl.includes('/help')) document.getElementById('help')?.classList.add('active');
      }

      document.querySelectorAll('.nav-item').forEach(item => {
        item.addEventListener('click', function () {
          localStorage.setItem("selectedOption", this.id);
        });
      });

      if (window.feather) feather.replace();
    });
  </script>

  <script src="https://unpkg.com/feather-icons"></script>
</body>
</html>
