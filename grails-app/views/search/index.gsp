<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-28
  Time: 下午6:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

  <title></title>
</head>
<body>
    <table>
        <tr>
            <td>id</td>
            <td>title</td>
            <td>content</td>
        </tr>
    <g:each in="${searchResult}" var="s">
        <td>${s.id}</td>
        <td>${s.title}</td>
        <td>${s.content}</td>
    </g:each>
    </table>
</body>
</html>