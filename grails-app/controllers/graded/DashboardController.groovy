package graded

class DashboardController {

    final static int MAX_ECTS = 180

    ModulService modulService

    def index() {


        List<Modul> module = modulService.list()

        List<Modul> bestanden = module.findAll {
            it.isPassed()
        }
        List<Modul> nichtBestanden = module.findAll { !it.isPassed() }
        List<Modul> aktuell = module.findAll { !it.isCompleted() }

        respond view: 'index', model: [bestanden: bestanden, nichtBestanden: nichtBestanden, aktuell: aktuell, max: MAX_ECTS]

}

}
