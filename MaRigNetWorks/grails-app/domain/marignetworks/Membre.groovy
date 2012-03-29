package marignetworks

class Membre {

	String nom, prenom, adrElec, sexe
	Date ddn
	static hasMany=[amis : Membre, passions : Activite, discussions : Discussion]
	
    static constraints = {
		nom blank: false
		prenom blank: false
		adrElec blank: false, email: true
		ddn nullable: true, blank: false, max: new Date().minus(4745)
		sexe nullable: true, blank: false, inList: ['M','F']
		passions nullable: true, blank: false
    }
	
	String toString() {
		return "nom : "+nom+" Prenom : "+prenom+"."
	}
}
