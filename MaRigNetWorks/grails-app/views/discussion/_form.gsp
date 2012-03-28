<%@ page import="marignetworks.Discussion" %>



<div class="fieldcontain ${hasErrors(bean: discussionInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="discussion.messages.label" default="Messages" />
		
	</label>
	<g:select name="messages" from="${marignetworks.Message.list()}" multiple="multiple" optionKey="id" size="5" value="${discussionInstance?.messages*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: discussionInstance, field: 'participants', 'error')} ">
	<label for="participants">
		<g:message code="discussion.participants.label" default="Participants" />
		
	</label>
	
</div>

