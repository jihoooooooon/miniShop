<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/icon/EFL.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<style>
/* 버튼 스타일 */
.find-button {
	width: 400px;
	height: 70px;
	border-radius: 0px; /* 버튼의 모서리를 0px로 둥글지 않게 설정 */
}


</style>
</head>
<body>
	
	<%@include file="/WEB-INF/views/header/header.jsp"%>
	<div id="alramContainer" style="display: none;"></div>
	<div id="main">

		<h1>회원 로그인</h1>
		<p>회원님의 아이디와 비밀번호를 입력해 주세요.</p>
		<br>
		
		<c:if test="${param.join ne null }">
			<script>
				alert('회원가입이 완료되었습니다.');
			</script>
		</c:if>
		
		<c:if test="${param.msg eq 'enabled' }">
			<p style= "color:red;">탈퇴 혹은 비활성화 된 계정 입니다.</p>
		</c:if>
		<c:if test="${param.msg eq 'error' }">
			<p style= "color:red;">아이디 혹은 비밀번호가 일치하지 않습니다.</p>
		</c:if>
		<c:if test="${param.msg eq 'wrong' }">
			<p  style= "color:red;">로그인 시도 후 오류가 발생했습니다. 다시 시도 해주세요.</p>
		</c:if>

		<c:url value="/login" var="loginUrl" />
		<form name="frmLogin" action="${loginUrl}" method="POST">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token }" />
			<div class="find-input-container">
				<label>아이디</label> <input type="text" class="find-input" name="u_id"
					value="${id_save}" />
			</div>
			<div class="find-input-container">
				<label>비밀번호</label> <input type="password" class="find-input"
					name="u_pw" value="${pws}" />
			</div>
			<div class="find-checkbox-container">
				<div class="find-checkbox-container1">
					<input type="checkbox" id="id_save" name="id_save" value="id_save"
						${id_save_Checked}> <label for="id_save">아이디 저장</label>
				</div>
				<div class="find-checkbox-container2">
					<input type="checkbox" id="auto_login" name="auto_login"
						value="auto_login" ${auto_login_Checked}> <label
						for="auto_login">자동 로그인</label>
				</div>
			</div>

			<button type="submit" class="find-button">로그인</button>
			<br>
			
		</form>

	</div>
	
	<%@include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>