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
<form method="post" action="/ProductServlet?action=delete&id=${product.id}">
<h3>bạn có muốn khóa?</h3>
<button type="submit">xóa</button>
</form>
<a href="/ProductServlet">quay lại</a>
</body>
</html>
