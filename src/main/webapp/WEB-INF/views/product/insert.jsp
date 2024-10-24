<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
    <title>제품정보 추가</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        header {
            background: #4f4f4f;
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
            border: 1px solid #ccc;
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
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            background: #4f4f4f; 
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background: #333; 
        }
        .button-container {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>제품정보 추가</h1>
    </header>
    <div class="container">
        <form action="/ex/product/insert" method="post">
            <label for="id">ID</label>
            <input type="number" name="id" id="id" value="${ProductDto.id}">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="${ProductDto.name}">
            <label for="brand">Brand</label>
            <input type="text" name="brand" id="brand" value="${ProductDto.brand}">
            <label for="type">Type</label>
            <input type="text" name="type" id="type" value="${ProductDto.type}">
            <label for="price">Price</label>
            <input type="number" name="price" id="price" value="${ProductDto.price}">
            <input type="submit" value="제출">
        </form>
        <div class="button-container">
            <a href="/ex/product/selectAll" class="back-button">뒤로가기</a>
        </div>
    </div>
</body>
</html>
