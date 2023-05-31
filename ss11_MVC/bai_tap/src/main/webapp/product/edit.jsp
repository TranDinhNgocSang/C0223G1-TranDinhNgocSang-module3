<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/31/2023
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<h3>mời chỉnh sửa</h3>
<form method="post" action="/ProductServlet?action=edit&id=${product.id}">
<table>
    <tr>
        <td>NAME: </td>
        <td><input type="text" name="name" value="${product.getName()}"></td>
    </tr>
    <tr>
        <td>PRICE: </td>
        <td><input type="text" name="price" value="${product.getPrice()}"></td>
    </tr>
    <tr>
        <td>NOTE: </td>
        <td><input type="text" name="note" value="${product.getNote()}"></td>
    </tr>
    <tr>
        <td>PRODUCER: </td>
        <td><input type="text" name="producer" value="${product.getProducer()}"></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="submit"></td>
    </tr>
</table>
</form>
</body>
</html>
