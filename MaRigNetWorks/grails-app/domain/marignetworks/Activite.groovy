package marignetworks

class Activite {

    String titre, descriptif
	static hasMany = [participants : Membre]
	static belongsTo = Membre
	
    static constraints = {
		titre blank: false
		descriptif nullable : true, blank : false
    }
	
	String toString() {
		return "Titre : "+titre+" Descriptif : "+descriptif
	}
}
