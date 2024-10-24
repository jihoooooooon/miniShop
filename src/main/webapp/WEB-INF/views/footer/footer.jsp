<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopang</title>
    <style>
        body {
            margin: 0; /* 기본 여백 제거 */
            padding: 0; /* 기본 패딩 제거 */
            box-sizing: border-box; /* 패딩과 보더가 크기에 포함되도록 설정 */
            min-height: 100vh; /* 페이지 최소 높이를 화면 높이로 설정 */
            display: flex;
            flex-direction: column; /* 자식 요소를 수직으로 배치 */
        }

        footer {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #333;
            color: white;
            width: 100%;
            height: 50px; /* 푸터의 높이 */
            z-index: 1000; /* 다른 요소 위에 표시되도록 함 */
            position: relative; /* 기본 상대 위치 */
            margin-top: auto; /* 페이지의 하단으로 밀어줌 */
        }
    </style>
</head>
<body>
    <footer class="footer">
        <p>&copy; 2024 Shopang 쇼핑몰. All rights reserved.</p>
    </footer>
</body>
</html>
