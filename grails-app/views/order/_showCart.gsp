<%--
  Created by IntelliJ IDEA.
  User: rolex
  Date: 14-11-4
  Time: 上午11:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.rolex.store.Cart" contentType="text/html;charset=UTF-8" %>

${page}
    <g:if test="${cart?.items}">
        <div class="item-list">
            <div class="item-list-title">
                <div class="label-1">product</div>
                <div class="label-2">type</div>
                <div class="label-2">price</div>
                <div class="label-2">itemNum</div>
                <div class="label-2">amount</div>
                <div class="label-2">operation</div>
            </div>
            <g:each in="${cart.items}" status="i" var="c">
                <div class="item-list-content-warp">
                    <div class="item-list-content-row">
                        <div class="label-1">
                            <div class="shortcut">
                                <img src="${resource(dir:'images',file: 'rBEhVFIxaGkIAAAAAAGEV0SZGCMAADEsQOGrOkAAYRv640.jpg')}"  />
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
        </div>
    </g:if>

    <g:if test="${!cart?.items}">
        还没有宝贝
    </g:if>


