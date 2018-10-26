import materia.*

class Carrera {
	const materias	= #{}
	
	method materias() = materias
	
	method agregarMateria(unaMateria) = materias.add(unaMateria)
	
	method materiasHastaAnio(unAnio)  = materias.filter{ materia => materia.anio() < unAnio }
	
	method materiasEnEspera(unEstudiante) = materias.filter{ materia => materia.estaEnEspera(unEstudiante) }
	
}
