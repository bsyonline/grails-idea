<%@ page import="com.rolex.store.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="store">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div id="show-product" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="row">
        <div class="product-shortcut">
            <div class="main">
                <g:img dir="images" file="T1GZHjFUBaXXcXbVA1_040057.jpg_b.jpg"/>
            </div>
            <div class="shortcuts">
                <div class="shortcut">
                    <g:img dir="images" file="TB1WjYnFVXXXXa1XpXXXXXXXXXX.jpg_120x120.jpg"/>
                </div>
                <div class="shortcut">
                    <g:img dir="images" file="TB1WjYnFVXXXXa1XpXXXXXXXXXX.jpg_120x120.jpg"/>
                </div>
                <div class="shortcut">
                    <g:img dir="images" file="TB1WjYnFVXXXXa1XpXXXXXXXXXX.jpg_120x120.jpg"/>
                </div>
                <div class="shortcut">
                    <g:img dir="images" file="TB1WjYnFVXXXXa1XpXXXXXXXXXX.jpg_120x120.jpg"/>
                </div>
                <div class="shortcut">
                    <g:img dir="images" file="TB1WjYnFVXXXXa1XpXXXXXXXXXX.jpg_120x120.jpg"/>
                </div>
            </div>
        </div>
        <div class="product-info-box">
            <div class="title"><g:fieldValue bean="${productInstance}" field="title"/></div>
            <div class="price"><span>价格：</span><g:fieldValue bean="${productInstance}" field="price"/></div>
            <div class="price"><span>运费：</span><g:fieldValue bean="${productInstance}" field="price"/></div>
            <div class="price"><span>参数：</span><g:fieldValue bean="${productInstance}" field="price"/></div>
            <div class="price"><span>数量：</span>1</div>
            <div class="btn-bar">
                <div class="btn-buy"><g:link controller="order" action="create">立刻购买</g:link></div>
                <div class="btn-add"><g:link controller="order" action="addToCart">加入购物车</g:link></div>
            </div>

        </div>
    </div>
    <div class="row">
        明细
    </div>

</div>
</body>
</html>
