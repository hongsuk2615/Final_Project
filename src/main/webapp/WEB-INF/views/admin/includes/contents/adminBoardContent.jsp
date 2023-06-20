<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<c:set var="catUNo" value="${map.catUNo}" />
<c:set var="tab" value="${map.tabList}" />

<div class="content-wrapper" style="min-height: 1302.12px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>게시판 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="${contextPath}/admin">Home</a></li>
						<li class="breadcrumb-item active">게시판 관리</li>
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
							<ul class="nav nav-tabs" id="board-tabs">
								<li class="nav-item">
									<a class="nav-link" id="0" href="board?catUNo=0&currentPage=1">전체</a>
								</li>
								<c:forEach var="list" items="${tab}">
									<c:if test="${list.categoryUNo ne 1}">
										<li class="nav-item">
											<a class="nav-link" id="${list.categoryUNo}" href="board?catUNo=${list.categoryUNo}&currentPage=1">${list.categoryUName}</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="nav-item" style="margin-left: auto;">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 180px;">
											<input type="text" name="table_search" class="form-control float-right" placeholder="제목">
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
							<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
								<div class="row justify-content-start mb-2">
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped">
											<thead>
												<tr>
													<th rowspan="1" colspan="1">번호</th>
													<th rowspan="1" colspan="1">카테고리</th>
													<th rowspan="1" colspan="1">제목</th>
													<th rowspan="1" colspan="1">작성자</th>
													<th rowspan="1" colspan="1">조회수</th>
													<th rowspan="1" colspan="1">생성일</th>
													<th rowspan="1" colspan="1">상태</th>
													<th rowspan="1" colspan="1">관리</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${map.list}" varStatus="i">
													<tr class="odd">
														<input type="hidden" value="${list.boardNo}">
														<td>${i.count}</td>
														<td>${list.upperCategoryName}</td>
														<td><a href="${contextPath}/${list.categoryPath}/detail?bNo=${list.boardNo}" target="_blank" rel="noopener noreferrer">${list.title}</a></td>
														<td>${list.nickName}</td>
														<td>${list.readCount}</td>
														<td>${list.createDate}</td>
														<td>${list.status}</td>
														<td>
															<div class="btn-group">
																<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
																	<c:choose>
																		<c:when test="${list.status eq 'Y'}">
																			활성
																		</c:when>
																		<c:otherwise>
																			삭제
																		</c:otherwise>
																	</c:choose>
																</button>
																<div class="dropdown-menu">
																	<button class="dropdown-item status-dropdown" value="Y">활성</button>
																	<button class="dropdown-item status-dropdown" value="N">삭제</button>
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
															<a href="board?catUNo=${catUNo}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item previous">
															<a href="board?catUNo=${catUNo}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="item" begin="${pi.startPage}" end="${pi.endPage}">
													<c:choose>
														<c:when test="${pi.currentPage == item}">
															<li class="paginate_button page-item active">
																<a href="board?catUNo=${catUNo}&type=board&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:when>
														<c:otherwise>
															<li class="paginate_button page-item">
																<a href="board?catUNo=${catUNo}&type=board&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage}">
														<li class="paginate_button page-item next disabled">
															<a href="board?catUNo=${catUNo}&type=board&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item next">
															<a href="board?catUNo=${catUNo}&type=board&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
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