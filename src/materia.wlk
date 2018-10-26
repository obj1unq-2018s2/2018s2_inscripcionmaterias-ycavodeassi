import estudiante.*
import carrera.*

class Materia {
	const carrera			//Carrera a la que pertenece la materia.
	const anio				//num
	const cupo				//num
	const alumnosInsc = #{} //conjunto de alumnos inscriptos a la materia
	const listaEspera = []  //lista que contiene alumnos sin cupo
	
	method carrera()	= carrera
	
	method anio()		= anio
	
	method cupo() 		= cupo
	
	method nCursantes() = alumnosInsc.size()
	
	method cursantes()  = alumnosInsc
	
	method puedeCursar(unEstudiante) 	 =	not unEstudiante.estaInscripto(self) &&
										  		not unEstudiante.materiaAprobada(self) &&
													unEstudiante.estaCursandoCarrera(self.carrera())
	
	method registrarAlumnoSi(unEstudiante)  { 	
												if(self.hayCupo()&&self.puedeCursar(unEstudiante))
													self.registrarAlumno(unEstudiante)		 
											 	else
											 		self.regAlumEsperaSi(unEstudiante)
										    }
										    
	method registrarAlumno(unEstudiante)    { 	self.cursantes().add(unEstudiante); unEstudiante.registrarMateria(self)}			
											
	method regAlumEsperaSi(unEstudiante)    {
												if(self.puedeCursar(unEstudiante))
													self.regAlumEspera(unEstudiante)
											}
											
	method regAlumEspera(unEstudiante)      { 	listaEspera.add(unEstudiante).withoutDuplicates()	}
	
	method bajaAlumnoSi(unEstudiante) 		{
												if(unEstudiante.estaInscripto(self))
													self.bajaAlumno(unEstudiante)
												else if(self.hayAlumEnEspera())
													self.registrarAlumno(listaEspera.first())
													listaEspera.remove(listaEspera.first())
											}
	method bajaAlumno(unEstudiante) 		{
												self.cursantes().remove(unEstudiante)
												unEstudiante.bajaMateria(self)
											}
	
	method hayAlumEnEspera()			 = not self.cursantes().isEmpty()
	
	method estaEnEspera(unEstudiante)	 = listaEspera.contains(unEstudiante)
	
	method hayCupo()					 = self.cupo()<self.cursantes()														
}

class MateriaCorrelativa inherits Materia {
	const materiasNecesarias	= #{} //conjunto de materias necesarias para la correlatividad.
	
	override method puedeCursar(unEstudiante)	= super(unEstudiante) && self.aproboCorrelativas(unEstudiante)
	
	method aproboCorrelativas(unEstudiante)		= unEstudiante.materiasAprobadas().intersection(materiasNecesarias)==materiasNecesarias
}

class MateriaConCredito inherits Materia {
	const creditosNecesarios	//num
	
	override method puedeCursar(unEstudiante)	= super(unEstudiante) && unEstudiante.tieneCreditos(creditosNecesarios)
}

class MateriaPorAnio inherits Materia {
	
	override method puedeCursar(unEstudiante)	 = super(unEstudiante) && self.aproboMateriasHastaAnio(unEstudiante)
	
	method aproboMateriasHastaAnio(unEstudiante) = unEstudiante. materiasAprobadasHastaAnio(self.anio()) ==
														self.carrera().materiasHastaAnio(self.anio())
}

class MateriaAprobada {
	const materia
	const alumno
	const nota
	const creditosOtorga
	
	method materia()	= materia
	
	method nota()		= nota
	
	method creditos()	= creditosOtorga
}