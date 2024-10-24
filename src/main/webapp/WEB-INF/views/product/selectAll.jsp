<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>상품목록</title>
    <script>
        var result = '${msg}';
        if (result == 'success') {
            alert("처리가 완료되었습니다.");
        }
    </script>
    <style>
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        th {
            background-color: #4f4f4f;
            color: white;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .add-button, .cart-button, .home-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            margin: 10px;
        }
        .add-button {
            background-color: #4f4f4f;
        }
        .add-button:hover {
            background-color: #333;
        }
        .cart-button {
            background-color: #4f4f4f;
            border: none;
            cursor: pointer;
        }
        .cart-button:hover {
            background-color: #333;
        }
        .home-button {
            background-color: #4f4f4f; 
        }
        .home-button:hover {
            background-color: #333; 
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .login-alert {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/views/header/header.jsp"%>
    
    <div class="container">
        <table id="customers">
            <tr>
                <th style="width: 10px">Id</th>
                <th style="width: 100px">Name</th>
                <th style="width: 100px">Brand</th>
                <th style="width: 100px">Type</th>
                <th style="width: 100px">Price</th>
                <th style="width: 100px">Cart</th>
            </tr>
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td>${dto.p_id}</td>
                    <td>${dto.name}</td>
                    <td>${dto.brand}</td>
                    <td>${dto.type}</td>
                    <td>${dto.price}</td>
                    <td>
                        <!-- 사용자 로그인 여부에 따라 처리 -->
                        <c:if test="${not empty sessionScope.dto}">
                            <form action="/ex/cart/insert" method="post" onsubmit="return checkLogin()">
                                <input type="hidden" name="p_id" value="${dto.p_id}">
                                <input type="hidden" name="name" value="${dto.name}">
                                <input type="hidden" name="brand" value="${dto.brand}">
                                <input type="hidden" name="type" value="${dto.type}">
                                <input type="hidden" name="price" value="${dto.price}">
                                <input type="submit" class="cart-button" value="담기">
                            </form>
                        </c:if>
                        <c:if test="${empty sessionScope.dto}">
                            <button class="cart-button" onclick="alert('로그인이 필요합니다.'); window.location.href='/ex/user/login';">
                                담기
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="button-container">
            <c:if test="${empty sessionScope.dto}">
                <button class="add-button" onclick="alert('로그인이 필요합니다.'); window.location.href='/ex/user/login';">장바구니</button>
            </c:if>
            <c:if test="${not empty sessionScope.dto}">
                <a href="/ex/cart/selectAll" class="add-button">장바구니</a>
            </c:if>
            <a href="/ex/" class="home-button">홈으로</a>
        </div>
    </div>
    <%@include file="/WEB-INF/views/footer/footer.jsp"%>
    
</body>
</html>
