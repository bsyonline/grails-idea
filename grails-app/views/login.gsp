<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-31
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
    <g:form url="[controller:'user',action:'signin']" method="post">
        <div>
        <label for="username">
            <g:message code="user.username.label" default="Username" />
            <span class="required-indicator">*</span>
        </label>
            <g:field type="text" name="username"/>
        </div>
        <div>
        <label for="password">
        <g:message code="user.password.label" default="Password" />
        <span class="required-indicator">*</span>
        </label>
        <g:field type="password" name="password"/>
        </div>
        <g:actionSubmit value="login" action="signin" />
    </g:form>
</body>
</html>