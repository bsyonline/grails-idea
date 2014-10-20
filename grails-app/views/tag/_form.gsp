<%@ page import="com.rolex.blog.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tagInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="tag.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${tagInstance?.url}"/>

</div>

