<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 6/2/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/student" method="post">
    <input name="action" value="create" hidden>
    <input  name="name" placeholder="nhập tên" id="name"><br>
    <small style="color: red" id="nameError"></small>
    <br>
    <input type="radio" name="gender" value="true"> Nam
    <input type="radio" name="gender" value="false"> Nữ<br>
    <input type="number" value="0" name="point" placeholder="nhập điểm"><br>
    <select name="classId">
        <option value="0">Chon lớp</option>
        <c:forEach var="clazz" items="${classList}">
            <option value="${clazz.id}">${clazz.name}</option>
        </c:forEach>
    </select>><br>
    <button type="submit">Save</button>
</form>
</body>
</html>
