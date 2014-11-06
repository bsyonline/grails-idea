<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-11-4
  Time: 上午11:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.rolex.shop.Cart" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
  <title></title>

</head>
<body>
<div>
    <g:if test="${cart?.items}">
        <div class="item-list">
            <div>
                <span>title</span><span>price</span><span>itemNum</span>
            </div>
            <g:each in="${cart.items}" status="i" var="c">
                <span>${c.goods.title}</span>&nbsp;|&nbsp;<span>${c.goods.price}</span>&nbsp;|&nbsp;<span>${c.itemNum}</span>
                <g:link action="removeFromCart" controller="goods" id="${c.id}">remove</g:link><br>
            </g:each>
            <span>${cart.totalPrice()}</span>
        </div>
    </g:if>

    <g:if test="${!cart?.items}">
        还没有宝贝
    </g:if>
    <g:link action="save" controller="order">submit order</g:link>
</div>
</body>
</html>