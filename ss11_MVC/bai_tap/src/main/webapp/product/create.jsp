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
    <title>Title</title>
</head>
<body>
<h3>thêm sản phẩm</h3>
<form method="post" action="/Product?action=create">
<table>
    <tr>
        <th>ID</th>
        <td><input type="text" name="id"></td>
    </tr>
    <tr>
        <th>NAME</th>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <th>PRICE</th>
        <td><input type="text" name="price"></td>
    </tr>
    <tr>
        <th>NOTE</th>
        <td><input type="text" name="note"></td>
    </tr>
    <tr>
        <th>PRODUCER</th>
        <td><input type="text" name="producer"></td>
    </tr>
    <tr>
        <th></th>
        <td><button type="submit">submit</button></td>
    </tr>
</table>
</form>
</body>
</html>