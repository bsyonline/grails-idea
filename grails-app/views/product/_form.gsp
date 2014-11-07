<%@ page import="com.rolex.store.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
    <label for="price">
        <g:message code="product.price.label" default="Price"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="price" required="" value="${productInstance?.price}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="product.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${productInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} required">
    <label for="type">
        <g:message code="product.type.label" default="Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="type" type="number" value="${productInstance.type}" required=""/>

</div>

