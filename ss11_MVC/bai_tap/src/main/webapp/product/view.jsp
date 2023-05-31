<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/31/2023
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>chi tiết sản phẩm</h3>
<p>
    <a href="/ProductServlet">Back to Product list</a>
</p>
<table>
    <tr>
        <th>Name</th>
        <td>${product.name}</td>
    </tr>
    <tr>
        <th>Price</th>
        <td>${product.price}</td>
    </tr>
    <tr>
        <th>Note</th>
        <td>${product.note}</td>
    </tr>
    <tr>
        <th>Producer</th>
        <td>${product.producer}</td>
    </tr>
</table>
</body>
</html>