<%@ page import="com.rolex.map.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'x', 'error')} required">
	<label for="x">
		<g:message code="project.x.label" default="X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="x" value="${fieldValue(bean: projectInstance, field: 'x')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'y', 'error')} required">
	<label for="y">
		<g:message code="project.y.label" default="Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="y" value="${fieldValue(bean: projectInstance, field: 'y')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="project.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${projectInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${projectInstance?.name}"/>

</div>

