<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<c:set var="currentTab" value="${map.tab}" />

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
									<c:forEach var="tab" items="${tabMap}">
										<li class="nav-item">
											<a class="nav-link" id="member-${tab.key}" href="member?tab=${tab.key}&currentPage=1">${tab.value}</a>
										</li>
									</c:forEach>
								<li class="nav-item" style="margin-left: auto;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 180px;">
											<input type="text" name="table_search" class="form-control float-right" placeholder="닉네임, 아이디">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default table_search_btn">
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
													<th>${upperCategoryList}</th>
													<th>${subCategoryList}</th>
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
												<c:forEach var="list" items="${map.list}" varStatus="i">
													<tr>
														<input type="hidden" value="${list.userNo}">
														<td>${i.count}</td>
														<td class="member-login">
															<div class="out-circle">
																<c:if test="${list.currentLogin eq 'Y'}">
																		<span class="in-circle"></span>
																</c:if>
															</div>	
														</td>
														<td class="member-userId">${list.userId}</td>
														<td class="member-nickName">${list.nickName}</td>
														<td class="member-reportCount">${list.reportCount}</td>
														<td class="member-joinDate">${list.joinDate}</td>
														<c:choose>
															<c:when test="${list.status eq 'Y' && list.isBanned eq 'N'}">
																<td>활성</td>
															</c:when>
															<c:when test="${list.status eq 'N' && list.isBanned eq 'N'}">
																<td>정지</td>
															</c:when>
															<c:when test="${list.isBanned eq 'Y'}">
																<td>탈퇴</td>
															</c:when>
														</c:choose>
														<td>
															<div class="btn-group">
																<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
																	<c:choose>
																		<c:when test="${list.status eq 'Y' && list.isBanned eq 'N'}">
																			활성
																		</c:when>
																		<c:when test="${list.status eq 'N' && list.isBanned eq 'N'}">
																			정지
																		</c:when>
																		<c:when test="${list.isBanned eq 'Y'}">
																			탈퇴
																		</c:when>
																	</c:choose>
																</button>
																<div class="dropdown-menu">
																	<button class="dropdown-item member-status-dropdown" value="active">활성</button>
																	<button class="dropdown-item member-status-dropdown" value="suspend">정지</button>
																	<button class="dropdown-item member-status-dropdown" value="banned">탈퇴</button>
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
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers">
											<ul class="pagination">
												<c:choose>
													<c:when test="${pi.currentPage eq 1}">
														<li class="paginate_button page-item previous disabled">
															<a href="member?tab=${currentTab}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item previous">
															<a href="member?tab=${currentTab}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="item" begin="${pi.startPage}" end="${pi.endPage}">
													<c:choose>
														<c:when test="${pi.currentPage == item}">
															<li class="paginate_button page-item active">
																<a href="member?tab=${currentTab}&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:when>
														<c:otherwise>
															<li class="paginate_button page-item">
																<a href="member?tab=${currentTab}&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage}">
														<li class="paginate_button page-item next disabled">
															<a href="member?tab=${currentTab}&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item next">
															<a href="member?tab=${currentTab}&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
														</li>
													</c:otherwise>
												</c:choose>
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
