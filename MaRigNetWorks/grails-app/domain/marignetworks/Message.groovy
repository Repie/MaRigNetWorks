package marignetworks

import java.util.UUID

class Message {
	
	UUID id
	String texte
	Membre auteur
	static belongsTo = Discussion

    static constraints = {
    }
}
