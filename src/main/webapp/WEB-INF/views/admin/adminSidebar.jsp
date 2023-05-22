<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/thrifty/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/thrifty/resources/images/admin/adminProfile.jpg" width="160px" height="160px" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Administrator</a>
        </div>
      </div>
      
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item sidebar-member">
            <a href="${pageContext.request.contextPath}/admin/member" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                회원 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-report">
            <a href="${pageContext.request.contextPath}/admin/report" class="nav-link">
              <i class="nav-icon fas fa-exclamation-triangle"></i>
              <p>
                신고
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-board">
            <a href="${pageContext.request.contextPath}/admin/board" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list"></i>
              <p>
                게시판 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-notice">
            <a href="${pageContext.request.contextPath}/admin/notice" class="nav-link">
              <i class="nav-icon fas fa-bullhorn"></i>
              <p>
                공지사항 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-faq">
            <a href="${pageContext.request.contextPath}/admin/faq" class="nav-link">
              <i class="nav-icon fas fa-question-circle"></i>
              <p>
                FAQ
              </p>
            </a>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>