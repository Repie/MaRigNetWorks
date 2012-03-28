
<%@ page import="marignetworks.Evenement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evenement.label', default: 'Evenement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evenement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evenement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evenement">
			
				<g:if test="${evenementInstance?.dateDebut}">
				<li class="fieldcontain">
					<span id="dateDebut-label" class="property-label"><g:message code="evenement.dateDebut.label" default="Date Debut" /></span>
					
						<span class="property-value" aria-labelledby="dateDebut-label"><g:formatDate date="${evenementInstance?.dateDebut}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${evenementInstance?.dateFin}">
				<li class="fieldcontain">
					<span id="dateFin-label" class="property-label"><g:message code="evenement.dateFin.label" default="Date Fin" /></span>
					
						<span class="property-value" aria-labelledby="dateFin-label"><g:formatDate date="${evenementInstance?.dateFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${evenementInstance?.messages}">
				<li class="fieldcontain">
					<span id="messages-label" class="property-label"><g:message code="evenement.messages.label" default="Messages" /></span>
					
						<g:each in="${evenementInstance.messages}" var="m">
						<span class="property-value" aria-labelledby="messages-label"><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${evenementInstance?.organisateur}">
				<li class="fieldcontain">
					<span id="organisateur-label" class="property-label"><g:message code="evenement.organisateur.label" default="Organisateur" /></span>
					
						<span class="property-value" aria-labelledby="organisateur-label"><g:link controller="membre" action="show" id="${evenementInstance?.organisateur?.id}">${evenementInstance?.organisateur?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${evenementInstance?.participants}">
				<li class="fieldcontain">
					<span id="participants-label" class="property-label"><g:message code="evenement.participants.label" default="Participants" /></span>
					
						<g:each in="${evenementInstance.participants}" var="p">
						<span class="property-value" aria-labelledby="participants-label"><g:link controller="membre" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${evenementInstance?.titre}">
				<li class="fieldcontain">
					<span id="titre-label" class="property-label"><g:message code="evenement.titre.label" default="Titre" /></span>
					
						<span class="property-value" aria-labelledby="titre-label"><g:fieldValue bean="${evenementInstance}" field="titre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${evenementInstance?.id}" />
					<g:link class="edit" action="edit" id="${evenementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
