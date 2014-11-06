<%@ page import="com.rolex.shop.Goods" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-goods" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li style="float: right;" onmouseover="javascript:$('.cart').show()" onmouseout="javascript:$('.cart').hide()"><g:link class="create" controller="order" action="showCart">
            <g:message code="default.goods.cart" default="Cart"/></g:link></li>
    </ul>
    <div style="float: right;border:solid 1px #e5e5e5;display: none;z-index: 9999" class="cart">
        <g:if test="${cart?.items}">
            <div class="item-list" style="width: 300px">
                <g:each in="${cart.items}" status="i" var="c">
                    <div style="width: 200px;float: left">${c.goods.title}</div>

                    <div style="float: right">￥${c.goods.price}X${c.itemNum}</div>
                </g:each>

            </div>
        </g:if>
        <g:if test="${!cart?.items}">
            还没有宝贝
        </g:if>
    </div>
</div>


<div id="list-goods" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="price" title="${message(code: 'goods.price.label', default: 'Price')}"/>

            <g:sortableColumn property="title" title="${message(code: 'goods.title.label', default: 'Title')}"/>

            <g:sortableColumn property="type" title="${message(code: 'goods.type.label', default: 'Type')}"/>

        <g:sortableColumn property="type" title="${message(code: 'goods.type.label', default: 'Type')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${goodsInstance.id}">${fieldValue(bean: goodsInstance, field: "price")}</g:link></td>

                <td>${fieldValue(bean: goodsInstance, field: "title")}</td>

                <td>${fieldValue(bean: goodsInstance, field: "type")}</td>

                <td><g:link id="${goodsInstance.id}" controller="order" action="addToCart">add to cart</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${goodsInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
