<%@ page import="com.rolex.blog.Profile" %>



<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="userInfo.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${userInfoInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="userInfo.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${userInfoInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'birth', 'error')} required">
	<label for="birth">
		<g:message code="userInfo.birth.label" default="Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birth" precision="day"  value="${userInfoInstance?.birth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="userInfo.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInfoInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="userInfo.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gender" type="number" value="${userInfoInstance.gender}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="userInfo.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${userInfoInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="userInfo.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${userInfoInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInfoInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userInfo.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.rolex.blog.User.list()}" optionKey="id" required="" value="${userInfoInstance?.user?.id}" class="many-to-one"/>

</div>

