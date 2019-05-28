class NaveEspacial {
	var property velocidad = 0
	var direccion = 0	
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad = (velocidad - cuanto).max(0) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = (direccion + 1).min(10) }
	method alejarseUnPocoDelSol() { direccion =(direccion - 1).max(-10) }
	
}

class NaveBaliza inherits NaveEspacial {
	var color 
	
	method cambiarColorDeBaliza(colorNuevo){
		color = colorNuevo
	}
	
	method prepararViaje() {
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
	
}

class NaveDePasajeros inherits NaveEspacial {
	var property pasajeros
	var property comida
	var property bebida
	
	method cargarComida(racion){
		comida = comida + racion
	}
	
	method descargarComida(racion){
		comida = comida - racion
	}
	
	method cargarBebida(racion){
		bebida = bebida + racion
	}
	
	method descargarBebida(racion){
		bebida = bebida - racion
	}
	
	method prepararViaje() {
		self.cargarComida(4)
		self.cargarBebida(6)
		self.acercarseUnPocoAlSol()
	}
}

class NaveDeCombate inherits NaveEspacial {
	var property visibilidad = true
	var property misiles = true
	var mensajes = []
	
	method ponerseVisible() {
		visibilidad = true
	}	
	
	method ponerseInvisible() {
		visibilidad = false
	}
	
	method estaInvisible() {
		return not visibilidad
	}
	
	method desplegarMisiles() {
		misiles = true
	}
	
	method replegarMisiles() {
		misiles = false
	}
	
	method misilesDesplegados() {
		return misiles
	}
	
	method emitirMensaje(mensaje) {
		mensajes.add(mensaje)
	}
	
	method mensajesEmitidos(){
		return mensajes
	}
	
	method primerMensajeEmitido(){
		return mensajes.first()
	}
	
	method ultimoMensajeEmitido() {
		return mensajes.last()
	}
	
	method esEscueta() {
		
	}
	
	method emitioMensaje(mensaje) {
		return mensajes.contains(mensaje)
	}
	
	method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
}



