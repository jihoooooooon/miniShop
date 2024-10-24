<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>권한 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/authorityManagement.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin_auth.js"></script>
</head>
<body>
	<!-- 메시지 표시 부분 -->
	<script>
        // 페이지 로드 후 메시지 출력
        window.onload = function() {
            <c:if test="${not empty message}">
                alert('${message}');
            </c:if>
        }
    </script>

    <%@include file="/WEB-INF/views/header/header.jsp"%>

    <div class="tabs">
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/userManagement" style="color:black;text-decoration: none;">계정 관리</a>
        </div>
        <div class="tab active">
            <a href="${pageContext.request.contextPath}/admin/authorityManagement"style="color:black;text-decoration: none;font-weight:bold;">권한 관리</a>
        </div>
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/productManagement" style="color:black;text-decoration: none;">상품 관리</a>
        </div>
    </div>
    
    <div class="section active">
				<div class="my_info type_2" style="height: auto;">
				    <h2 class="profile-title">계정 권한</h2>
				    <table class="user-table" id="auth-table">
				        <thead>
				            <tr>
				                <th style="width:200px">아이디</th>
				                <th style="width:150px">권한</th>
				                <th style="width:100px">작업</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach var="auth" items="${authorityList}">
				                <tr class="auth">
				                    <td style="font-size:20px; font-weight:700px;">${auth.u_id}</td>
				                    <td>
				                    	<form action="${pageContext.request.contextPath}/admin/updateAuthority" method="post">
				                            <input type="hidden" name="u_id" value="${auth.u_id}" />
				                            <select name="authority" class="selectA">
				                                <option value="ROLE_ADMIN" <c:if test="${auth.authority == 'ROLE_ADMIN'}">selected</c:if>>관리자</option>
				                                <option value="ROLE_MEMBER" <c:if test="${auth.authority == 'ROLE_MEMBER'}">selected</c:if>>일반회원</option>
				                            </select>
				                    </td>
				                    <td><input type="submit" value="변경" /></td>
				                   		</form> 
				                </tr>
				            </c:forEach>
				        </tbody>
				    </table>
				    <!-- 페이징 버튼 -->
					<div id="pagination">
					    <button id="firstAuth">&laquo;</button>
					    <button id="prevAuth">&lt;</button>
					    <span id="pageAuthNumbers"></span>
					    <button id="nextAuthPage">&gt;</button>
					    <button id="lastAuthPage">&raquo;</button>
					</div>
				    
				</div>
    </div>
    
    <%@include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>
