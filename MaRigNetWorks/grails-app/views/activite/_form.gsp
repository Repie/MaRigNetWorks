<%@ page import="marignetworks.Activite" %>



<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'titre', 'error')} required">
	<label for="titre">
		<g:message code="activite.titre.label" default="Titre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titre" required="" value="${activiteInstance?.titre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'descriptif', 'error')} ">
	<label for="descriptif">
		<g:message code="activite.descriptif.label" default="Descriptif" />
		
	</label>
	<g:textField name="descriptif" value="${activiteInstance?.descriptif}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'participants', 'error')} ">
	<label for="participants">
		<g:message code="activite.participants.label" default="Participants" />
		
	</label>
	
</div>

