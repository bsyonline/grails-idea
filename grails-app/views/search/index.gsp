<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-28
  Time: 下午6:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page defaultCodec="none" %>

<html>
<head>
    <meta name="layout" content="index"/>
  <title></title>
</head>
<body>

<!-- content-wrap -->
<div class="content-wrap">

    <!-- content -->
    <div class="content clearfix">
    <div class="result-list">
    <g:each in="${searchResult}" var="r" status="i">
        <div class="search-result">
            <div class="title"><g:link controller="post" action="show" id="${r.id}">${r.title}</g:link></div>
            <div class="info">${r.dateCreated} ${r.author.username}</div>
            <div class="content-text">
                ${r.content}
            </div>
        </div>
    </g:each>
    </div>

        <!-- content -->
    </div>

    <!-- /content-out -->
</div>

</body>
</html>