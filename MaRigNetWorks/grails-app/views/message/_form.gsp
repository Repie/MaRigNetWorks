<%@ page import="marignetworks.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'auteur', 'error')} required">
	<label for="auteur">
		<g:message code="message.auteur.label" default="Auteur" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="auteur" name="auteur.id" from="${marignetworks.Membre.list()}" optionKey="id" required="" value="${messageInstance?.auteur?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'texte', 'error')} ">
	<label for="texte">
		<g:message code="message.texte.label" default="Texte" />
		
	</label>
	<g:textField name="texte" value="${messageInstance?.texte}"/>
</div>

