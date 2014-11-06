<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-11-4
  Time: 上午11:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.rolex.shop.Cart" contentType="text/html;charset=UTF-8" %>


    <g:if test="${cart?.items}">
        <div class="item-list">
            <div>
                <span>title</span><span>price</span><span>itemNum</span>
            </div>
            <g:each in="${cart.items}" status="i" var="c">
                <span>${c.goods.title}</span>&nbsp;|&nbsp;<span>${c.goods.price}</span>&nbsp;|&nbsp;<span>${c.itemNum}</span>
                <g:if test="${page=='show'}">
                <g:link action="removeFromCart" controller="order" id="${c.id}">remove</g:link>
                </g:if><br>
            </g:each>
            <span>totalPrice:${cart.totalPrice()}</span>
        </div>
    </g:if>

    <g:if test="${!cart?.items}">
        还没有宝贝
    </g:if>


