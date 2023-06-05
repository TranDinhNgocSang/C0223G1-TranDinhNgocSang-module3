<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/1/2023
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> form them moi</h3>
<form method="post" action="/UserServlet?action=create">
    <table>
    <tr>
        <th>Name</th>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><input type="text" name="email"></td>
    </tr>
    <tr>
        <th>Country</th>
        <td><input type="text" name="country"></td>
    </tr>
    </table>
    <button type="submit">submit</button>
</form>
</body>
</html>


