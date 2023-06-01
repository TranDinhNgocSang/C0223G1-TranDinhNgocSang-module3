<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/31/2023
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>danh sách sản phẩm</h1>
<p><a href="/Product?action=create">thêm mới sản phẩm</a></p>

<form method="post" action="/Product?action=search">
    <input type="text" name="name"><button type="submit">tìm kiếm</button>
</form>
<table border="1" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>NOTE</th>
        <th>PRODUCER</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach items="${list}" var="Product" varStatus="look">
<tr>
    <td>${Product.id}</td>
    <td><a href="Product?action=view&id=${Product.getId()}">${Product.name}</a></td>
    <td>${Product.price}</td>
    <td>${Product.note}</td>
    <td>${Product.producer}</td>
    <td><a href="Product?action=edit&id=${Product.getId()}">edit</a></td>
    <td><a href="Product?action=delete&id=${Product.getId()}">delete</a></td>
</tr>
    </c:forEach>
</table>
</body>
</html>
