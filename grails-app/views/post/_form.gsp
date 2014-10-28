<%@ page import="com.rolex.blog.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="post.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${postInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="post.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${postInstance?.author}"/>

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

