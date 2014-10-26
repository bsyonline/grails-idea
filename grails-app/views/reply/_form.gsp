<%@ page import="com.rolex.blog.Reply" %>



<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'post', 'error')} ">
	<label for="post">
		<g:message code="reply.post.label" default="Post" />
		
	</label>
	<g:select id="post" name="post.id" from="${com.rolex.blog.Post.list()}" optionKey="id" value="${replyInstance?.post?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="reply.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.rolex.blog.Reply.list()}" optionKey="id" value="${replyInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replyTo', 'error')} ">
	<label for="replyTo">
		<g:message code="reply.replyTo.label" default="Reply To" />
		
	</label>
	<g:select id="replyTo" name="replyTo.id" from="${com.rolex.blog.User.list()}" optionKey="id" value="${replyInstance?.replyTo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="reply.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${replyInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replier', 'error')} required">
	<label for="replier">
		<g:message code="reply.replier.label" default="Replier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="replier" name="replier.id" from="${com.rolex.blog.User.list()}" optionKey="id" required="" value="${replyInstance?.replier?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replies', 'error')} ">
	<label for="replies">
		<g:message code="reply.replies.label" default="Replies" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${replyInstance?.replies?}" var="r">
    <li><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reply" action="create" params="['reply.id': replyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
</li>
</ul>


</div>

