<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2023-10-23
  Time: PM 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${filePathList}" var="path">
    <div style="border: 1px solid black; margin: 5px; width: 50%;">
        <img src="${path}" alt="" style="width: 100%;">
    </div>
</c:forEach>
</body>
</html>
