<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopang 쇼핑몰</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    
    
    <style>
		/* 전체 레이아웃 */
		html, body {
        margin: 0;
        padding: 0;
        height: 100%; /* 전체 높이를 100%로 설정 */
        background-color: #f4f4f4;
        overflow-y: hidden; /* 세로 스크롤 숨기기 */
        overflow-x: hidden; /* 가로 스크롤은 자동으로 표시 */
    }
    
		.all{
			position: relative; /* 또는 absolute/fixed */
			left:15px;
		}	
		
		nav {
		    margin: 20px 0;
		    text-align: center;
		}
		
		nav a {
		    text-decoration: none;
		    color: #333;
		    padding: 12px 25px; /* 패딩을 늘려 버튼 크기 증가 */
		    border: 1px solid #333;
		    margin: 0 10px;
		    border-radius: 5px;
		    transition: background-color 0.3s ease;
		}
		
		nav a:hover {
		    background-color: #333;
		    color: white;
		}
		
		.logout{
			text-decoration: none;
		    color: #333;
		    padding: 12px 25px; /* 패딩을 늘려 버튼 크기 증가 */
		    border: 1px solid #333;
		    margin: 0 10px;
		    border-radius: 5px;
		    transition: background-color 0.3s ease;
		    margin-top:30px;	
				
		}
		.logout:hover{
			background-color: #333;
		    color: white;
		}
		
		h1 {
		    text-align: center;
		    color: white; /* 글씨 색을 수정 */
		    
		    
		}
		
		h2 {
		    text-align: center;
		    color: #333; /* 색상 설정 */
		    font-size: 36px; /* h2 크기 증가 */
		    margin-top: 20px; /* 마진 추가 */
		}
		h3{
		 	text-align: center;
		    color: #333; /* 색상 설정 */
		    font-size: 30px; /* h3 크기 증가 */
		    margin-top: 30px; /* 마진 추가 */
		}
		
		.content {
		    max-width: 1200px;
		    margin: 0 auto;
		    padding: 20px;
		    text-align: center;
		}
		        
		        
    </style>
</head>
<body>

    <!-- 헤더 -->
    <%@include file="/WEB-INF/views/header/header.jsp"%>
    
    
    <!-- 메인 콘텐츠 -->
    <div class="all">
    
	    <div class="content">
	        <h2>오늘의 인기 상품을 확인해보세요!</h2>
	        <p>Shopang에서 다양한 상품들을 둘러보세요.</p>
	    </div>
	
	    <!-- 네비게이션 메뉴 -->
	    <c:choose>
			<c:when test="${empty dto }">
			    <nav>
			        <a href="/ex/user/login">로그인</a>
			        <a href="/ex/user/join">회원가입</a>
			        <a href="/ex/product/selectAll">상품목록</a>
			    </nav>
			</c:when>
			
			<c:otherwise>
				<h3>환영합니다 <c:out value="${dto.u_nickname }" />님!</h3>
				<nav>
					<a href="/ex/product/selectAll">상품목록</a>
					<a href="/ex/user/myPage">마이페이지</a>
					<form action="${pageContext.request.contextPath}/user/logout"
					method="GET">
						<input type="submit" class="logout" value="로그아웃" />
					</form>
				</nav>
				
			</c:otherwise>
	    </c:choose>
	</div>
    <%@include file="/WEB-INF/views/footer/footer.jsp"%>

</body>
</html>
