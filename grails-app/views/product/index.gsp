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
                        <g:img dir="images" file="${productInstance.images[0].name}"/>
                    </g:link>
                </div>
                <div class="product-info">
                    <div>${fieldValue(bean: productInstance, field: "title")}</div>
                    <div>${fieldValue(bean: productInstance, field: "price")}</div>
                    <div><g:remoteLink id="${productInstance.id}" controller="order" action="addToCart">add to cart</g:remoteLink></div>
                </div>
            </div>
        <div class="product-gird">
            <div class="product-img">
                <g:link action="show" id="${productInstance.id}">
                    <g:img dir="images" file="${productInstance.images[1]?.name}"/>
                </g:link>
            </div>
            <div class="product-info">
                <div>${fieldValue(bean: productInstance, field: "title")}</div>
                <div>${fieldValue(bean: productInstance, field: "price")}</div>
                <div><g:remoteLink id="${productInstance.id}" controller="order" action="addToCart" onsuccess="addToCart(data);">add to cart</g:remoteLink></div>
            </div>
        </div>
    </g:each>

<div class="pagination">
    <g:paginate total="${productInstanceCount ?: 0}"/>
</div>
<g:javascript>
    function addToCart(data){
    alert(data)
        $.post("../order/showItems",null,function(data){
            if($(data).length!=0){
                var totalPrice = data[0].totalPrice;
                var content = "";
                $(data).each(function(i){
                    var title = data[i].title;
                    var price = data[i].price;
                    var num = data[i].num
                    content += "<li><div class='cart-item'><div class='item-icon'><a><img src='${resource(dir: 'images', file: 'rBEhVFIxaGkIAAAAAAGEV0SZGCMAADEsQOGrOkAAYRv640.jpg')}'></a></div><div class='item-info'><div class='item-name'>"+title+"</div><div><span>"+price+"</span>&nbsp;x&nbsp;<span>"+num+"</span></div></div></div></li>";
                });
                content += "<li><div class='total-price'>totalprice:"+totalPrice+"</div></li>"
                $(".product-list").empty().html(content);
            }
        },'json');
    }
</g:javascript>
</body>
</html>
