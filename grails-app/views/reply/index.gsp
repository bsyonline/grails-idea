
<%@ page import="com.rolex.blog.Reply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reply.label', default: 'Reply')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reply" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="reply.post.label" default="Post" /></th>
					
						<th><g:message code="reply.parent.label" default="Parent" /></th>
					
						<th><g:message code="reply.replyTo.label" default="Reply To" /></th>
					
						<g:sortableColumn property="content" title="${message(code: 'reply.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'reply.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'reply.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${replyInstanceList}" status="i" var="replyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${replyInstance.id}">${fieldValue(bean: replyInstance, field: "post")}</g:link></td>
					
						<td>${fieldValue(bean: replyInstance, field: "parent")}</td>
					
						<td>${fieldValue(bean: replyInstance, field: "replyTo")}</td>
					
						<td>${fieldValue(bean: replyInstance, field: "content")}</td>
					
						<td><g:formatDate date="${replyInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${replyInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${replyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
