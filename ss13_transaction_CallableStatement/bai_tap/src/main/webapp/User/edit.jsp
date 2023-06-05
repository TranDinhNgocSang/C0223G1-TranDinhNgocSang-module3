<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/2/2023
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/UserServlet?action=edit&id=${user.id}">
    <table>
        <tr>
            <th>Name</th>
            <td><input type="text" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input type="text" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <th>Country</th>
            <td><input type="text" name="country" value="${user.country}"></td>
        </tr>
    </table>
    <button type="submit">submit</button>
</form>


</body>
</html>
