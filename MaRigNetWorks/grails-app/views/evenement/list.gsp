
<%@ page import="marignetworks.Evenement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evenement.label', default: 'Evenement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-evenement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-evenement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateDebut" title="${message(code: 'evenement.dateDebut.label', default: 'Date Debut')}" />
					
						<g:sortableColumn property="dateFin" title="${message(code: 'evenement.dateFin.label', default: 'Date Fin')}" />
					
						<th><g:message code="evenement.organisateur.label" default="Organisateur" /></th>
					
						<g:sortableColumn property="titre" title="${message(code: 'evenement.titre.label', default: 'Titre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${evenementInstanceList}" status="i" var="evenementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${evenementInstance.id}">${fieldValue(bean: evenementInstance, field: "dateDebut")}</g:link></td>
					
						<td><g:formatDate date="${evenementInstance.dateFin}" /></td>
					
						<td>${fieldValue(bean: evenementInstance, field: "organisateur")}</td>
					
						<td>${fieldValue(bean: evenementInstance, field: "titre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${evenementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
