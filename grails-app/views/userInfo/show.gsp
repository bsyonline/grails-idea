
<%@ page import="com.rolex.blog.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userInfo.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userInfo">
			
				<g:if test="${userInfoInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="userInfo.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userInfoInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="userInfo.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${userInfoInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.birth}">
				<li class="fieldcontain">
					<span id="birth-label" class="property-label"><g:message code="userInfo.birth.label" default="Birth" /></span>
					
						<span class="property-value" aria-labelledby="birth-label"><g:formatDate date="${userInfoInstance?.birth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="userInfo.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInfoInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="userInfo.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${userInfoInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="userInfo.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInfoInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="userInfo.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${userInfoInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInfoInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userInfo.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${userInfoInstance?.user?.id}">${userInfoInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInfoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInfoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
