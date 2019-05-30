class NaveEspacial {
	var property velocidad = 0
	var property direccion = 0	
	var property combustible
	
	method cargarCombustible(cantidad) { combustible = combustible + cantidad }
	
	method descargarCombustible(cantidad) { combustible = combustible - cantidad }
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad = (velocidad - cuanto).max(0) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = (direccion + 1).min(10) }
	method alejarseUnPocoDelSol() { direccion =(direccion - 1).max(-10) }
	
	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	method escapar()
	method avisar()
	
	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}
	
	method estaTranquila() { return combustible >= 4000 and velocidad < 12000 }
}

class NaveBaliza inherits NaveEspacial {
	var property color 
	
	method cambiarColorDeBaliza(colorNuevo) { color = colorNuevo }
	
	override method prepararViaje() {
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
		super()
	}
	
	override method escapar() { self.irHaciaElSol() }
	override method avisar() { self.cambiarColorDeBaliza("rojo") }
	
	override method estaTranquila() {
		super()
		return color != "rojo"
	}
}

class NaveDePasajeros inherits NaveEspacial {
	var property pasajeros
	var property comida
	var property bebida
	
	method cargarComida(racion) { comida = comida + racion }
	
	method descargarComida(racion) { comida = comida - racion }
	
	method cargarBebida(racion) { bebida = bebida + racion }
	
	method descargarBebida(racion) { bebida = bebida - racion }
	
	override method prepararViaje() {
		self.cargarComida(4 * pasajeros)
		self.cargarBebida(6 * pasajeros)
		self.acercarseUnPocoAlSol()
		super()
	}
	
	override method escapar() { self.acelerar(velocidad) }
	override method avisar() { self.descargarComida(pasajeros) ; self.descargarBebida(pasajeros*2) }
}

class NaveDeCombate inherits NaveEspacial {
	var property visibilidad = true
	var property misiles = true
	var property mensajes = []
	
	method ponerseVisible() { visibilidad = true }	
	
	method ponerseInvisible() { visibilidad = false }
	
	method estaInvisible() { return not visibilidad	}
	
	method desplegarMisiles() { misiles = true }
	
	method replegarMisiles() { misiles = false }
	
	method misilesDesplegados() { return misiles }
	
	method emitirMensaje(mensaje) { mensajes.add(mensaje) }
	
	method mensajesEmitidos() { return mensajes }
	
	method primerMensajeEmitido() { return mensajes.first() }
	
	method ultimoMensajeEmitido() { return mensajes.last() }
	
	method esEscueta() { return not mensajes.any({ mensaje => mensaje.size() >= 30 }) }
	
	method emitioMensaje(mensaje) { return mensajes.contains(mensaje) }
	
	override method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
		super()
	}
	
	override method escapar() { 
		self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	}
	override method avisar() { self.emitirMensaje("Amenaza recibida") }
	
	override method estaTranquila() {
		super()
		return not misiles
	}
}

class NaveHospital inherits NaveDePasajeros {
	var property quirofanoListo = false
	
	override method recibirAmenaza() {
		super()
		quirofanoListo = true
	}
	
	override method estaTranquila() {
		super()
		return not quirofanoListo
	}
}

class NaveDeCombateSigilosa inherits NaveDeCombate {
	override method escapar() {
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}	
	
	override method estaTranquila() {
		super()
		return visibilidad
	}
}