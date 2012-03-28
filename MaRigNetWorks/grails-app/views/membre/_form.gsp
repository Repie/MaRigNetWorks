<%@ page import="marignetworks.Membre" %>



<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="membre.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${membreInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="membre.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${membreInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'adrElec', 'error')} required">
	<label for="adrElec">
		<g:message code="membre.adrElec.label" default="Adr Elec" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="adrElec" required="" value="${membreInstance?.adrElec}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'ddn', 'error')} ">
	<label for="ddn">
		<g:message code="membre.ddn.label" default="Ddn" />
		
	</label>
	<g:datePicker name="ddn" precision="day"  value="${membreInstance?.ddn}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'sexe', 'error')} ">
	<label for="sexe">
		<g:message code="membre.sexe.label" default="Sexe" />
		
	</label>
	<g:select name="sexe" from="${membreInstance.constraints.sexe.inList}" value="${membreInstance?.sexe}" valueMessagePrefix="membre.sexe" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'passions', 'error')} ">
	<label for="passions">
		<g:message code="membre.passions.label" default="Passions" />
		
	</label>
	<g:select name="passions" from="${marignetworks.Activite.list()}" multiple="multiple" optionKey="id" size="5" value="${membreInstance?.passions*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'amis', 'error')} ">
	<label for="amis">
		<g:message code="membre.amis.label" default="Amis" />
		
	</label>
	<g:select name="amis" from="${marignetworks.Membre.list()}" multiple="multiple" optionKey="id" size="5" value="${membreInstance?.amis*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membreInstance, field: 'discussions', 'error')} ">
	<label for="discussions">
		<g:message code="membre.discussions.label" default="Discussions" />
		
	</label>
	<g:select name="discussions" from="${marignetworks.Discussion.list()}" multiple="multiple" optionKey="id" size="5" value="${membreInstance?.discussions*.id}" class="many-to-many"/>
</div>

