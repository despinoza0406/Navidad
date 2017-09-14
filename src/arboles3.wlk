
class Arbol {
	var vejez
	var tamanioDeTronco
	var cosas = []
	var cosasConDestinatarios
	var cosasImportantes
	var destinatarios
	var destinatariosOrdenados
	method capacidad(){
		return vejez * tamanioDeTronco
	}
	method capacidadDisponible(){
		return self.capacidad() - cosas.sum({cosa => cosa.lugaresQueOcupa()})
	}
	method agregarElemento(elemento){
		if(self.capacidadDisponible() >= elemento.lugaresQueOcupa())
			cosas.add(elemento)
		else{
			error.throwWithMessage("No hay capacidad")
		}
	}
	method agregarDestinatario(destinatario){
		cosas.forEach({cosaConDest => cosaConDest.nuevoDestinatario(destinatario)})
	}
	method importanciaDelArbol(){
		return cosas.sum({cosa => cosa.importancia()})
	}
	method cantidadDeCosasImportantes(){
		cosasImportantes = cosas.filter({cosa => cosa.importancia() < self.importanciaDelArbol()})
		return cosasImportantes.size()
	}
	method eliminarElementosVoluminosos(){
		cosas = cosas.filter({cosa => cosa.lugaresQueOcupa() <= 5 })
	}
	method todosDestinatarios(){
	
		destinatarios = cosas.map({cosaConDest => cosaConDest.destinatarios()}).flatten()
		destinatariosOrdenados = destinatarios.sortedby({x,y => destinatarios.count({destinatario => destinatario == x})> destinatarios.count({destinatario => destinatario == y})})
		return destinatariosOrdenados.asSet()
	}
	
	

}

class Regalo {
	var destinatarios = []
	method importancia(){
		return destinatarios.size() *2
	}
	method lugaresQueOcupa(){
		return 1
	}
	method nuevoDestinatario(nuevo){
		destinatarios = nuevo
	}
	method destinatarios(){
		return destinatarios
	}
}

class Tarjeta {
	var destinatarios = []
	var importancia
	method importancia(){
		return importancia
	}
	method lugaresQueOcupa(){
		return 0
	}
	method nuevoDestinatario(nuevo){
		destinatarios = nuevo
	}
	method destinatarios(){
		return destinatarios
	}
}

class Adornos {
	var peso
	var coeficienteDeSuperioridad
	method importancia(){
		return peso * coeficienteDeSuperioridad
	}
	method lugaresQueOcupa(){
		if (peso>3) return 3 else return peso
	}
	method nuevoDestinatario(){
		
	}
	method destinatarios(){
		return []
	}
}

class Figuras {
	var adornos = []
	method importancia(){
		return adornos.max({ adorno => adorno.importancia() })
	}
	method lugaresQueOcupa(){
		return (adornos.sum({adorno => adorno.lugaesQueOcupa()})+1)
	}
	method nuevoDestinatario(){
		
	}
	method destinatarios(){
		return []
	}
}

object estrellaDeBelen{
	var destinatarios = ["padre","madre","hijo","hija","perro"]
	method importancia(){
		return 10
	}
	method lugaresQueOcupa(){
		return 1
	}
	method nuevoDestinatario(nuevo){
		destinatarios = nuevo
	}
	method destinatarios(){
		return destinatarios
	}
}

