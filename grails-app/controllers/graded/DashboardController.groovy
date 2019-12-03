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

        int ectsBestanden = bestanden.sum { it.credits }
        int ectsNichtBestanden = nichtBestanden.sum { it.credits }
        int ectsAktuell = aktuell.sum { it.credits }

        respond module, view: 'index', model: [ectsBestanden: ectsBestanden, ectsNichtBestanden: ectsNichtBestanden, ectsAktuell: ectsAktuell, aktuell: aktuell, max: MAX_ECTS]

    }

}
