<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-11-4
  Time: 上午11:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.rolex.store.Cart" contentType="text/html;charset=UTF-8" %>

${page}

        <div class="item-list">
            <div class="item-list-title">
                <div class="label-1">商品</div>
                <div class="label-2">属性</div>
                <div class="label-2">单价</div>
                <div class="label-2">数量</div>
                <div class="label-2">总价</div>
                <div class="label-2"></div>
            </div>
        <g:if test="${cart?.items}">
            <g:each in="${cart.items}" status="i" var="c">
                <div class="item-list-content-warp">
                    <div class="item-list-content-row">
                        <div class="label-1">
                            <div class="shortcut">
                                <g:img dir="images" file="${c.product.images[0].name}"/>
                            </div>
                            <div>
                                ${c.product.title}
                            </div>
                        </div>
                        <div class="label-2">red</div>
                        <div class="label-2">${c.product.price}</div>
                        <div class="label-2">${c.itemNum}</div>
                        <div class="label-2">${(c.itemNum as int)*(c.product.price as BigDecimal)}</div>
                       %{-- <g:if test="${page=='show'}">--}%
                            <div class="label-2">
                                <g:link action="removeFromCart" controller="order" id="${c.id}">remove</g:link>
                            </div>
                        %{--</g:if><br>--}%
                    </div>

                </div>
            </g:each>
            <div class="total">totalPrice:${cart.totalPrice()}</div>
        </g:if>
        <g:if test="${!cart?.items}">
            <div class="item-list-empty">
                <div class="item-list-content-row">
                    还没有宝贝
                </div>
            </div>
            <div class="total">totalPrice:0.00</div>
        </g:if>
        </div>




