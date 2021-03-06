
<%@ page import="marignetworks.Membre" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'membre.label', default: 'Membre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-membre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-membre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'membre.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prenom" title="${message(code: 'membre.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="adrElec" title="${message(code: 'membre.adrElec.label', default: 'Adr Elec')}" />
					
						<g:sortableColumn property="ddn" title="${message(code: 'membre.ddn.label', default: 'Ddn')}" />
					
						<g:sortableColumn property="sexe" title="${message(code: 'membre.sexe.label', default: 'Sexe')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${membreInstanceList}" status="i" var="membreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${membreInstance.id}">${fieldValue(bean: membreInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: membreInstance, field: "prenom")}</td>
					
						<td>${fieldValue(bean: membreInstance, field: "adrElec")}</td>
					
						<td><g:formatDate date="${membreInstance.ddn}" /></td>
					
						<td>${fieldValue(bean: membreInstance, field: "sexe")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${membreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
