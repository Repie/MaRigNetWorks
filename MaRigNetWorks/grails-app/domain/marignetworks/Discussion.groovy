package marignetworks

import java.util.UUID

class Discussion {
	
	UUID id
	static hasMany = [participants : Membre, messages : Message]
	static belongsTo = Membre

    static constraints = {
    }
}
