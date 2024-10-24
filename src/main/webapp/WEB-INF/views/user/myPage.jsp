<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage.css">
    <style>
    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/header/header.jsp"%>

    <div class="tabs">
        <div class="tab active" onclick="showSection('mysInfo', this)">정보 수정</div>
        <div class="tab" onclick="showSection('changePass', this)">비밀번호 변경</div>
        <div class="tab" onclick="showSection('deleteUser', this)">회원 탈퇴</div>
    </div>

	<div id="mysInfo" class="section active">
		<h2>정보 수정</h2>
		<form action="/ex/user/myInfo/menber_upDB" method="post">
			<div class="my_info-container">
				<label>아이디</label> <input type="text" class="input-text" name="u_id"
					value="${dto.u_id}" readonly />
			</div>
			<div class="my_info-container">
				<label>닉네임</label> <input type="text" class="input-text"
					name="u_nickname" placeholder="별명을 변경하시오" value="${dto.u_nickname}" />
			</div>
			<div class="my_info-container">
				<label>이름</label> <input type="text" class="input-text"
					name="u_name" placeholder="이름을 변경하시오" value="${dto.u_name}" />
			</div>

			<div class="my_info-container">
				<label>성별</label> <label>남자</label><input type="radio" class="radio"
					name="u_gender" value="남성"
					${dto.u_gender.equals("남성") ? "checked" : ""}> <label>여자</label><input
					type="radio" class="radio" name="u_gender" value="여성"
					${dto.u_gender.equals("여성") ? "checked" : ""}>
			</div>

			<div class="my_info-container">
				<label>생일</label> <input type="date" class="input-date"
					name="u_birthday" value="${dto.u_birthday}"><br>
			</div>

			<div class="my_info-container">
				<label>이메일</label> <input type="text" class="input-text-email"
					name="email" placeholder="이메일을 입력하시오" value="${u_emailArr[0] }">
				<label style="font-weight: bold;"> @ </label> <select
					class="email-select" name="select" ${u_emailArr[2] }>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select><br>
			</div>
			<div class="my_info-container">
				
				<label>전화번호</label> 
				<div class="phone">
					<input type="text" class="input-phone1"
					name="phoneNumber1" maxlength="3" placeholder="010"
					value="${u_phoneNumberArr[0] }"> <label class="stick1"
					style="font-weight: bold;"> - </label> <input type="text"
					class="input-phone2" name="phoneNumber2" maxlength="4"
					value="${u_phoneNumberArr[1] }"> <label class="stick2"
					style="font-weight: bold;"> - </label> <input type="text"
					class="input-phone3" name="phoneNumber3" maxlength="4"
					value="${u_phoneNumberArr[2] }"><br>
				</div>	
			</div>

			<div style="display: flex;">
				<div class="my_info-container" style="width: 550px;">
					<label>주소</label> <input type="text" class="input-text-address"
						name="u_address" placeholder="주소를 입력하시오" value="${dto.u_address }"
						id="u_address">
				</div>
				<button type="button" class="my_info-container-button"
					onclick="execDaumPostcode()">주소 검색</button>
				<br>
			</div>

			<div class="my_info-container">
				<label>가입날짜</label> <label class="join-date">${dto.u_joinDate }</label>
			</div>

			<input type="submit" class="myinfo-button" value="회원정보 변경하기">
		</form>

	</div>

	<div id="changePass" class="section">
		<h2>비밀번호 변경</h2>
		<form name="passwordForm" action="/ex/user/myInfo/pw_upDB"
			method="post" onsubmit="return validateForm()">
			<div class="password-container">
				<input type="password" class="myinfo-input" name="u_pw" id="u_pw"
					oninput="validateField('u_pw')" placeholder="변경할 비밀번호 입력하시오" />
				<button type="button" id="togglePw"
					onclick="togglePassword('u_pw', 'togglePw')">
					<img
						src="${pageContext.request.contextPath}/resources/img/open.png"
						id="toggleImg" alt="보기">
				</button>
			</div>
			<span id="u_pw-error" class="error-message"></span><br> <input
				type="password" class="myinfo-input2" name="u_pw_check"
				oninput="validateField('u_pw_check')" placeholder="비밀번호를 한번 더 입력하시오" />
			<span id="u_pw_check-error" class="error-message"></span> <input
				type="submit" class="myinfo-button" value="변경하기">
		</form>

	</div>

	<div id="deleteUser" class="section">
		<h2>회원 탈퇴</h2>
		<div class="myinfo-checkbox-container">
			<label for="cancel-account-check">회원 탈퇴하는 것에 동의합니다.</label> <input
				type="checkbox" id="cancel-account-check"
				name="cancel-account-check">
		</div>
		<button type="button" class="myinfo-button" id="delete-account-btn"
			onclick="confirmDelete()" disabled>회원 탈퇴</button>
	</div>

	<%@include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>
