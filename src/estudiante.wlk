import materia.*
import carrera.*

class Estudiante {
	const carrerasCursando  = #{} 	//conjunto de carreras que el alumno esta cursando.
	const materiasInscripto = #{} 	//conjunto de materias que el alumno esta inscripto.
	const materiasAprobadas = #{}	//conjunto de materias que el alumno aprobo.
	var	  notas				= []    //lista de notas
	var	  cantidadCreditos			//num
	
	method materiasInscripto() 				   = materiasInscripto
	
	method estaInscripto(unaMateria) 	   	   = materiasInscripto.contains(unaMateria)
	
	method registrarMateria(unaMateria)		   = materiasInscripto.add(unaMateria)
	
	method bajaMateria(unaMateria)		   	   = materiasInscripto.remove(unaMateria)
	
	method materiaAprobada(unaMateria) 	   	   = materiasAprobadas.contains(unaMateria)
	
	method regMateriaAprobada(unaMateria)  		{ if(not self.materiaAprobada(unaMateria))
													materiasAprobadas.add(unaMateria) &&
											 			notas.add(unaMateria.nota())
											 	  	cantidadCreditos += unaMateria.creditos()
												 }
	method promedio()						   = notas.sum() / notas.size()
	
	method materiasAprobadas()			   	   = materiasAprobadas
	
	method materiasAprobadasHastaAnio(unAnio)  = materiasAprobadas.filter{ materia => materia.anio() < unAnio }
	
	method cantidadCreditos()			   	   = cantidadCreditos
	
	method estaCursandoCarrera(unaCarrera)     = carrerasCursando.contains(unaCarrera)
	
	method tieneCreditos(unCredito)		       = unCredito == cantidadCreditos
	
	method enListaDeEspera()				   = carrerasCursando.forEach().materias().filter{ materia => materia.estaEnEspera(self) }
	
	method materiasPuedeInscribir(unaCarrera)  = if(self.estaCursandoCarrera(unaCarrera)) 
													unaCarrera.materias()
												 else 
												 	self.error("No esta cursando esa Carrera")
}
