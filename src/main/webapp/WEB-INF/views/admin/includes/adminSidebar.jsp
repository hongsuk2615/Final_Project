<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar main-sidebar-custom sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
	    <a href="${contextPath}/admin/home" class="brand-link">
	      <img src="/thrifty/resources/images/main/icon/logo1.1.png" alt="AdminLTE Logo" class="brand-image">
	      <span class="brand-text font-weight-light">알뜰살뜰</span>
	    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/thrifty/resources/images/admin/adminProfile.jpg" width="160px" height="160px" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="${contextPath}/admin/adminInfo" class="d-block">${loginUser.nickName}</a>
        </div>
      </div>
      
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item sidebar-member">
            <a href="${contextPath}/admin/member?tab=all&currentPage=1" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                회원 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-report">
            <a href="${contextPath}/admin/report?catUNo=0&type=board&currentPage=1" class="nav-link">
              <i class="nav-icon fas fa-exclamation-triangle"></i>
              <p>
                신고
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-board">
            <a href="${contextPath}/admin/board?catUNo=0&currentPage=1" class="nav-link">
              <i class="nav-icon fas fa-clipboard-list"></i>
              <p>
                게시판 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-notice">
            <a href="${contextPath}/admin/notice?catSNo=0&currentPage=1" class="nav-link">
              <i class="nav-icon fas fa-bullhorn"></i>
              <p>
                공지사항 관리
              </p>
            </a>
          </li>
          
          <li class="nav-item sidebar-faq">
            <a href="${contextPath}/admin/faq?catSNo=0&currentPage=1" class="nav-link">
              <i class="nav-icon fas fa-question-circle"></i>
              <p>FAQ</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
    <!-- fixed button-->
    <div class="sidebar sidebar-custom">
    	<div class="nav nav-sidebar nav-pills">
		    <div class="nav-item">
		    	<a href="${contextPath}/admin/logout"class="nav-link">
		    		<i class="nav-icon fas fa-sign-out-alt"></i>
		    		<p>나가기</p>
		    	</a>
		    </div>
	    </div>
    </div>
    <!-- /.fixed button-->
  </aside>