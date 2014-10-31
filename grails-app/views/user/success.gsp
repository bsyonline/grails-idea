<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-31
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
    login successful!<br>
    welcome ${session.user.username}
    <g:link url="[controller:'user',action:'logout']" >logout</g:link>
</body>
</html>