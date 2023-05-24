<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-wrapper" style="min-height: 1302.12px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
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
					<div class="card">
<!-- 						<div class="card-header"> -->
<!-- 							<h3 class="card-title">DataTable with default features</h3> -->
<!-- 						</div> -->
						<!-- /.card-header -->
						<div class="card-body">
							<div id="example1_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dt-buttons btn-group flex-wrap">
											<button class="btn btn-secondary buttons-copy buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>Copy</span>
											</button>
											<button class="btn btn-secondary buttons-csv buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>CSV</span>
											</button>
											<button class="btn btn-secondary buttons-excel buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>Excel</span>
											</button>
											<button class="btn btn-secondary buttons-pdf buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>PDF</span>
											</button>
											<button class="btn btn-secondary buttons-print" tabindex="0"
												aria-controls="example1" type="button">
												<span>Print</span>
											</button>
											<div class="btn-group">
												<button
													class="btn btn-secondary buttons-collection dropdown-toggle buttons-colvis"
													tabindex="0" aria-controls="example1" type="button"
													aria-haspopup="true">
													<span>Column visibility</span><span class="dt-down-arrow"></span>
												</button>
											</div>
										</div>
									</div>
									<div class="col-sm-12 col-md-6">
										<div id="example1_filter" class="card-tools" style="float: right;">
											<div class="input-group input-group-sm" style="width: 180px;">
												<input type="text" name="table_search" class="form-control float-right" placeholder="Search">
												<div class="input-group-append">
													<button type="submit" class="btn btn-default">
														<i class="fas fa-search"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped">
											<thead>
												<tr>
													<th class="sorting" rowspan="1" colspan="1">계정</th>
													<th class="sorting" rowspan="1" colspan="1" >닉네임</th>
													<th class="sorting" rowspan="1" colspan="1" >최근 로그인</th>
													<th class="sorting" rowspan="1" colspan="1" >가입일</th>
													<th class="sorting" rowspan="1" colspan="1" >상태</th>
												</tr>
											</thead>
											<tbody>
												<tr class="odd">
													<td>Gecko</td>
													<td>Firefox 1.0</td>
													<td>Win 98+ / OSX.2+</td>
													<td>1.7</td>
													<td>A</td>
												</tr>
												<tr class="even">
													<td>Gecko</td>
													<td>Firefox 1.5</td>
													<td>Win 98+ / OSX.2+</td>
													<td>1.8</td>
													<td>A</td>
												</tr>
												<tr class="odd">
													<td>Gecko</td>
													<td>Firefox 2.0</td>
													<td>Win 98+ / OSX.2+</td>
													<td>1.8</td>
													<td>A</td>
												</tr>
												<tr class="even">
													<td>Gecko</td>
													<td>Firefox 3.0</td>
													<td>Win 2k+ / OSX.3+</td>
													<td>1.9</td>
													<td>A</td>
												</tr>
												<tr class="odd">
													<td>Gecko</td>
													<td>Camino 1.0</td>
													<td>OSX.2+</td>
													<td>1.8</td>
													<td>A</td>
												</tr>
												<tr class="even">
													<td>Gecko</td>
													<td>Camino 1.5</td>
													<td>OSX.3+</td>
													<td>1.8</td>
													<td>A</td>
												</tr>
												<tr class="odd">
													<td>Gecko</td>
													<td>Netscape 7.2</td>
													<td>Win 95+ / Mac OS 8.6-9.2</td>
													<td>1.7</td>
													<td>A</td>
												</tr>
												<tr class="even">
													<td>Gecko</td>
													<td>Netscape Browser 8</td>
													<td>Win 98SE+</td>
													<td>1.7</td>
													<td>A</td>
												</tr>
												<tr class="odd">
													<td>Gecko</td>
													<td>Netscape Navigator 9</td>
													<td>Win 98+ / OSX.2+</td>
													<td>1.8</td>
													<td>A</td>
												</tr>
												<tr class="even">
													<td>Gecko</td>
													<td>Mozilla 1.0</td>
													<td>Win 95+ / OSX.1+</td>
													<td>1</td>
													<td>A</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="example1_info" role="status"
											aria-live="polite">Showing 1 to 10 of 57 entries</div>
									</div>
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers"
											id="example1_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled" id="example1_previous">
													<a href="#" aria-controls="example1" data-dt-idx="0" class="page-link">Previous</a>
												</li>
												<li class="paginate_button page-item active">
													<a href="#" aria-controls="example1" data-dt-idx="1" class="page-link">1</a>
												</li>
												<li class="paginate_button page-item ">
													<a href="#" aria-controls="example1" data-dt-idx="2" class="page-link">2</a>
												</li>
												<li class="paginate_button page-item ">
													<a href="#" aria-controls="example1" data-dt-idx="3" class="page-link">3</a>
												</li>
												<li class="paginate_button page-item ">
													<a href="#" aria-controls="example1" data-dt-idx="4" class="page-link">4</a>
												</li>
												<li class="paginate_button page-item ">
													<a href="#" aria-controls="example1" data-dt-idx="5" class="page-link">5</a>
												</li>
												<li class="paginate_button page-item ">
													<a href="#" aria-controls="example1" data-dt-idx="6" class="page-link">6</a>
												</li>
												<li class="paginate_button page-item next" id="example1_next">
													<a href="#" aria-controls="example1" data-dt-idx="7" class="page-link">Next</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
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