<%@ page import="com.rolex.blog.Navigation" %>



<div class="fieldcontain ${hasErrors(bean: navigationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="navigation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${navigationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: navigationInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="navigation.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${navigationInstance?.url}"/>

</div>

