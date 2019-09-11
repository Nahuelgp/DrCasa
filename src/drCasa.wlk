class Persona{
	var enfermedades = #{}
	var temperatura = 36.5
	var celulas
	
	method contraerEnfermedad(unaEnfermedad){
		enfermedades.add(unaEnfermedad)
	}
	
	method tieneEnfermedad(unaEnfermedad){
		return enfermedades.contains(unaEnfermedad)
	}
	
	method vivirUnDia(){
		enfermedades.forEach{ enfermedad => enfermedad.aplicarEfecto(self)
			
		}
	}
	
	method aumentarTemperatura(unosGrados){
		temperatura = 45.min(temperatura + unosGrados) 
	}
	
	method destruirCelulas(unasCelulas){
		celulas -= unasCelulas
	}
	
	method cantidadCelulasAmenazadasPorEnfermedadesAgresivas(){
		return self.enfermedadesAgresivas().sum{ enfermedad => enfermedad.cantCelAmenazadas()}
	}
	
	method enfermedadesAgresivas(){
		return enfermedades.filter{ enfermedad => enfermedad.esAgresiva(celulas)}
	}
}

class EnfermedadInfecciosa{
	var property cantCelAmenazadas
	
	method reproducirse(){
		cantCelAmenazadas *= 2
	}
	 
	method aplicarEfecto(unaPersona){
		unaPersona.aumentarTemperatura(cantCelAmenazadas / 1000)
	}
	
	method esAgresiva(cantCelPersona){
		return cantCelAmenazadas > cantCelPersona * 0.1
	}
	
}

class EnfermedadAutoinmune{
	var property cantCelAmenazadas
	var diasQueAfecto = 0
	
	method aplicarEfecto(unaPersona){
	 	unaPersona.destruirCelulas(cantCelAmenazadas)
	 	diasQueAfecto ++
	 }
	 
	 method esAgresiva(cantCelPersona){
		return diasQueAfecto > 30
	}
}