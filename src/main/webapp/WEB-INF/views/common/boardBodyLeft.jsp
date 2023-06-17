<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/thrifty/resources/css/common/body-left.css">
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
    <title>Document</title>
    <style>
    	.sub-category{
    		border-radius : 5px;
    		cursor : pointer;
    		padding : 10px;
    		width : 180px;
    	}
    	.sub-category:hover{
    		background : lightgray;
    		color : black;
    	}
    	.sub-category-selected{
    		background : lightgray;
    		color : black;
    	}
    
    </style>
</head>
<body>

            <div id="body-left">
                <div id="upper-category">
                    <div>
                        <img src="/thrifty/resources/images/main/icon/second-hand.png" alt="상위 카테고리 이미지">
                        <div id="upper-category-name"><a href="/thrifty/usedProduct">중고거래</a></div>
                    </div>
                </div>
                <div id="sub-category" >
                    <ul class="scrollbar">
                    <c:forEach var="subCategory" items="${subCategoryList}">
                    	<c:if test="${subCategory.categoryUNo eq 4}">
                        <li class="sub-category ${scNo eq subCategory.categorySNo? 'sub-category-selected':'' }" onclick="location.href = '${contextPath}/usedProduct?scNo=${subCategory.categorySNo }'">${subCategory.categorySName}</li>
                        </c:if>
                    </c:forEach>    
                    </ul>
                </div>
                <div id="filter">
                    <ul class="scrollbar">
                        <li>가격</li>
                        <li><input style="width:90px; cursor:pointer; border-radius:5px;"type="number" name="minPrice" min="0" value="${filter.minPrice}"> ~ <input style="width:90px; border-radius:5px; cursor:pointer;" type="number" name="maxPrice" min="0" value="${filter.maxPrice}"> </li>
                        <li>지역</li>
                        <li>
                            <select name="flocation" id="" style="cursor:pointer; border-radius:5px;">
                                <option id="default-location" value="" selected>지역</option>
                         		<c:forEach var="location" items="${locationList}">
                            		<option  value="${location.locationNo}" ${filter.location eq location.locationNo ? "selected":"" }>${location.locationName}</option>
                            	</c:forEach>   
                            </select>
                        </li>

                        <li>거래방법</li>
                        <li>
                            <input style="cursor:pointer;" type="radio" name="fTradeMethod" id="filter-direct" value="D" ${filter.tradeMethod eq 'D'? "checked":""}>
                            <label style="cursor:pointer;" for="filter-direct">직거래</label>
                            <input style="cursor:pointer;" type="radio" name="fTradeMethod" id="filter-parcel" value="P" ${filter.tradeMethod eq 'P'? "checked":""}>
                            <label style="cursor:pointer;" for="filter-parcel">택배</label>
                            <input style="cursor:pointer;" type="radio" name="fTradeMethod" id="filter-both" value="B" ${filter.tradeMethod eq 'B'? "checked":""}>
                            <label style="cursor:pointer;" for="filter-both">둘다</label>

                        </li>
                        <li style="display: flex; justify-content: flex-end; padding-right:15px ;">
							<lord-icon onclick="resetFilter();"
							    src="https://cdn.lordicon.com/nxooksci.json"
							    trigger="hover"
							    colors="primary:white"
							    style="width:40px;height:40px; cursor:pointer;">
							</lord-icon>
							<lord-icon onclick="filter();"
							    src="https://cdn.lordicon.com/yqzmiobz.json"
							    trigger="hover"
							    colors="primary:white"
							    style="width:40px;height:40px; cursor:pointer;">
							</lord-icon>
						</li>
                    </ul>
                    
                </div>

            </div>
            <c:if test="${scNo != null}">
            	<script>
                	let scNo = ${scNo};
            	</script>
            </c:if>
            
            <script>
            	function filter(){
            		let queryString;
            		let minPrice = $('[name="minPrice"]').val();
            		let maxPrice =  $('[name="maxPrice"]').val();
            		let location =  $('[name="flocation"]').val();
            		let tradeMethod =  $('[name="fTradeMethod"]:checked').val();
            		
            		queryString = "?scNo="+(typeof scNo != 'undefined' ? scNo : '');
            		queryString += "&minPrice="+minPrice;
            		queryString += "&maxPrice="+maxPrice;
            		queryString += "&location="+location;
            		queryString += "&tradeMethod="+tradeMethod;
            		let url = "/thrifty/usedProduct"+queryString;
            		window.location.href = url;
            	}
            	
            	function resetFilter(){
            		$('[name="minPrice"]').val('');
            		$('[name="maxPrice"]').val('');
            		$('[name="flocation"]>option:selected').removeAttr("selected");
            		$('#default-location').removeAttr("selected");
            		$('#default-location').attr('selected',true);
            		$('[name="fTradeMethod"]:checked').removeAttr("checked");
            		$('[name="fTradeMethod"]').prop("checked", false);
            	}

            

            </script>

    
</body>
</html>