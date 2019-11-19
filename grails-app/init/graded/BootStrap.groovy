package graded

import groovy.transform.CompileStatic

@CompileStatic
class BootStrap {

    ModulService modulService

    def init = { servletContext ->


        Modul algd1 = modulService.save('algd1', 3)
        Modul webeC = modulService.save('webeC', 3)
        Modul sepC = modulService.save('sepC', 3)
        Modul webcl = modulService.save('webcl', 3)
        Modul webfr = modulService.save('webfr', 3)
        Modul webpr = modulService.save('webfr', 3)
        Modul apsi = modulService.save('apsi', 3)
        Modul egi = modulService.save('egi', 2)

    }

    def destroy = {
    }
}
