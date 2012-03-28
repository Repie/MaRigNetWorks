package marignetworks

class Evenement {
	
	String titre
	Membre organisateur
	static hasMany = [participants : Membre, messages : Message]
	Date dateDebut, dateFin
	static belongsTo = Membre

    static constraints = {
    }
}
