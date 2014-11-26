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
                    <div class="btn-add">
                        <g:remoteLink id="${productInstance.id}" controller="order" action="addToCart" onclick="flyToCart();" onSuccess="addToCart(data)">add to cart</g:remoteLink>
                    </div>
                </div>
            </div>

    </g:each>

<div class="pagination">
    <g:paginate total="${productInstanceCount ?: 0}"/>
</div>
<g:javascript>
    function addToCart(data){
        var arr = $(eval('(' + data + ')'));
            if(arr.length!=0){
                var totalPrice = arr[0].totalPrice;
                var content = "";
                arr.each(function(i){
                    var title = arr[i].title;
                    var price = arr[i].price;
                    var num = arr[i].num
                    var image = arr[i].image
                    content += "<li><div class='cart-item'><div class='item-icon'><a><img src='${resource(dir:"/")}/images/"+image+"'></a></div><div class='item-info'><div class='item-name'>"+title+"</div><div><span>"+price+"</span>&nbsp;x&nbsp;<span>"+num+"</span></div></div></div></li>";
                });
                content += "<li><div class='total-price'>totalprice:"+totalPrice+"</div></li>"
                $(".product-list").empty().html(content);
            }
    }
    var div;
    $(function(){
        $(".btn-add").bind("click",function(){
            addToCart();
            div = $(this).parent().siblings(".product-img").clone();
            div.appendTo($(this).parent().siblings(".product-img")).css("position","fixed");
            div.animate({
                top:"10px",
                right:"160px",
                width:'40px',
                height:'40px',
                opacity:'1'
            },700,function(){
                div.find("img").css("width","40px").css("height","40px").css("z-index",'9999').css("position",'absolute');
                setInterval(function(){
                    div.fadeOut(100);
                },300);
            });
        });
    });

</g:javascript>
</body>
</html>
