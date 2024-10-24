<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/userManagement.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin_users.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/views/header/header.jsp"%>

	<!-- 메시지 표시 부분 -->
	<script>
        // 페이지 로드 후 메시지 출력
        window.onload = function() {
            <c:if test="${not empty message}">
                alert('${message}');
            </c:if>
        }
    </script>

	
    <div class="tabs">
        <div class="tab active">
            <a href="${pageContext.request.contextPath}/admin/userManagement" style="color:black;text-decoration: none;font-weight:bold;">계정 관리</a>
        </div>
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/authorityManagement"style="color:black;text-decoration: none;">권한 관리</a>
        </div>
        <div class="tab">
            <a href="${pageContext.request.contextPath}/admin/productManagement" style="color:black;text-decoration: none;">상품 관리</a>
        </div>
    </div>
    
    <div class="section active">
			<div class="my_info type_1" style= "height: auto;">
				<h2 class="profile-title">계정 목록</h2>
				<form id="updateForm"
					action="${pageContext.request.contextPath}/admin/updateUser"
					method="post" style="display: none; ">
					<input type="hidden" name="u_id" id="u_id"> 
					<input type="hidden" name="u_nickname" id="u_nickname"> 
					<input type="hidden" name="u_name" id="u_name"> 
					<input type="hidden" name="u_gender" id="u_gender"> 
					<input type="hidden" name="u_email" id="u_email"> 
					<input type="hidden" name="u_phoneNumber" id="u_phoneNumber"> 
					<input type="hidden" name="u_address" id="u_address">
					<input type="hidden" name="u_birthday" id="u_birthday">
				</form>

				<!-- 기존 테이블 코드 유지 -->
				<table class="user-table" id="users-table">
					<thead>
						<tr>
							<th style="width:100px;">아이디</th>
							<th>닉네임</th>
							<th>이름</th>
							<th>성별</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>생년월일</th>
							<th>작업</th>
							<th>계정 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr>
								<td>${user.u_id}</td>
								<td><input type="text" value="${user.u_nickname}"
									data-field="u_nickname" class="u_nickname" /></td>
								<td><input type="text" value="${user.u_name}"
									data-field="u_name" class="u_name"/></td>
								<td><select data-field="u_gender" class="u_gender">
										<option value="남성"
											<c:if test="${user.u_gender == '남성'}">selected</c:if>>남성</option>
										<option value="여성"
											<c:if test="${user.u_gender == '여성'}">selected</c:if>>여성</option>
								</select></td>
								<td><input type="email" value="${user.u_email}"
									data-field="u_email" class="u_email"/></td>
								<td><input type="text" value="${user.u_phoneNumber}"
									data-field="u_phoneNumber" class="u_phoneNumber" /></td>
								<td><input type="text" value="${user.u_address}"
									data-field="u_address" /></td>
								<td><input type="date" value="${user.u_birthday}"
									data-field="u_birthday" /></td>
								<td>
									<button onclick="submitForm('${user.u_id}', this)" class="storageBtn">저장</button>
								</td>
								
								<!-- 상태 변경 폼 -->
								<td>
									<form
										action="${pageContext.request.contextPath}/admin/updateStatus"
										method="post">
										<input type="hidden" name="u_id" value="${user.u_id}" /> <select
											name="enabled" class="enabled">
											<option value="1"
												<c:if test="${user.enabled == 1}">selected</c:if>>활성화</option>
											<option value="0"
												<c:if test="${user.enabled == 0}">selected</c:if>>비활성화</option>
										</select> <input type="submit" value="변경" />
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<!-- 페이징 버튼 -->
					<div id="pagination">
					    <button id="firstUsers">&laquo;</button>
					    <button id="prevUsers">&lt;</button>
					    <span id="pageUsersNumbers"></span>
					    <button id="nextUsersPage">&gt;</button>
					    <button id="lastUsersPage">&raquo;</button>
					</div>
			</div>
    </div>
    
    <%@include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>
