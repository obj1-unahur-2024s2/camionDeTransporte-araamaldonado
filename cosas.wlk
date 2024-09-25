
object knightRider {
    method peso () = 500
    method nivelPeligrosidad () = 10
    method bulto() = 1
    method consecuencia() {} 
}

object bumblebee {
    var estaTransformado = false

    method transformar() {
        estaTransformado = not estaTransformado
    }

    method peso () = 800
    
    method nivelPeligrosidad () {
        if (estaTransformado) {
            return 30
        }
        else {
            return 15
        }
    }

    method bulto() = 2

    method consecuencia() {
        estaTransformado = true
    }
}

object paqueteDeLadrillos {
    var property ladrillos = 1

    method peso () = ladrillos * 2

    method nivelPeligrosidad () = 2

    method bulto() = if (ladrillos <= 100) {1} else if (ladrillos.between(101, 300)) {2} else {3}

    method consecuencia() {
        ladrillos += 12
    }
}

object arenaAGranel {
    var property peso = 1
    method bulto() = 1
    method nivelPeligrosidad () = 1
    method consecuencia() {
        peso = 10
    }
}

object bateriaAntiAerea {
    var estaConMisiles = false

    method cambiarEstaConMisiles () {
        estaConMisiles = true
    }

    method peso () {
        if (estaConMisiles) {
            return 300
        }
        else {
            return 200
        }
    }

    method nivelPeligrosidad () {
        if (estaConMisiles) {
            return 100
        }
        else {
            return 0
        }
    }

    method bulto() = if (estaConMisiles) {2} else {1}

    method consecuencia() {
        estaConMisiles = true
    }
}

object contenedorPortuario {
    const cosas = []

    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }

    method sacarA(algo) {
        cosas.remove(algo)
    }

    method peso () = 100 + cosas.map({c => c.peso()}).sum()

    method nivelPeligrosidad () {
        if (cosas.isEmpty()) {
            return 0
        }
        else {
            cosas.map({c => c.nivelPeligrosidad()}).max()
        }
    }

    method bulto() = 1 + cosas.map( {c => c.bulto()} ).sum()

    method consecuencia() {
        cosas.forEach( {c => c.consecuencia()} )
    }
}

object residuosRadioactivos {
    var property peso = 100
    method nivelPeligrosidad () = 200
    method bulto() = 1
    method consecuencia() {
        peso += 15
    }
}

object embalajeDeSeguridad {
    var property envuelveA = cosaNulleable

    method peso () = envuelveA.peso()

    method nivelPeligrosidad () = envuelveA.nivelPeligrosidad() * 0.50

    method bulto() = 2

    method consecuencia() {}
}

object cosaNulleable {
    method peso() = 0
    method nivelPeligrosidad() = 0 
}