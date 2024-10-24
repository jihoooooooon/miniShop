<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>장바구니</title>
    <script>
        var result = '${msg}';
        if (result == 'success') {
            alert("처리가 완료되었습니다.");
        }
    </script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
            overflow-y: auto; /* 세로 스크롤 숨기기 */
        	overflow-x: hidden; /* 가로 스크롤은 자동으로 표시 */
        }
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
        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .action-button {
            display: inline-block;
            padding: 10px 20px;
            background: #4f4f4f;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease;
            margin: 0 10px;
        }
        .action-button:hover {
            background: #333;
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
                <th style="width: 100px">Buy</th>
                <th style="width: 100px">Delete</th>
            </tr>
            <c:forEach items="${list}" var="cartDto">
                <tr>
                    <td>${cartDto.p_id}</td>
                    <td>${cartDto.name}</td>
                    <td>${cartDto.brand}</td>
                    <td>${cartDto.type}</td>
                    <td>${cartDto.price}</td>
                    <td><a href="/ex/cart/buy?p_id=${cartDto.p_id}" class="action-button">구매</a></td>
                    <td><a href="/ex/cart/delete?p_id=${cartDto.p_id}" class="action-button">삭제</a></td>
                </tr>
            </c:forEach>
        </table>
        
        <div class="action-buttons">
            <a href="/ex/product/selectAll" class="action-button">상품목록</a>
            <a href="/ex/" class="action-button">홈으로</a>
        </div>
    </div>
    
    <%@include file="/WEB-INF/views/footer/footer.jsp"%>
   
</body>
</html>
