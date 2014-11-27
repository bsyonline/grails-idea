<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="store">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-order" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${orderInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${orderInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:render template="/order/showCart" params="${[cart:cart,page:'order']}"/>
			<div class="save-btn">
				<g:if test="${!cart?.items}">
            		<a href="javascript:void(0);" class="disabled">submit</a>
				</g:if>
				<g:if test="${cart?.items}">
					<g:link controller="order" action="create">submit</g:link>
				</g:if>
			</div>
			<div class="back-btn">
				<g:link controller="product" action="index">shopping</g:link>
			</div>
		</div>
	</body>
</html>
