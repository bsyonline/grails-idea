
<%@ page import="com.rolex.shop.Order" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-order" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list order">
			
				<g:if test="${orderInstance?.paidDate}">
				<li class="fieldcontain">
					<span id="paidDate-label" class="property-label"><g:message code="order.paidDate.label" default="Paid Date" /></span>
					
						<span class="property-value" aria-labelledby="paidDate-label"><g:fieldValue bean="${orderInstance}" field="paidDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.shipDate}">
				<li class="fieldcontain">
					<span id="shipDate-label" class="property-label"><g:message code="order.shipDate.label" default="Ship Date" /></span>
					
						<span class="property-value" aria-labelledby="shipDate-label"><g:fieldValue bean="${orderInstance}" field="shipDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.no}">
				<li class="fieldcontain">
					<span id="no-label" class="property-label"><g:message code="order.no.label" default="No" /></span>
					
						<span class="property-value" aria-labelledby="no-label"><g:fieldValue bean="${orderInstance}" field="no"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="order.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${orderInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="order.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${orderInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="order.cart.label" default="Cart" /></span>
					
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${orderInstance?.cart?.id}">${orderInstance?.cart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.consignee}">
				<li class="fieldcontain">
					<span id="consignee-label" class="property-label"><g:message code="order.consignee.label" default="Consignee" /></span>
					
						<span class="property-value" aria-labelledby="consignee-label"><g:fieldValue bean="${orderInstance}" field="consignee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.orderDate}">
				<li class="fieldcontain">
					<span id="orderDate-label" class="property-label"><g:message code="order.orderDate.label" default="Order Date" /></span>
					
						<span class="property-value" aria-labelledby="orderDate-label"><g:fieldValue bean="${orderInstance}" field="orderDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="order.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${orderInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="order.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${orderInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${orderInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="order.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${orderInstance?.user?.id}">${orderInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:orderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${orderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
