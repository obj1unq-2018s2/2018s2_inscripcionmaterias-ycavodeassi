import carreras.*

class Estudiante {
	var materiasAprobadas = #{} //conjunto de materias aprobadas por el estudiante.
	

	method materiaAprobada(unaMateria) = materiasAprobadas.contains(unaMateria)

	method cursaCarrera(unaCarrera) = unaCarrera.alumnoInscripto(self)
} 

