<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper" style="min-height: 1302.12px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="row col-sm-6">
					<i class="nav-icon fas fa-user fa-lg"></i>
					<h1>회원 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">회원 관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-primary card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="member-tabs">
								<li class="nav-item">
									<a class="nav-link active" id="memberAll" data-toggle="pill" href="#">전체</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="memberActive" data-toggle="pill" href="">활성</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="memberSuspend" data-toggle="pill" href="#">정지</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="memberBanned" data-toggle="pill" href="#">탈퇴</a>
								</li>
								<li class="nav-item" style="margin-left: auto;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 180px;">
											<input type="text" name="table_search"
												class="form-control float-right" placeholder="Search">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</li>
							</ul>

						</div>
						<div class="card-body">
							<div id="example1_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped">
											<thead>
												<tr>
													<th rowspan="1" colspan="1">번호</th>
													<th rowspan="1" colspan="1">현재 로그인</th>
													<th rowspan="1" colspan="1">유저ID</th>
													<th rowspan="1" colspan="1">닉네임</th>
													<th rowspan="1" colspan="1">신고횟수</th>
													<th rowspan="1" colspan="1">가입일</th>
													<th rowspan="1" colspan="1">상태</th>
													<th rowspan="1" colspan="1">관리</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${memberList}" varStatus="i">
													<tr>
														<td>${i.count}</td>
														<td>
															<div class="out-circle">
																<c:if test="${list.currentLogin eq 'Y'}">
																		<span class="in-circle"></span>
																</c:if>
															</div>	
														</td>
														<td>${list.userId}</td>
														<td>${list.nickName}</td>
														<td>${list.reportCount}</td>
														<td>${list.joinDate}</td>
														<td>${list.status}</td>
														<td>
															<div class="btn-group">
																<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
																	활성
																</button>
																<div class="dropdown-menu">
																	<a class="dropdown-item" href="#">활성</a>
																	<a class="dropdown-item" href="#">정지</a>
																	<a class="dropdown-item" href="#">탈퇴</a>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="example1_info">Showing
											1 to 10 of 57 entries</div>
									</div>
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers"
											id="example1_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled"
													id="example1_previous"><a href="#" class="page-link">Previous</a>
												</li>
												<li class="paginate_button page-item active"><a
													href="#" class="page-link">1</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">2</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">3</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">4</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">5</a></li>
												<li class="paginate_button page-item "><a href="#"
													class="page-link">6</a></li>
												<li class="paginate_button page-item next"
													id="example1_next"><a href="#" class="page-link">Next</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>