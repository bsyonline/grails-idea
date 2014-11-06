
<%@ page import="com.rolex.shop.Order" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-order" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-order" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="paidDate" title="${message(code: 'order.paidDate.label', default: 'Paid Date')}" />
					
						<g:sortableColumn property="shipDate" title="${message(code: 'order.shipDate.label', default: 'Ship Date')}" />
					
						<g:sortableColumn property="no" title="${message(code: 'order.no.label', default: 'No')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'order.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'order.address.label', default: 'Address')}" />
					
						<th><g:message code="order.cart.label" default="Cart" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orderInstanceList}" status="i" var="orderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "paidDate")}</g:link></td>
					
						<td>${fieldValue(bean: orderInstance, field: "shipDate")}</td>
					
						<td>${fieldValue(bean: orderInstance, field: "no")}</td>
					
						<td>${fieldValue(bean: orderInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: orderInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: orderInstance, field: "cart")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${orderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
