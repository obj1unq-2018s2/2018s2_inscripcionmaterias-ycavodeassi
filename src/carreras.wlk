
class Carrera {
	var materias = #{} //conjunto de materias de la carrera
	var estudiantesInscriptos = #{} //conjunto de estudiantes inscripto a la carrera
	
	//metodos de asignacion
	method inscribirEstudiante(unEstudiante) { estudiantesInscriptos.add(unEstudiante) }
	method asignarMateria(unaMateria) { materias.add(unaMateria) }
	
	//metodos de busqueda
	method alumnoInscripto(unEstudiante)  = estudiantesInscriptos.contains(unEstudiante) 
	method materiaDeLaCarrera(unaMateria) = materias.contains(unaMateria) 
	
}

