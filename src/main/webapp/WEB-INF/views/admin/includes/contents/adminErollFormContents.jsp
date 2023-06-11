<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    	<form action="notice" method="post">
	                        <div class="card card-outline card-info">
	                            <div class="card-header">
	                            	<div class="row justify-content-between  align-items-end">
	                            		<div class="col-md-10">
			                                <div class="input-group">
											  <div class="input-group-prepend">
											    <span class="input-group-text font-weight-bold" id="inputGroup-sizing-default">제목</span>
											  </div>
											  <input type="text" class="form-control" name="title">
											</div>
										</div>
										<div class="col-md-2 text-right">
											<input type="hidden" name="categoryUNo" value="${upCat}">
											<select class="form-select" name="categorySNo">
												<c:forEach var="list" items="${subCatList}">
											  		<option value="${list.categorySNo }">${list.categorySName}</option>
											  	</c:forEach>
											</select>
										</div>
									</div>
	                            </div>
	                            <div class="card-body">
	                                <div id="container">
	                                    <textarea id="editor" name="content"></textarea>
	                                </div>
	   								<div class="row justify-content-end mb-2">
										<div class="col-sm-12 col-md-6 text-right">
											<button class="btn btn-primary">등록</button>
										</div>
									</div>
	                            </div>
	                        </div>
                 	   </form>	
                    </div>
                </div>
            </div>

        </div>
    </div>

