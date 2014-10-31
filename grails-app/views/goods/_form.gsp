<%@ page import="com.rolex.shop.Goods" %>



<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'price', 'error')} required">
    <label for="price">
        <g:message code="goods.price.label" default="Price"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="price" required="" value="${goodsInstance?.price}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="goods.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${goodsInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'type', 'error')} required">
    <label for="type">
        <g:message code="goods.type.label" default="Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="type" type="number" value="${goodsInstance.type}" required=""/>

</div>

