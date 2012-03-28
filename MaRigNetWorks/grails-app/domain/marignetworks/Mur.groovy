package marignetworks

class Mur {
	
	Membre proprietaire
	static hasMany = [messages : Message]
	static belongsTo = Membre

    static constraints = {
    }
}
