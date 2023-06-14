<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pi" value="${map.pi}" />
<c:set var="list" value="${map.list}" />
<c:set var="catUNo" value="${map.catUNo}" />
<c:set var="type" value="${map.type}" />
<c:set var="tab" value="${map.tabList}" />

<div class="content-wrapper" style="min-height: 1302.12px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>신고 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">신고 관리</li>
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
							<ul class="nav nav-tabs" id="report-tabs">
								<li class="nav-item">
									<a class="nav-link" id="0" href="report?catUNo=0&type=${type}&currentPage=1">전체</a>
								</li>
								<c:forEach var="list" items="${tab}">
									<c:if test="${list.categoryUNo ne 1}">
										<li class="nav-item">
											<a class="nav-link" id="${list.categoryUNo}" href="report?catUNo=${list.categoryUNo}&type=${type}&currentPage=1">${list.categoryUName}</a>
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
									<div class="btn-group" role="group">
										<button id="board_reply" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<c:if test="${type == 'board'}">
											게시물
										</c:if>
										<c:if test="${type == 'reply'}">
											댓글
										</c:if>
										</button>
										<div class="dropdown-menu" aria-labelledby="board_reply">
										  <a class="dropdown-item" href="report?catUNo=${catUNo}&type=board&currentPage=1">게시물</a>
										  <a class="dropdown-item" href="report?catUNo=${catUNo}&type=reply&currentPage=1">댓글</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped">
											<thead>
												<tr>
													<c:if test="${type eq 'board'}">
														<th rowspan="1" colspan="1">번호</th>
														<th rowspan="1" colspan="1">카테고리</th>
														<th rowspan="1" colspan="1">제목</th>
														<th rowspan="1" colspan="1">신고된 횟수</th>
														<th rowspan="1" colspan="1">작성자</th>
														<th rowspan="1" colspan="1">상태</th>
														<th rowspan="1" colspan="1">관리</th>
													</c:if>
													<c:if test="${type eq 'reply'}">
														<th rowspan="1" colspan="1">번호</th>
														<th rowspan="1" colspan="1">카테고리</th>
														<th rowspan="1" colspan="1">게시물</th>
														<th rowspan="1" colspan="1">댓글 내용</th>
														<th rowspan="1" colspan="1">신고된 횟수</th>
														<th rowspan="1" colspan="1">작성자</th>
														<th rowspan="1" colspan="1">상태</th>
														<th rowspan="1" colspan="1">관리</th>
													</c:if>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${map.list}" varStatus="i">
													<tr class="odd">
														<c:if test="${type eq 'board'}">
															<input type="hidden" value="${list.board.boardNo}">
														</c:if>
														<c:if test="${type eq 'reply'}">
															<input type="hidden" value="${list.reply.replyNo}">
														</c:if>
														<td>${i.count}</td>
														<td>${list.upperCategory.categoryUName}</td>
														<td>${list.board.title }</td>
														<c:if test="${type eq 'board'}">
															<td>${list.board.reportCount}</td>
															<td>${list.member.nickName}</td>
															<td>${list.board.status}</td>
														</c:if>
														<c:if test="${type eq 'reply'}">
															<td>${list.reply.content}</td>
															<td>${list.reply.reportCount}</td>
															<td>${list.member.nickName}</td>
															<td>${list.reply.state}</td>
														</c:if>
														<td>
															<div class="btn-group">
																<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
																	<c:choose>
																		<c:when test="${list.board.status eq 'Y' or list.reply.state eq 'Y'}">
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
															<a href="report?catUNo=${catUNo}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item previous">
															<a href="report?catUNo=${catUNo}&currentPage=${pi.currentPage-1}" class="page-link">Previous</a>
														</li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="item" begin="${pi.startPage}" end="${pi.endPage}">
													<c:choose>
														<c:when test="${pi.currentPage == item}">
															<li class="paginate_button page-item active">
																<a href="report?catUNo=${catUNo}&type=board&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:when>
														<c:otherwise>
															<li class="paginate_button page-item">
																<a href="report?catUNo=${catUNo}&type=board&currentPage=${item}" class="page-link">${item}</a>
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage}">
														<li class="paginate_button page-item next disabled">
															<a href="report?catUNo=${catUNo}&type=board&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button page-item next">
															<a href="report?catUNo=${catUNo}&type=board&currentPage=${pi.currentPage+1}" class="page-link">Next</a>
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