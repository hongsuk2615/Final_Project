<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="row col-sm-6">
                        <h1>공지사항 작성</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">공지사항 작성</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline card-info">
                            <div class="card-header">
                            	<div class="row justify-content-between  align-items-end">
                            		<div class="col-md-10">
		                                <div class="input-group">
										  <div class="input-group-prepend">
										    <span class="input-group-text font-weight-bold" id="inputGroup-sizing-default">제목</span>
										  </div>
										  <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
										</div>
									</div>
									<div class="col-md-2 text-right">
										<select class="form-select" aria-label="Default select example">
										  <option value="1">쉐어하우스</option>
										  <option value="2">카풀</option>
										  <option value="3">중고거래</option>
<!-- 										  <option value="3">대타서비스</option> -->
										  <option value="3">공동구매</option>
										  <option value="6">소모임</option>
										</select>
									</div>
								</div>
                            </div>
                            <div class="card-body">
                                <div id="container">
                                    <div id="editor"></div>
                                </div>
   								<div class="row justify-content-end mb-2">
									<div class="col-sm-12 col-md-6 text-right">
										<a href="${contextPath}/admin/enrollForm/notice" class="btn btn-primary">등록</a>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

