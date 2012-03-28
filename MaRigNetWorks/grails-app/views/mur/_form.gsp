<%@ page import="marignetworks.Mur" %>



<div class="fieldcontain ${hasErrors(bean: murInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="mur.messages.label" default="Messages" />
		
	</label>
	<g:select name="messages" from="${marignetworks.Message.list()}" multiple="multiple" optionKey="id" size="5" value="${murInstance?.messages*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: murInstance, field: 'proprietaire', 'error')} required">
	<label for="proprietaire">
		<g:message code="mur.proprietaire.label" default="Proprietaire" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proprietaire" name="proprietaire.id" from="${marignetworks.Membre.list()}" optionKey="id" required="" value="${murInstance?.proprietaire?.id}" class="many-to-one"/>
</div>

