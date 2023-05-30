<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%--<%!--%>
<%--    Map<String, String> dic = new HashMap<>();--%>
<%--%>--%>

<%
    Map<String, String> dic = new HashMap<>();
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");

    String search = request.getParameter("search");
    PrintWriter printWriter = response.getWriter();

    String result = dic.get(search);
    if (dic.containsKey(search)) {
//        out.println("Word: " + search);
        printWriter.println("Word: " + search);
//        out.println("Result: " + result);
        printWriter.println("Result: " + result);

    } else {
//        out.println("Not found");
        printWriter.println("Not found");
    }

%>

</body>
</html>