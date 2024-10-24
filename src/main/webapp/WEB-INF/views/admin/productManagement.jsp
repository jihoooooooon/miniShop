<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productManagement.css">
	<script src="${pageContext.request.contextPath}/resources/js/admin_product.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/views/header/header.jsp"%>

    <div class="tabs">
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/userManagement"
            style="color:black;text-decoration: none;">계정 관리</a>
        </div>
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/authorityManagement"
            style="color:black;text-decoration: none;">권한 관리</a>
        </div>
        <div class="tab active">
            <a href="${pageContext.request.contextPath}/admin/productManagement"
            style="color:black;text-decoration: none;font-weight:bold;">상품 관리</a>
        </div>
    </div>

    <div class="section active">
        <h2>상품 관리</h2>

        <!-- 상품 수정 폼 (AJAX 사용) -->
        <div class="container">
            <table id="customers">
	            <thead>
	                <tr>
	                    <th style="width: 10px">Id</th>
	                    <th style="width: 100px">Name</th>
	                    <th style="width: 100px">Brand</th>
	                    <th style="width: 100px">Type</th>
	                    <th style="width: 100px">Price</th>
	                    <th style="width: 100px">Delete</th>
	                </tr>
	           </thead>
	                <c:forEach var="dto" items="${list}">
                    <tr>
                        <td>${dto.p_id}</td>
                        <td><input type="text" class="name" value="${dto.name}" data-id="${dto.p_id}" required></td>
                        <td><input type="text" class="brand" value="${dto.brand}" data-id="${dto.p_id}" required></td>
                        <td><input type="text" class="type" value="${dto.type}" data-id="${dto.p_id}" required></td>
                        <td><input type="number" class="price" value="${dto.price}" data-id="${dto.p_id}" required></td>
                        <td>
						    <form action="${pageContext.request.contextPath}/admin/productDelete" method="post" style="display:inline;">
							    <input type="hidden" name="p_id" value="${dto.p_id}" />
							   	<input type="submit" class="button"value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');" />
						    </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <!-- 한 번에 모든 상품 수정사항을 저장하는 버튼 -->
            <div class="button-container">
                <button id="save-all" class="button">제품수정</button>
                <button onclick="location.href='${pageContext.request.contextPath}/admin/productAdd'" 
            	class="button">상품추가</button>
            </div>
            

    <!-- 페이징 버튼 -->
			<div id="pagination">
				<button id="firstProduct">&laquo;</button>
				<button id="prevProduct">&lt;</button>
				<span id="pageProductNumbers"></span>
				<button id="nextProductPage">&gt;</button>
				<button id="lastProductPage">&raquo;</button>
			</div>            
        </div>
    </div>

    <%@include file="/WEB-INF/views/footer/footer.jsp"%>

    <!-- jQuery를 이용한 AJAX 처리 -->
    <script>
        
    </script>
</body>
</html>
