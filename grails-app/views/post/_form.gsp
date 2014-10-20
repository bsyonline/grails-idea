<%@ page import="com.rolex.blog.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="post.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${postInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'publisher', 'error')} required">
	<label for="publisher">
		<g:message code="post.publisher.label" default="Publisher" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="publisher" required="" value="${postInstance?.publisher}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="post.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
    <g:textArea class="ckeditor" name="content">${postInstance?.content}</g:textArea>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'pic', 'error')} ">
	<label for="pic">
		<g:message code="post.pic.label" default="Pic" />
		
	</label>
	<g:textField name="pic" value="${postInstance?.pic}"/>

</div>

