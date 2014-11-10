<%@ page import="com.rolex.store.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="store">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>



    <g:each in="${productInstanceList}" status="i" var="productInstance">
            <div class="product-gird">
                <div class="product-img">
                    <g:link action="show" id="${productInstance.id}">
                        <g:img dir="images" file="rBEhVFIxaGkIAAAAAAGEV0SZGCMAADEsQOGrOkAAYRv640.jpg"/>
                    </g:link>
                </div>
                <div class="product-info">
                    <div>${fieldValue(bean: productInstance, field: "title")}</div>
                    <div>${fieldValue(bean: productInstance, field: "price")}</div>
                    <div><g:link id="${productInstance.id}" controller="order" action="addToCart">add to cart</g:link></div>
                </div>
            </div>
        <div class="product-gird">
            <div class="product-img">
                <g:link action="show" id="${productInstance.id}">
                    <g:img dir="images" file="rBEhVFIxaGkIAAAAAAGEV0SZGCMAADEsQOGrOkAAYRv640.jpg"/>
                </g:link>
            </div>
            <div class="product-info">
                <div>${fieldValue(bean: productInstance, field: "title")}</div>
                <div>${fieldValue(bean: productInstance, field: "price")}</div>
                <div><g:link id="${productInstance.id}" controller="order" action="addToCart">add to cart</g:link></div>
            </div>
        </div>
    </g:each>

<div class="pagination">
    <g:paginate total="${productInstanceCount ?: 0}"/>
</div>

</body>
</html>
