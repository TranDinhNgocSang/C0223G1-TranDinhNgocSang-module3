<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/30/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<c:import url="navbar.jsp"></c:import>
<h1>Danh sách khách hàng</h1>
<table border-collapse: collapse>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="c" items="${list}" varStatus="look">
        <tr>
            <td>
                <c:out value="${look.count}"/>
            </td>
            <td>
                <c:out value="${c.name}"/>
            </td>
            <td>
                <c:out value="${c.dayOfBirth}"/>
            </td>
            <td>
                <c:out value="${c.address}"/>
            </td>
            <td>
                <img width="40px" src="${c.image}">
            </td>
        </tr>

    </c:forEach>
</table>

</body>
</html>
