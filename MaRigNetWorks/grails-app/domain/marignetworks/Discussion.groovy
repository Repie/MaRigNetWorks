package marignetworks

//import java.util.UUID

class Discussion {
	
	static hasMany = [participants : Membre, messages : Message]
	static belongsTo = Membre

    static constraints = {
		participants blank: false
    }
}
