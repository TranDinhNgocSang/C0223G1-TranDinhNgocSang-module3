<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/DiscountServlet">
    <label>Product Description </label><input type="text" name="description"><br><br>
    <label>List Price </label><input type="text" name="price"><br><br>
    <label>Discount Percent </label><input type="text" name="percent">
    <button type="submit">submit</button>
</form>
</body>
</html>