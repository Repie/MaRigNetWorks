
<%@ page import="marignetworks.Membre" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'membre.label', default: 'Membre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-membre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-membre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list membre">
			
				<g:if test="${membreInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="membre.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${membreInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="membre.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${membreInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.adrElec}">
				<li class="fieldcontain">
					<span id="adrElec-label" class="property-label"><g:message code="membre.adrElec.label" default="Adr Elec" /></span>
					
						<span class="property-value" aria-labelledby="adrElec-label"><g:fieldValue bean="${membreInstance}" field="adrElec"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.ddn}">
				<li class="fieldcontain">
					<span id="ddn-label" class="property-label"><g:message code="membre.ddn.label" default="Ddn" /></span>
					
						<span class="property-value" aria-labelledby="ddn-label"><g:formatDate date="${membreInstance?.ddn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.sexe}">
				<li class="fieldcontain">
					<span id="sexe-label" class="property-label"><g:message code="membre.sexe.label" default="Sexe" /></span>
					
						<span class="property-value" aria-labelledby="sexe-label"><g:fieldValue bean="${membreInstance}" field="sexe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.passions}">
				<li class="fieldcontain">
					<span id="passions-label" class="property-label"><g:message code="membre.passions.label" default="Passions" /></span>
					
						<g:each in="${membreInstance.passions}" var="p">
						<span class="property-value" aria-labelledby="passions-label"><g:link controller="activite" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.amis}">
				<li class="fieldcontain">
					<span id="amis-label" class="property-label"><g:message code="membre.amis.label" default="Amis" /></span>
					
						<g:each in="${membreInstance.amis}" var="a">
						<span class="property-value" aria-labelledby="amis-label"><g:link controller="membre" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${membreInstance?.discussions}">
				<li class="fieldcontain">
					<span id="discussions-label" class="property-label"><g:message code="membre.discussions.label" default="Discussions" /></span>
					
						<g:each in="${membreInstance.discussions}" var="d">
						<span class="property-value" aria-labelledby="discussions-label"><g:link controller="discussion" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${membreInstance?.id}" />
					<g:link class="edit" action="edit" id="${membreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
