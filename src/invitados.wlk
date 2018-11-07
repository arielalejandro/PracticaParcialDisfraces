class Invitado{
	const edad
	var disfraz 
	const personalidad
	
	constructor(anios,unDisfraz, unaPersonalidad){
		edad = anios
		disfraz = unDisfraz
		personalidad = unaPersonalidad
	}
	method edad() = edad
	
	method esSexy(){
		return personalidad.esSexy(self)
	}
	method cambiarPersonalidad(){
		personalidad.cambiar()
	}
	method estaConforme(){
		return self.condicionConformidad(disfraz)
	}
	method condicionConformidad(unDisfraz){
		return unDisfraz.puntos() > 10
	}
	method disfraz() = disfraz
	
	method tieneDisfraz(){ return disfraz /= null}
}

object alegre{
	method esSexy(alguien) = false
}

object taciturna{
	method esSexy(alguien) = alguien.edad() < 30
}

object cambiante{
	var tipo
	method tipo() = tipo
	method cambiar(){
		if(tipo == alegre){tipo = taciturna}
		else{tipo = alegre}
	}
	method esSexy(alguien) = tipo.esSexy(alguien)
}

class Caprichoso inherits Invitado{
	constructor(anios,unDisfraz, unaPersonalidad) = super(anios,unDisfraz, unaPersonalidad)
	override method condicionConformidad(traje){
		return traje.nombre().even() && self.estaConforme() 
	}
}
class Pretencioso inherits Invitado{
	const hoy = new Date()
	constructor(anios,unDisfraz, unaPersonalidad) = super(anios,unDisfraz, unaPersonalidad)
	override method condicionConformidad(traje){
		return hoy - traje.fechaCreacion() < 30
	}
}

class Numerologo inherits Invitado{
	var cifraRequerida
	constructor(anios,unDisfraz, unaPersonalidad,cifra) = super(anios,unDisfraz, unaPersonalidad)
	{
		cifraRequerida = cifra
	}
	override method condicionConformidad(traje){
		return traje.puntaje() == cifraRequerida && self.estaConforme()
	}
}

