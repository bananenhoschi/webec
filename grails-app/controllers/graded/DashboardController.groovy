package graded

class DashboardController {

    final static int MAX_ECTS = 180 // TODO into property

    ModulService modulService
    SemesterService semesterService

    def index() {

        List<Modul> module = modulService.list()

        // Filtere alle Module die bestanden sind
        List<Modul> bestanden = module.findAll {
            it.isPassed()
        }

        // Filtere alle Module die nicht bestanden sind
        List<Modul> nichtBestanden = module.findAll {
            !it.isPassed() && it.isCompleted()
        }

        // Filtere alle Module die aktuell besucht werden und noch nicht bestanden sind
        List<Modul> aktuell = module.findAll {
            !it.isCompleted()
        }

        // Zähle die Anzahl Credits
        int ectsBestanden = bestanden.sum { it.credits } as int
        int ectsNichtBestanden = nichtBestanden.sum { it.credits } as int
        int ectsAktuell = aktuell.sum { it.credits } as int

        Semester aktuellesSemester = aktuellesSemester()
        module.removeIf {
            !it.semester.equals(aktuellesSemester)
        }

        render view: 'index', model: [module: module, ectsBestanden: ectsBestanden, ectsNichtBestanden: ectsNichtBestanden, ectsAktuell: ectsAktuell, aktuell: aktuell, max: MAX_ECTS]

    }


    // TODO Unit Test
    def aktuellesSemester() {
        int[] periodeFS = [2, 3, 4, 5, 6]
        int[] periodeHS = [9, 10, 11, 12, 1]

        def calendar = Calendar.instance
        int currentMonth = calendar.get(Calendar.MONTH) + 1 // Plus 1 weil die Monate bei 0 beginnen
        int currentYear = calendar.get(Calendar.YEAR)

        if (periodeFS.contains(currentMonth))
            return semesterService.findByJahrAndSemesterTyp(currentYear, SemesterTyp.FS)
        else if (periodeHS.contains(currentMonth))
            return semesterService.findByJahrAndSemesterTyp(currentYear, SemesterTyp.HS)
    }

}
