<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExFinder</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">

<style>
	
	header {
    background-color: #333; /* 배경색 */
    color: white; /* 글씨 색 */
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 가로 가운데 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
    height: 130px; /* 높이 설정 */
    width: 100%;
    font-weight:700px;
    
	}
	 a{
		color: white;
		text-decoration: none; /* 밑줄 제거 */
	 }
	
	.login_navi {
 	   	margin-top:0px; /* header의 height만큼 여백 추가 */
 	   	height: 80px;
 	   	width: 100%;
    	display: flex;
    	align-items: center; /* 수직으로 중앙 정렬 */
    	justify-content: center; /* 수평 중앙 정렬 */
    	background-color: #fefefe; /* 거의 흰색에 가까운 매우 연한 회색 */ 
    	border-bottom: 1px solid #d0d0d0; /* 연한 회색 밑에 선 추가 */
	}
	.login_navi ul {
    	display: flex; /* 수평 정렬을 위해 flex 사용 */
	}

	.login_navi li {
    	margin: 0 20px; /* 각 항목 사이의 간격 */
	}

	.login_navi a {
    	text-decoration: none; /* 링크의 기본 밑줄 제거 */
    	color: #000; /* 기본 링크 색상 설정 */
    	font-weight: normal; /* 기본 글자 굵기 설정 (기본값) */
	}

	.login_navi a:hover {
    	color: #333; /* 마우스를 올렸을 때 링크 색상 변경 */
    	font-weight: bold; /* 마우스를 올렸을 때 글자 굵기 변경 */
	}
</style>
</head>
<body>
	<header class="header">
        <h1><a href="/ex/">Shopang</a></h1>
    </header>
	<div class="login_navi">
		<ul>
			<li><a href="/ex/">Home</a></li>
			<li><a href="/ex/user/login">로그인</a></li>
			<li><a href="/ex/user/join">회원가입</a></li>
			<li><a href="/ex/find/inquiry">정보찾기</a></li>
		</ul>
	</div>
</body>
</html>