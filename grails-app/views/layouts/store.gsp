<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-10-19
  Time: 上午11:43
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<!--[if IE 7 ]>
<html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>
<html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html> <!--<![endif]-->

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>grails-store</title>


    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <g:javascript src="jquery-1.11.1.min.js"/>
    <g:javascript src="scrollToTop.js"/>
    <g:layoutHead/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap/css/bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'store.css')}" type="text/css">
</head>

<body>
<div class="container">
    <header>
        <div class="cart">
            <ul>
                <li class="cart-label">
                    <div class="cart-label-text">
                        <g:link action="showCart" controller="order"><span>cart</span></g:link>
                    </div>

                    <ul class="cart-body">
                        <li><div class="cart-body-title">最近加入购物车的商品</div></li>
                        <div class="product-list">
                            <li>
                                <div class="cart-item">
                                    没有商品
                                </div>
                            </li>
                        </div>

                        <g:if test="${session.user}">
                            <li><div class="checkout"><g:link controller="order" action="create"><span>去结算</span></g:link></div></li>
                        </g:if>

                    </ul>
                </li>
            </ul>
        </div>
    </header>
    <g:layoutBody/>
</div>
<g:javascript>
    $(function(){
        $(".cart-label").bind("mouseover",function(){
            $(".cart-body").show();
        });
        $(".cart-label").bind("mouseout",function(){
            $(".cart-body").hide();
        });
        $.post("../order/showItems",null,function(data){
            if($(data).length!=0){
                var totalPrice = data[0].totalPrice;
                var content = "";
                $(data).each(function(i){
                    var title = data[i].title;
                    var price = data[i].price;
                    var num = data[i].num
                    var image = data[i].image
                    content += "<li><div class='cart-item'><div class='item-icon'><a><img src='${resource(dir: '/')}/images/"+image+"'></a></div><div class='item-info'><div class='item-name'>"+title+"</div><div><span>"+price+"</span>&nbsp;x&nbsp;<span>"+num+"</span></div></div></div></li>";
                });
                content += "<li><div class='total-price'>totalprice:"+totalPrice+"</div></li>"
                $(".product-list").empty().html(content);
            }
        },'json');
    });


</g:javascript>

</body>
</html>
