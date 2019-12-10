package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import org.hibernate.SessionFactory
import spock.lang.Specification

@Integration
@Rollback
class ModulServiceSpec extends Specification {

    ModulService modulService
    SessionFactory sessionFactory

    private Long setupData() {
        Semester semester = new Semester(semesterTyp: SemesterTyp.HS, jahr: 19).save(flush: true, failOnError: true)
        new Modul(kuerzel: 'test1', credits: 3, semester: semester).save(flush: true, failOnError: true)
        new Modul(kuerzel: 'test2', credits: 3, semester: semester).save(flush: true, failOnError: true)
        new Modul(kuerzel: 'test3', credits: 3, semester: semester).save(flush: true, failOnError: true)
        new Modul(kuerzel: 'test4', credits: 3, semester: semester).save(flush: true, failOnError: true)
        Modul modul = new Modul(kuerzel: 'test', credits: 3, semester: semester).save(flush: true, failOnError: true)
        assert modul != null
        modul.id
    }

    void "test get"() {
        setupData()

        expect:
        modulService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Modul> modulList = modulService.list(max: 2, offset: 2)

        then:
        modulList.size() == 2
    }

    void "test count"() {
        setupData()

        expect:
        modulService.count() == 5
    }

    void "test delete"() {
        Long semesterId = setupData()

        expect:
        modulService.count() == 5

        when:
        modulService.delete(semesterId)
        sessionFactory.currentSession.flush()

        then:
        modulService.count() == 4
    }

    void "test save"() {
        when:
        Semester semester = new Semester(semesterTyp: SemesterTyp.HS, jahr: 20).save(flush: true, failOnError: true)
        Modul modul = new Modul(kuerzel: 'tset', credits: 3, semester: semester)
        modulService.save(modul)

        then:
        modul.id != null
    }
}
