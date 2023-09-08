<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <!-- Sidebar -->
  <ul class="navbar-nav bg-success sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <!-- <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div> -->
        <div class="sidebar-brand-text mx-3">
            <h3 class="font-weight-bold">냠냠 레시피</h3>
        </div>
    </a>
    <div class="sidebar-heading">
        <h6>관리자 페이지</h6>
    </div>


    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/go_admin_dashboard.do" >
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>대시보드</span></a>
    </li>

    <!-- Nav Item - 관리 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header"></h6>
                <a class="collapse-item" href="/go_admin_contentchk.do">사용자 게시물 관리</a>
                <a class="collapse-item" href="/go_admin_memberchk.do">회원관리</a>
                <a class="collapse-item" href="/admin_report_recipe.do">신고내역 관리</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - 공지사항 -->
    <li class="nav-item">
        <a class="nav-link" href="/go_admin_ppl.do">
            <i class="fas fa-fw fa-table"></i>
            <span>공지사항 / 광고 / 재료추천 관리</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/go_admin_register.do">
            <i class="fas fa-fw fa-table"></i>
            <span>공지사항 배너 등록</span></a>
    </li>
    
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->
    <div class="sidebar-card d-none d-lg-flex">
        <img class="sidebar-card-illustration mb-2" src="/resources/images/icon_tomato_ver2_1.png" alt="...">
        <p class="text-center mt-3">
            <strong>냠냠 레시피 관리자 대시보드</strong>
             <i class="far fa-copyright" ></i>2023 All Rights Reserved
        </p>
    </div>

</ul>
<!-- End of Sidebar -->

</body>
</html>