import disfraces.*
import invitados.*

class NoTieneTrajeException inherits Exception{}
class YaEstaCargadoException  inherits Exception{}

class Fiesta{
	var lugar
	var fecha
	var invitados = #{}
	
	constructor(unLugar,unaFecha){
		lugar = unLugar
		fecha = unaFecha
	}
	
	method agregarA(invitado){
		if(!invitado.tieneDisfraz()) {throw new NoTieneTrajeException("El invitado no tiene ningun disfraz")}
		else{
			if(invitados.contains(invitado)){throw new YaEstaCargadoException("El invitado ya esta en la fiesta")}
			else{invitados.add(invitado)}
		}
	}
	method echarA(invitado){
		invitados.remove(invitado)
	}
	
	method esUnBodrio(){
		return invitados.all({invitado => !invitado.estaConforme()})
	}
	
	method mejorDisfraz(){
		return invitados.map({invitado => invitado.disfraz()}).max({disfraz => disfraz.puntaje()})
	}
	
	method puedenCambiarTrajes(unInvitado,otroInvitado){
		return (self.estaAdentro(unInvitado) && self.estaAdentro(unInvitado)) and
		 (!unInvitado.estaConforme() or !otroInvitado.estaConforme()) and 
		 (unInvitado.condicionConformidad(otroInvitado.disfraz()) && unInvitado.condicionConformidad(unInvitado.disfraz()))
	}
	
	method estaAdentro(invitado) = invitados.contains(invitado)
	
	method inolvidable(){
		return invitados.all({unInvitado => unInvitado.estaConforme() && unInvitado.esSexy()})
	}
	
}
