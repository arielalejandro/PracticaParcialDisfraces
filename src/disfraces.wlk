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
	method duenio() = duenio
	method duenio(unDuenio){
		duenio = unDuenio
	}
	
	method puntaje(fechaFiesta){
		return caracteristicas.sum({unaCaracteristica => unaCaracteristica.puntosPara(self,fechaFiesta)})
	}
}

class Gracioso{
	var gracia
	constructor(cantGracia){
		gracia = (cantGracia.max(1)).min(10)
	}
	method puntosPara(disfraz,fechaFiesta) {
		if(disfraz.duenio().edad()>50) {return  gracia * 3}
		else {return gracia} 
	} 
}
class Tobara{
	var fechaCompra
	constructor(unaFecha){
		fechaCompra = unaFecha
	}
	method puntosPara(disfraz,fechaFiesta) {
		if(fechaFiesta - fechaCompra > 2) {return 5}
		else {return 3} 
	} 
}

class Careta{
	var personaje
	constructor(unPersonaje){
		personaje = unPersonaje
	}
	method puntosPara(disfraz,fechaFiesta) {
		return personaje.valor()
	} 
}

object sexy{
	method puntosPara(disfraz,fechaFiesta){
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
	method esSexy() = false
	method edad() = 0
}