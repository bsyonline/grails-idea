<%@ page import="com.rolex.store.Order" %>




<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="order.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${orderInstance?.address}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'consignee', 'error')} required">
	<label for="consignee">
		<g:message code="order.consignee.label" default="Consignee" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="consignee" required="" value="${orderInstance?.consignee}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="order.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${orderInstance?.phone}"/>

</div>


