<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
    <title>제품 정보 수정</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        header {
            background-color: #4f4f4f;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        form {
            padding: 20px;
        }
        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        form input[type="text"],
        form input[type="number"],
        form input[type="submit"] {
            display: block;
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        form input[type="submit"] {
            background: #4f4f4f;
            border: none;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        form input[type="submit"]:hover {
            background: #333;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
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
        }
        .action-button:hover {
            background: #333;
        }
        .back-button {
            background: #4f4f4f; /* 기존 버튼 색상 */
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background: #333; /* 기존 버튼 호버 색상 */
        }
    </style>
</head>
<body>
    <header>
        <h1>제품 정보 수정</h1>
    </header>
    <div class="container">
        <form action="/ex/product/insert" method="post">
            <label for="id">ID</label>
            <input type="number" name="p_id" id="p_id" value="${productDto.p_id}">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" value="${productDto.name}">
            <label for="brand">브랜드</label>
            <input type="text" name="brand" id="brand" value="${productDto.brand}">
            <label for="type">타입</label>
            <input type="text" name="type" id="type" value="${productDto.type}">
            <label for="price">가격</label>
            <input type="number" name="price" id="price" value="${productDto.price}">
            
            <input type="submit" value="제출">
        </form>

        <div class="action-buttons">
            <a href="/ex/admin/productManagement" class="back-button">뒤로가기</a>
        </div>
    </div>
</body>
</html>
