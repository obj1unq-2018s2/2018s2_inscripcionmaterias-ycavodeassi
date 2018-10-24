import estudiantes.*
import carreras.*

class Materia {
	const carrera
	var cupo //num
	var listaEspera = #{} //conjunto de alumnos sin cupo en espera
	var estudiantesInscriptos = #{} //conjunto de estudiantes inscriptos a la materia.
	
	
	method estaInscripto(unEstudiante) = estudiantesInscriptos.contains(unEstudiante)
	
	method puedeCursar(unEstudiante) = not self.estaInscripto(unEstudiante) && 
											not unEstudiante.materiaAprobada(self) &&														
												carrera.materiaDeLaCarrera(self) &&
													unEstudiante.cursaCarrera(carrera)
													
	method hayCupo() = estudiantesInscriptos.size() < cupo
	
	method inscribirAMateria(unEstudiante) = estudiantesInscriptos.add(unEstudiante)
	
	method inscribirAListaEspera(unEstudiante) = listaEspera.add(unEstudiante)

	method inscribirEstudianteSi(unEstudiante) {
		if (self.puedeCursar(unEstudiante) && self.hayCupo()) {
			self.inscribirAMateria(unEstudiante)
		}
		else {
			self.inscribirAListaEspera(unEstudiante)
		}
	}
		
	
/*	
	3. Inscribir un alumno a un curso, verificando las condiciones de inscripción de la materia. Además, cada materia tiene un “cupo”, es decir,
	 una cantidad máxima de estudiante que se pueden inscribir. Para manejar el exceso en los cupos, las materias tienen una lista de espera, 
	 de estudiantes que quisieran cursar pero no tienen lugar 
(ver punto 5). 
*/										
}

class MateriaAprobada {
	const nota
	const materia
	
}

class MateriaConCorrelativas inherits Materia {
	var materiasCorrelativas = #{} //conjunto de materias correlativas aprobadas como prerequisito
	
	override method puedeCursar(unEstudiante) = super(unEstudiante) && self.correlativasAprobadas(unEstudiante)
	
	method correlativasAprobadas(unEstudiante) = materiasCorrelativas.forEach{ materia => unEstudiante.materiaAprobada(materia) }
	
}

class MateriaConCreditos inherits Materia {
	var cantCreditos //num
	
	override method puedeCursar(unEstudiante) = super() && //cant creditos
	
	
}

class MateriaConAnios inherits Materia {
	
	override method puedeCursar(unEstudiante) = super() && //anio
}


/*
 
 Además cada materia tiene sus propios prerrequisitos, que pueden tener diferentes formas y se detallan a continuación.
 
   Los prerrequisitos de una materia pueden ser:
   * Un conjunto de materias correlativas: por ejemplo para cursar Objetos 2 es necesario haber aprobado Objetos 1 y Matemática.
   
   * Una cantidad de créditos: por ejemplo para hacer el Trabajo Final se necesita acumular 250 créditos previamente. 
   (Cada materia  otorga una cantidad de créditos determinada, que se acumulan al aprobarla.)
   
   * Por año, es decir, haber aprobado todas las materias del año anterior. Por ejemplo, para cursar Objetos 3, 
   que es una materia de tercer año, es necesario haber aprobado todas las materias del segundo año. De cada materia se conoce a qué año pertence.
   
   * Nada: Hay materias que no tienen ningún requerimiento, por ejemplo Elementos de Programación, no tiene ninguna condición especial. 
   
*/