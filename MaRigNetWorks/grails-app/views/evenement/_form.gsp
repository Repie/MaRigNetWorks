<%@ page import="marignetworks.Evenement" %>



<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'dateDebut', 'error')} required">
	<label for="dateDebut">
		<g:message code="evenement.dateDebut.label" default="Date Debut" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateDebut" precision="day"  value="${evenementInstance?.dateDebut}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'dateFin', 'error')} required">
	<label for="dateFin">
		<g:message code="evenement.dateFin.label" default="Date Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateFin" precision="day"  value="${evenementInstance?.dateFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="evenement.messages.label" default="Messages" />
		
	</label>
	<g:select name="messages" from="${marignetworks.Message.list()}" multiple="multiple" optionKey="id" size="5" value="${evenementInstance?.messages*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'organisateur', 'error')} required">
	<label for="organisateur">
		<g:message code="evenement.organisateur.label" default="Organisateur" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisateur" name="organisateur.id" from="${marignetworks.Membre.list()}" optionKey="id" required="" value="${evenementInstance?.organisateur?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'participants', 'error')} ">
	<label for="participants">
		<g:message code="evenement.participants.label" default="Participants" />
		
	</label>
	<g:select name="participants" from="${marignetworks.Membre.list()}" multiple="multiple" optionKey="id" size="5" value="${evenementInstance?.participants*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evenementInstance, field: 'titre', 'error')} ">
	<label for="titre">
		<g:message code="evenement.titre.label" default="Titre" />
		
	</label>
	<g:textField name="titre" value="${evenementInstance?.titre}"/>
</div>

