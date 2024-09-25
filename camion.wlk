import cosas.*

object camion {
    const cosasCargadas = []

    method cosasCargadas() = cosasCargadas

    method peso() = 1000 + cosasCargadas.map( {c => c.peso()} ).sum()

    method pesoDeCosasSonImpar() = cosasCargadas.all( {c => c.peso().odd() } )

    method cargar (unaCosa) {
        cosasCargadas.add(unaCosa)
    }

    method descargar (unaCosa) {
        cosasCargadas.remove(unaCosa)
    }

    method algoPesa(numero) {
        return cosasCargadas.any( {p => p.peso() == numero } )
    }

    method contieneObjetoDePeligrosidad(unNivel) = cosasCargadas.find( {c => c.nivelPeligrosidad() == unNivel} )

    method cosasDePeligrosidad(unNivel) = cosasCargadas.filter( {c => c.nivelPeligrosidad() == unNivel} )

    method cosasMasPeligrosasQue(unaCosa) = cosasCargadas.filter( {c => c.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()} )

    method camionEstaExcedido() = self.peso() > 2500

    method puedeCircularEnRuta(unNivelMaxPel) = !self.camionEstaExcedido() && !cosasCargadas.any( {c => c.nivelPeligrosidad() > unNivelMaxPel} )

    method algoPesaEntre(n1, n2) = cosasCargadas.any( { c => c.peso().between(n1, n2) } )

    method cosaMasPesada() = cosasCargadas.max( {c => c.peso()} )
} 