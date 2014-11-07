<%@ page import="com.rolex.store.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="store">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<table class="table table-bordered table-hover">
    <tr>

        <g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}"/>

        <g:sortableColumn property="title" title="${message(code: 'product.title.label', default: 'Title')}"/>

        <g:sortableColumn property="type" title="${message(code: 'product.type.label', default: 'Type')}"/>

        <g:sortableColumn property="type" title="${message(code: 'product.type.label', default: 'Type')}"/>

    </tr>
    <g:each in="${productInstanceList}" status="i" var="productInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show"
                        id="${productInstance.id}">${fieldValue(bean: productInstance, field: "price")}</g:link></td>

            <td>${fieldValue(bean: productInstance, field: "title")}</td>

            <td>${fieldValue(bean: productInstance, field: "type")}</td>

            <td><g:link id="${productInstance.id}" controller="order" action="addToCart">add to cart</g:link></td>

        </tr>
    </g:each>
</table>
<div class="pagination">
    <g:paginate total="${productInstanceCount ?: 0}"/>
</div>

</body>
</html>
