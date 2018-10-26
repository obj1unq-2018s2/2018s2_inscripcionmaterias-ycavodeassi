import materia.*

class Carrera {
	const materias	= #{}
	
	method materias() = materias
	
	method materiasHastaAnio(unAnio) = materias.filter{ materia => materia.anio() < unAnio }
}
