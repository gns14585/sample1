<%--
  Created by IntelliJ IDEA.
  User: 사용자
  Date: 2023-10-16
  Time: PM 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    h1, h2, h4 {
        width: 100%;
        text-align: center;
    }

    table {
        margin: 0 auto;
        text-align: center;
        border: 1px solid black;
        border-collapse: collapse;
    }

    tr, th, td {
        border: 1px solid black;
        padding: 10px;
    }

    .tinp {
        width: 250px;
        height: 150px;
        border-radius: 10px;
    }
</style>
<h1>To do List</h1>
<h4>
    <form action="/add" method="post" enctype="multipart/form-data">
        <input type="text" name="todo" class="tinp">
        <br>
        <div>
            첨부파일
            <input type="file" accept="image/*" multiple name="files">
        </div>
        <br>
        <button>추가</button>
    </form>
</h4>

<hr>

<h2>목록</h2>
<div>
    <table>
        <tr>
            <th>id</th>
            <th>todo</th>
            <th>파일</th>
            <th>입력일시</th>
        </tr>
        <c:forEach items="${todoList}" var="todo">
            <tr>
                <td>${todo.id}</td>
                <td>${todo.todo}</td>
                <td>
                    <%-- 파일이 어떤건지 클릭했을때 확인 --%>
                    <%-- 파일이 없을땐 안보이게 if문 사용 --%>
                    <c:if test="${todo.numOfFiles > 0}">
                        <a href="/files?id=${todo.id}">
                                ${todo.numOfFiles}
                        </a>
                    </c:if>
                </td>
                <td>${todo.inserted}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
