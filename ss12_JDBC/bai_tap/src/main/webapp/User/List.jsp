<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/1/2023
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> danh sach khach hang</h2>
<a href="/UserServlet?action=create">them moi khach hang</a>
<br><br><br>
<form method="post" action="/UserServlet?action=search">
    <input type="text" name="search"><button>tìm kiếm(theo tên)</button>
</form>
<table border="1" cellspacing="0">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach items="${list}" var="user" varStatus="look">
        <tr>
            <td>${look.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/UserServlet?action=edit&id=${user.id}">edit</a></td>
            <td>
                <button type="button" class="btn btn-primary btn-lg"
                        data-bs-toggle="modal"
                        data-bs-target="#modelId"
                        onclick="remove('${user.getId()}', '${user.getName()}')">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>

</table>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId"></h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h3>Bạn có chắc chắn xóa khách hàng có tên:
                    <span id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/UserServlet?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>
<script>
    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
