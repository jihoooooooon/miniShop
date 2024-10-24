<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매 완료</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; /* 연한 회색 배경 */
            color: #333;
            overflow-y: hidden; /* 세로 스크롤 숨기기 */
        	overflow-x: hidden; /* 가로 스크롤은 자동으로 표시 */
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff; /* 흰색 배경 */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .container h1 {
            color: #555; /* 중간 회색 */
            font-size: 24px;
            margin: 0;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #666; /* 연한 회색 */
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #555; /* 중간 회색 */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #333; /* 어두운 회색 */
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/header/header.jsp"%>
   
    <div class="container">
        <%-- <h1>${cartDto.name}를 구매하였습니다.</h1> --%>
        <p class="message">감사합니다! 구매가 완료되었습니다.</p>
        <a href="/ex/" class="btn">홈으로 돌아가기</a>
    </div>
<%@include file="/WEB-INF/views/footer/footer.jsp"%>
       
</body>
</html>
