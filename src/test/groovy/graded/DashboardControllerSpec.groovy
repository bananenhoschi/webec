package graded

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class DashboardControllerSpec extends Specification implements ControllerUnitTest<DashboardController> {

    Semester semester

    def setup() {
        semester = new Semester(semesterTyp: SemesterTyp.HS, jahr: 19)
    }

    def cleanup() {
    }

    def 'Test the index action returns the correct model'() {
        given:

        List<Modul> sampleModule = [new Modul(kuerzel: 'modul1', credits: 2, semester: semester),
                                    new Modul(kuerzel: 'modul2', credits: 3, semester: semester),
                                    new Modul(kuerzel: 'modul3', credits: 4, semester: semester),]
        controller.semesterService = Stub(SemesterService) {
            findByJahrAndSemesterTyp(_, _) >> semester
        }
        controller.modulService = Stub(ModulService) {
            list() >> sampleModule
            count() >> sampleModule.size()
        }

        when: 'The index action is executed'
        controller.index()

        then: 'The model is correct'
        model.module
        model.module.size() == sampleModule.size()
        model.module.find { it.kuerzel == 'modul1' && it.credits == 2 }
        model.module.find { it.kuerzel == 'modul2' && it.credits == 3 }
        model.module.find { it.kuerzel == 'modul3' && it.credits == 4 }
        model.ectsBestanden == 0
        model.ectsNichtBestanden == 0
        model.ectsAktuell == 9
        model.avg == 0
        model.avgGewichtet == 0
        model.max == 180
    }


}
