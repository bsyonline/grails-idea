<%@ page import="com.rolex.blog.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="profile.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${profileInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="profile.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${profileInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="profile.birth.label" default="Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birth" precision="day"  value="${profileInstance?.birth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${profileInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="profile.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gender" type="number" value="${profileInstance.gender}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${profileInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${profileInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="profile.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.rolex.blog.User.list()}" optionKey="id" required="" value="${profileInstance?.user?.id}" class="many-to-one"/>

</div>

