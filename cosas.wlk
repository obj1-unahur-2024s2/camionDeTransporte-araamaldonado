
object knightRider {
    method peso () = 500
    method nivelPeligrosidad () = 10

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
}

object paqueteDeLadrillos {
    var property ladrillos = 1

    method peso () = ladrillos * 2

    method nivelPeligrosidad () = 2
}

object arenaAGranel {
    var property peso = 1

    method nivelPeligrosidad () = 1
}

object bateriaAntiAerea {
    var estaConMisiles = false

    method estaConMisiles () {
        estaConMisiles = not estaConMisiles
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

    method nivelPeligrosidad () {´
        if (cosas.isEmpty()) {
            return 0
        }
        else {
            cosas.map({c => c.nivelPeligrosidad()}).max()
        }
    }
}

object residuosRadioactivos {
    var property peso = 100
    method nivelPeligrosidad () = 200
}

object embalajeDeSeguridad {
    var property envuelveA = knightRider

    method peso () = envuelveA.peso()

    method nivelPeligrosidad () = envuelveA.nivelPeligrosidad() * 0.50
}