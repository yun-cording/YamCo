<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>
        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">
            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    <span class="badge badge-danger badge-counter">3</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                        신고접수 목록입니다.
                    </h6>
                    <c:forEach items="${recent_report_list }" var="k" end="2">
                    	<a class="dropdown-item d-flex align-items-center" href="/admin/admin_report_recipe.do">
	                        <div class="mr-3">
	                            <div class="icon-circle badge-danger">
	                                <i class="fas fa-exclamation-triangle text-white"></i>
	                            </div>
	                        </div>
                   			<div>
	                            <div class="small text-gray-500">${k.r_time }</div>
	                            <span class="font-weight-bold">${k.u_rcp_title }${k.c_contents }레시피에 신고가 들어왔습니다.</span>
                        	</div>
                	   	 </a>
             	   	 </c:forEach>
                    <a class="dropdown-item text-center small text-gray-500" href="/admin/admin_report_recipe.do">모든 알람 보기</a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - 사용자 프로필 -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${m_nick }님, 안녕하세요</span>
                    <img class="img-profile rounded-circle"
                        src="resources/images/icon_input.png">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        로그아웃
                    </a>
                </div>
            </li>
        </ul>
    </nav>
    <!-- 헤더 끝 -->
</body>
</html>