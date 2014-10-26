
<%@ page import="com.rolex.blog.Reply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reply.label', default: 'Reply')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reply" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reply">
			
				<g:if test="${replyInstance?.post}">
				<li class="fieldcontain">
					<span id="post-label" class="property-label"><g:message code="reply.post.label" default="Post" /></span>
					
						<span class="property-value" aria-labelledby="post-label"><g:link controller="post" action="show" id="${replyInstance?.post?.id}">${replyInstance?.post?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="reply.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="reply" action="show" id="${replyInstance?.parent?.id}">${replyInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.replyTo}">
				<li class="fieldcontain">
					<span id="replyTo-label" class="property-label"><g:message code="reply.replyTo.label" default="Reply To" /></span>
					
						<span class="property-value" aria-labelledby="replyTo-label"><g:link controller="user" action="show" id="${replyInstance?.replyTo?.id}">${replyInstance?.replyTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="reply.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${replyInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="reply.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${replyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="reply.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${replyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.replier}">
				<li class="fieldcontain">
					<span id="replier-label" class="property-label"><g:message code="reply.replier.label" default="Replier" /></span>
					
						<span class="property-value" aria-labelledby="replier-label"><g:link controller="user" action="show" id="${replyInstance?.replier?.id}">${replyInstance?.replier?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.replies}">
				<li class="fieldcontain">
					<span id="replies-label" class="property-label"><g:message code="reply.replies.label" default="Replies" /></span>
					
						<g:each in="${replyInstance.replies}" var="r">
						<span class="property-value" aria-labelledby="replies-label"><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:replyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${replyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
