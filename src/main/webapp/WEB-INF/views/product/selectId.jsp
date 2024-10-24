<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
    <title>제품관리</title>
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
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            background: #4f4f4f; /* 기존 버튼 색상 */
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
        <h1>제품관리</h1>
    </header>
    <div class="container">
        <table id="customers">
            <tr>
                <th style="width: 10px">선택</th>
                <th style="width: 10px">Id</th>
                <th style="width: 100px">name</th>
                <th style="width: 100px">brand</th>
                <th style="width: 100px">type</th>
                <th style="width: 100px">price</th>
            </tr>
            
            <!-- 여기서 ${dto}는 적절한 데이터를 바인딩해야 합니다. -->
            <tr>
                <td><a href="/ex/product/delete?id=${dto.id}" class="action-button">삭제</a></td>
                <td>${dto.id}</td>
                <td>${dto.name}</td>
                <td>${dto.brand}</td>
                <td>${dto.type}</td>
                <td>${dto.price}</td>
            </tr>
            
        </table>
        
        <div class="action-buttons">
            <a href='/ex/product/update?id=${dto.id}&name=${dto.name}&brand=${dto.brand}&type=${dto.type}&price=${dto.price}' 
               class="action-button">수정</a>
            <a href="/ex/product/selectAll?id=" class="back-button">뒤로가기</a>
        </div>
    </div>
</body>
</html>
