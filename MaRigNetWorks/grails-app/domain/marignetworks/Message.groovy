package marignetworks

//import java.util.UUID

class Message {
	
	String texte
	Membre auteur
	static belongsTo = Discussion

    static constraints = {
		texte blank: false
		auteur blank: false
    }
}
