<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopang</title>
    <style>
        header {
            background-color: #333 !important; /* 배경색 */
            color: white !important; /* 글씨 색 */
            display: flex !important;
            justify-content: space-between !important; /* 양쪽 끝으로 정렬 */
            align-items: center !important; /* 세로 가운데 정렬 */
            height: 130px !important; /* 높이 설정 */
            width: 100% !important;
            position: relative; /* relative 설정 */
        }

        header a {
            color: white !important;
            text-decoration: none !important; /* 밑줄 제거 */
        }

        .logo {
            position: absolute;
            left: 50%;
            transform: translateX(-50%); /* 로고를 가운데 정렬 */
        }

        .left, .right {
            margin-top: 70px;
        }

        .left {
            margin-left: 20px; /* 헤더 왼쪽 여백 */
        }

        .right {
            margin-right: 20px; /* 헤더 오른쪽 여백 */
        }

        .left a {
            font-weight: 700;
            font-size: 20px;
        }

        .right a {
            margin-left: 20px; /* 님 버튼 간격 */
            font-weight: 700;
            font-size: 20px;
        }
    </style>
</head>
<body>
    
    <header>
        <!-- 왼쪽에 관리자 버튼 -->
        <div class="left">
            <sec:authorize access="hasAnyRole('ADMIN')">
                <a class="admin" href="/ex/admin/userManagement">관리자</a>
            </sec:authorize>
        </div>
        
        <!-- 로고를 가운데에 배치 -->
        <div class="logo">
            <h1><a href="/ex/">Shopang</a></h1>
        </div>

        <!-- 오른쪽에 '님' 버튼 -->
        <div class="right">
            <c:choose>
                <c:when test="${empty dto}">
                    <!-- 로그인 안 된 경우 -->
                </c:when>
                <c:otherwise>
                    <p>
                        <a href="/ex/user/myPage"><c:out value="${dto.u_nickname}" />님</a>
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
    
</body>
</html>
