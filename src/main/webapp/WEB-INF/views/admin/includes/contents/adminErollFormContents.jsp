<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="row col-sm-6">
                    	<c:if test="${enroll eq 'notice'}">
	                        <h1>공지사항 작성</h1>
                    	</c:if>
                    	<c:if test="${enroll eq 'faq'}">
                    	    <h1>FAQ 작성</h1>
                    	</c:if>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${contextPath}/admin">Home</a></li>
                       	<c:if test="${enroll eq 'notice'}">
	                        <li class="breadcrumb-item active">공지사항 작성</li>
                    	</c:if>
                    	<c:if test="${enroll eq 'faq'}">
                    	    <li class="breadcrumb-item active">FAQ 작성</li>
                    	</c:if>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                	<div class="col-12">
                    	<form action="${boardName}" method="post">
	                        <div class="card card-outline card-info">
	                            <div class="card-header">
	                            	<div class="row justify-content-between  align-items-end">
	                            		<div class="col-md-10">
			                                <div class="input-group">
											  <div class="input-group-prepend">
											    <span class="input-group-text font-weight-bold" id="inputGroup-sizing-default">제목</span>
											  </div>
											  <input type="text" class="form-control" name="title" value="${b.title}">
											</div>
										</div>
										<div class="col-md-2 text-right">
											<input type="hidden" name="categoryUNo" value="${catUNo}">
											<select class="form-select" name="categorySNo">
												<c:forEach var="list" items="${subCatList}">
													<c:choose>
														<c:when test="${list.categorySNo eq b.categorySNo}">
											  				<option value="${list.categorySNo }" selected>${list.categorySName}</option>
														</c:when>
														<c:otherwise>
											  				<option value="${list.categorySNo }">${list.categorySName}</option>
														</c:otherwise>
													</c:choose>
											  	</c:forEach>
											</select>
										</div>
									</div>
	                            </div>
	                            <div class="card-body">
	                                <div id="container">
	                                    <textarea id="editor" name="content">${b.content}</textarea>
	                                </div>
	   								<div class="row justify-content-end mb-2">
										<div class="col-sm-12 col-md-6 text-right">
											<c:choose>
												<c:when test="${empty b}">
													<button type="submit" class="btn btn-primary">등록</button>
												</c:when>
												<c:otherwise>
													<input type="hidden" name="boardNo" value="${b.boardNo}">
													<button type="submit" class="btn btn-warning">수정</button>
												</c:otherwise>
											</c:choose>
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

