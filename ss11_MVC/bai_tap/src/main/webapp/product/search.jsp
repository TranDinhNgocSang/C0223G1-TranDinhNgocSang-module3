<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/31/2023
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Produce details</h1>
<p>
    <a href="/ProductServlet">Back to customer list</a>
</p>
<table>
    <tr>
        <th>stt</th>
        <th>name</th>
        <th>price</th>
        <th>note</th>
        <th>producer</th>
    </tr>
    <tr>
        <td>${look.count}</td>
        <td>${Product.name}</td>
        <td>${Product.price}</td>
        <td>${Product.note}</td>
        <td>${Product.producer}</td>
    </tr>
</table>
</body>
</html>
