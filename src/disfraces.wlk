

class Disfraz{
	const nombre
	const fechaCreacion
	var caracteristicas
	var duenio = ninguno

	constructor(unNombre,unaFecha,conjuntoCaracteristicas){
		nombre = unNombre
		fechaCreacion = unaFecha
		caracteristicas = conjuntoCaracteristicas
	}
	
	method nombre() = nombre
	method fechaCreacion() = fechaCreacion
	method duenio(unDuenio){
		duenio = unDuenio
	}
	
	method puntaje(){
		return caracteristicas.sum({unaCaracteristica => unaCaracteristica.puntosPara(self)})
	}
}

class Gracioso{
	var gracia
	constructor(cantGracia){
		gracia = cantGracia
	}
	method puntosPara(disfraz) {
		if(disfraz.duenio().edad()>50) {return  gracia * 3}
		else {return gracia} 
	} 
}
class Tobara{
	var fechaCompra
	const hoy = new Date()
	
	constructor(unaFecha){
		fechaCompra = unaFecha
	}
	method puntosPara(disfraz) {
		if(hoy - fechaCompra > 2) {return 5}
		else {return 3} 
	} 
}

class Careta{
	var personaje
	constructor(unPersonaje){
		personaje = unPersonaje
	}
	method puntosPara(disfraz) {
		return disfraz.personaje().valor()
	} 
}

object sexy{
	method puntosPara(disfraz){
		if(disfraz.duenio().esSexy()){return 15}
		else return 2
	}
}

class Personaje{
	var valor
	constructor(unValor){valor=unValor}
	method valor() = valor
}

object ninguno{
	method esSexy(){
	}
	method edad(){
	}
}