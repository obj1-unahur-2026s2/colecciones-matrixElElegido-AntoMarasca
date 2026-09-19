object neo {
    var energia = 100

    method esElElegido() = true

    method saltar() {
        energia = energia / 2
    }
    
    method vitalidad() = energia / 10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method saltar() {
        estaCansado = !estaCansado
        vitalidad = (vitalidad - 1).max(0)
    }

    method esElElegido() = false

    method vitalidad() = vitalidad
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}

object nave {
    const pasajeros = []

    method subirPasajero(unPasajero) {
        pasajeros.add(unPasajero)
    }
    method bajarPasajero(unPasajero) {
        pasajeros.remove(unPasajero)
    }
    method cantidadDePasajeros() {
        return pasajeros.size()
    }


    //neo
    method elPasajeroConMasVitalidad() {
        return pasajeros.max({unPasajero => unPasajero.vitalidad()})
    }
    //10
    method laMayorVitalidad() {
        return self.elPasajeroConMasVitalidad().vitalidad()
    }

    method estaEquilibrada() {
        //max <= min * 2
        return self.elPasajeroConMasVitalidad().vitalidad() <= min * 2
    }

    method estaElElegido() {
        return pasajeros.any({unPasajero => unPasajero.esElElegido()})
    }

    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar() {
        //paso de tener a neo, trinity y morfeo, voy a terminar teniendo a trinity y morfeo
        pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
    }
}